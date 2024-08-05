defmodule FastIntegerCompression.Signed.Decompressor do
  @moduledoc false

  @spec decompress(binary()) :: list(integer())
  def decompress(_buf) do
    []
  end
end
