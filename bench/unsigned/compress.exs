import FastIntegerCompression.Bench.Util

small = gen_unsigned(100)
medium = gen_unsigned(1000)
large = gen_unsigned(10_000)
huge = gen_unsigned(100_000)
mega = gen_unsigned(1_000_000)
# extreme = gen_unsigned(1_000_000_000)

Benchee.run(
  %{
    "small" => fn -> FastIntegerCompression.Unsigned.compress(small) end,
    "medium" => fn -> FastIntegerCompression.Unsigned.compress(medium) end,
    "large" => fn -> FastIntegerCompression.Unsigned.compress(large) end,
    "huge" => fn -> FastIntegerCompression.Unsigned.compress(huge) end,
    "mega" => fn -> FastIntegerCompression.Unsigned.compress(mega) end
    # "extreme" => fn -> FastIntegerCompression.Unsigned.compress(extreme) end
  },
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "BENCHMARK_RESULTS.md"}
  ]
)
