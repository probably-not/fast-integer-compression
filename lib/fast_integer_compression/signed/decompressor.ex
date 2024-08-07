defmodule FastIntegerCompression.Signed.Decompressor do
  @moduledoc false

  import Bitwise
  alias FastIntegerCompression.Utils

  @spec decompress(binary()) :: list(non_neg_integer())
  def decompress(buf) do
    pos = 0
    size = byte_size(buf)
    acc = []
    do_decompress(buf, pos, size, acc)
  end

  defp do_decompress(_buf, pos, size, acc) when pos >= size, do: Enum.reverse(acc)

  defp do_decompress(buf, pos, size, acc) do
    <<_already_decoded::binary-size(pos), c::signed-integer-8, _rest::binary>> = buf
    {v, new_pos} = decode_value(buf, pos, band(c, 0x7F))
    decoded = Utils.zigzag_decode(v)
    do_decompress(buf, new_pos, size, [decoded | acc])
  end

  defp decode_value(buf, pos, v) do
    <<_already_decoded::binary-size(pos), c::signed-integer-8, _rest::binary>> = buf

    if c >= 0 do
      {v, pos + 1}
    else
      decode_value_loop(buf, pos + 1, v, 7)
    end
  end

  defp decode_value_loop(buf, pos, prev, 28) do
    <<_already_decoded::binary-size(pos), c::signed-integer-8, _rest::binary>> = buf
    v = bor(prev, c <<< 28)
    v = v >>> 0
    {v, pos + 1}
  end

  defp decode_value_loop(buf, pos, prev, shift) do
    <<_already_decoded::binary-size(pos), c::signed-integer-8, _rest::binary>> = buf
    v = bor(prev, band(c, 0x7F) <<< shift)

    if c >= 0 do
      {v, pos + 1}
    else
      decode_value_loop(buf, pos + 1, v, shift + 7)
    end
  end
end
