defmodule FastIntegerCompression do
  @moduledoc """
  This is an attempt at porting @lemire's FastIntegerCompression.js library to Elixir.
  The use case for this is to be able to compress things on the server side, and then push them to the frontend,
  where they can be properly decompressed, and vice versa.

  The Fast Integer Compression algorithm uses VByte compression in order to compress a list of small integers into
  an array that uses far less bytes than the original.

  The fastest path is using the submodules, `FastIntegerCompression.Signed` and `FastIntegerCompression.Unsigned`.
  These are optimized to compress either signed or unsigned integers. However, they assume that the user has validated
  that the integers are all correctly signed - i.e. if using `FastIntegerCompression.Signed`, you may have both positive
  and negative integers, however, using `FastIntegerCompression.Unsigned`, you must have only positive integers.
  """

  import Bitwise

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
