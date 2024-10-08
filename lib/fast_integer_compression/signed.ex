defmodule FastIntegerCompression.Signed do
  @moduledoc """
  `FastIntegerCompression.Signed` is the module used for compression and decompression when the list of integers is
  comprised of signed 32-bit integers. This uses zigzag encoding to encode the signed integers and the compress them via
  the VByte compression algorithm.
  """

  alias __MODULE__

  @doc """
  Compresses a list of signed 32-bit integers, returning a binary buffer.
  The returned buffer can be properly decompressed by the `decompress/1` function.
  """
  @spec compress(list(integer())) :: binary()
  defdelegate compress(lst), to: Signed.Compressor

  @doc """
  Decompresses a binary buffer that has been compressed by the `compress/1` function
  into a list of signed 32-bit integers.
  """
  @spec decompress(binary()) :: list(integer())
  defdelegate decompress(buf), to: Signed.Decompressor

  @doc """
  Given a list of signed 32-bit integers, `expected_compressed_size/1` will calculate the size
  of the compressed buffer that will be generated by the `compress/1` function.
  """
  @spec expected_compressed_size(list(integer())) :: non_neg_integer()
  defdelegate expected_compressed_size(lst), to: Signed.Sizer
end
