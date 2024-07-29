defmodule FastIntegerCompression.Unsigned.Compressor do
  @moduledoc false

  import Bitwise

  def compress(lst) do
    size = FastIntegerCompression.Unsigned.expected_compressed_size(lst)
    arr = :array.new(size, [])

    Enum.reduce(lst, {arr, 0}, &do_compress/2)
    |> elem(0)
    |> :array.to_list()
    |> :erlang.list_to_bitstring()
  end

  defp do_compress(val, {arr, pos}) when val < 1 <<< 7 do
    arr = :array.set(pos, val, arr)

    {arr, pos + 1}
  end

  defp do_compress(val, {arr, pos}) when val < 1 <<< 14 do
    v1 = band(val, 0x7F) |> bor(0x80)
    v2 = val >>> 7

    arr = :array.set(pos, v1, arr)
    arr = :array.set(pos + 1, v2, arr)

    {arr, pos + 2}
  end

  defp do_compress(val, {arr, pos}) when val < 1 <<< 21 do
    v1 = band(val, 0x7F) |> bor(0x80)
    v2 = bor(band(val >>> 7, 0x7F), 0x80)
    v3 = val >>> 14

    arr = :array.set(pos, v1, arr)
    arr = :array.set(pos + 1, v2, arr)
    arr = :array.set(pos + 2, v3, arr)

    {arr, pos + 3}
  end

  defp do_compress(val, {arr, pos}) when val < 1 <<< 28 do
    v1 = band(val, 0x7F) |> bor(0x80)
    v2 = bor(band(val >>> 7, 0x7F), 0x80)
    v3 = bor(band(val >>> 14, 0x7F), 0x80)
    v4 = val >>> 21

    arr = :array.set(pos, v1, arr)
    arr = :array.set(pos + 1, v2, arr)
    arr = :array.set(pos + 2, v3, arr)
    arr = :array.set(pos + 3, v4, arr)

    {arr, pos + 4}
  end

  defp do_compress(val, {arr, pos}) do
    v1 = band(val, 0x7F) |> bor(0x80)
    v2 = bor(band(val >>> 7, 0x7F), 0x80)
    v3 = bor(band(val >>> 14, 0x7F), 0x80)
    v4 = bor(band(val >>> 21, 0x7F), 0x80)
    v5 = val >>> 28

    arr = :array.set(pos, v1, arr)
    arr = :array.set(pos + 1, v2, arr)
    arr = :array.set(pos + 2, v3, arr)
    arr = :array.set(pos + 3, v4, arr)
    arr = :array.set(pos + 4, v5, arr)

    {arr, pos + 5}
  end
end
