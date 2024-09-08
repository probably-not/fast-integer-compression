defmodule FastIntegerCompression.Unsigned do
  @moduledoc """
  `FastIntegerCompression.Unsigned` is the module used for compression and decompression when the list of integers is known to be
  comprised of only unsigned 32-bit integers. This utilizes the compression algorithm in a raw way, simply taking the integers and
  directly compressing them. If you know that your input is comprised of all unsigned integers, this is the fastest solution for compression.

  If you cannot be certain the your list is comprised of only unsigned integers, and you may have signed integers, you should use the
  `FastIntegerCompression.Signed` module, which uses zigzag encoding in order to ensure that all values are compressed properly.
  """

  alias __MODULE__

  @doc """
  Compresses a list of unsigned 32-bit integers, returning a binary buffer.
  The returned buffer can be properly decompressed by the `decompress/1` function.
  """
  @spec compress(list(non_neg_integer())) :: binary()
  defdelegate compress(lst), to: Unsigned.Compressor

  @doc """
  Decompresses a binary buffer that has been compressed by the `compress/1` function
  into a list of unsigned 32-bit integers.
  """
  @spec decompress(binary()) :: list(non_neg_integer())
  defdelegate decompress(buf), to: Unsigned.Decompressor

  @doc """
  Given a list of unsigned 32-bit integers, `expected_compressed_size/1` will calculate the size
  of the compressed buffer that will be generated by the `compress/1` function.
  """
  @spec expected_compressed_size(list(non_neg_integer())) :: non_neg_integer()
  defdelegate expected_compressed_size(lst), to: Unsigned.Sizer
end
