defmodule FastIntegerCompression.Unsigned.Decompressor do
  @moduledoc false

  @spec decompress(bitstring()) :: list(non_neg_integer())
  def decompress(buf) do
    lst = :erlang.bitstring_to_list(buf)
    size = :erlang.size(buf)

    Enum.reduce_while(lst, {[], 0, size}, &do_decompress/2)
  end

  defp do_decompress(_val, {lst, pos, size}) when size <= pos do
    {:halt, lst}
  end

  defp do_decompress(_val, {_lst, _pos, _size}) do
  end
end
