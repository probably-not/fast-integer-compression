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

  If your list can be dynamic and you do not know that it is signed or unsigned from the onset,
  then using the `FastIntegerCompression` functions will validate the integer types within the list
  in order to select the correct compression type.
  """

  import Bitwise

  @type integer_list() :: list(integer())
  @typep integer_type() :: :signed | :unsigned
  @typep compression_mod() :: FastIntegerCompression.Signed | FastIntegerCompression.Unsigned

  @spec compress(lst :: integer_list()) :: integer_list()
  def compress(lst), do: pipe(lst, :compress)

  @spec uncompress(lst :: integer_list()) :: integer_list()
  def uncompress(lst), do: pipe(lst, :uncompress)

  @spec expected_compressed_size(lst :: integer_list()) :: non_neg_integer()
  def expected_compressed_size(lst), do: pipe(lst, :expected_compressed_size)

  @spec expected_number_of_integers(lst :: integer_list()) :: non_neg_integer()
  def expected_number_of_integers(lst) do
    c =
      for v <- lst, reduce: 0 do
        acc -> acc + (v >>> 7)
      end

    length(lst) - c
  end

  @spec get_integer_type_from_list(lst :: integer_list()) :: integer_type()
  defp get_integer_type_from_list(lst) do
    Enum.reduce_while(lst, :unsigned, fn
      i, _acc when i < 0 -> {:halt, :signed}
      _i, _acc -> {:cont, :unsigned}
    end)
  end

  @spec get_integer_type_from_list(integer_type :: integer_type()) :: compression_mod()
  defp compression_mod(integer_type)
  defp compression_mod(:signed), do: FastIntegerCompression.Signed
  defp compression_mod(:unsigned), do: FastIntegerCompression.Unsigned

  defp pipe(lst, func) do
    lst
    |> get_integer_type_from_list()
    |> compression_mod()
    |> apply(func, [lst])
  end
end
