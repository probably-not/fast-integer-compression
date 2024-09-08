defmodule FastIntegerCompression do
  @moduledoc """
  This is an attempt at porting @lemire's FastIntegerCompression.js library to Elixir.
  The use case for this is to be able to compress things on the server side, and then push them to the frontend,
  where they can be properly decompressed, and vice versa.

  The Fast Integer Compression algorithm uses VByte compression in order to compress a list of 32-bit integers into
  an array that uses far less bytes than the original. Integers may be signed or unsigned. Unsigned integers will be
  compressed directly, while signed integers will be encoded using zigzag encoding in order to compress them properly.
  """

  import Bitwise

  @doc """
  Given a buffer of bytes that have been encoded via the Fast Integer Compression VByte compression algorithm,
  `expected_number_of_integers` will calculate how many integers should be in the decompressed list.
  """
  @spec expected_number_of_integers(buf :: binary()) :: non_neg_integer()
  def expected_number_of_integers(buf) do
    lst = :erlang.binary_to_list(buf)

    c =
      for v <- lst, reduce: 0 do
        acc -> acc + (v >>> 7)
      end

    byte_size(buf) - c
  end
end
