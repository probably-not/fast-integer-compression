defmodule FastIntegerCompression.Signed do
  @moduledoc false

  alias __MODULE__

  @spec compress(list(integer())) :: bitstring()
  defdelegate compress(lst), to: Signed.Compressor

  @spec decompress(bitstring()) :: list(integer())
  defdelegate decompress(buf), to: Signed.Decompressor

  @spec expected_compressed_size(list(integer())) :: non_neg_integer()
  defdelegate expected_compressed_size(buf), to: Signed.Sizer
end
