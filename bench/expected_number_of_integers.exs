Benchee.run(
  %{
    "small" => fn -> Enum.flat_map(list, map_fun) end,
    "medium" => fn -> list |> Enum.map(map_fun) |> List.flatten() end,
    "large" => fn -> list |> Enum.map(map_fun) |> List.flatten() end,
    "huge" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
  },
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "BENCHMARK_RESULTS.md"}
  ]
)
