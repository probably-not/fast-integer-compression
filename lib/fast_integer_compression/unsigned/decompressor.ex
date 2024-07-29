defmodule FastIntegerCompression.Unsigned.Decompressor do
  @moduledoc false

  @spec decompress(bitstring()) :: list(non_neg_integer())
  def decompress(_buf) do
    []
  end
end
