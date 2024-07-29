defmodule FastIntegerCompression.Signed.Decompressor do
  @moduledoc false

  @spec decompress(bitstring()) :: list(integer())
  def decompress(_buf) do
    []
  end
end
