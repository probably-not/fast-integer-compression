defmodule FastIntegerCompression.Unsigned do
  @moduledoc false

  alias __MODULE__

  @spec compress(list(non_neg_integer())) :: bitstring()
  defdelegate compress(lst), to: Unsigned.Compressor

  @spec decompress(bitstring()) :: list(non_neg_integer())
  defdelegate decompress(buf), to: Unsigned.Decompressor

  @spec expected_compressed_size(list(non_neg_integer())) :: non_neg_integer()
  defdelegate expected_compressed_size(buf), to: Unsigned.Sizer
end
