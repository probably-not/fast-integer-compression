# FastIntegerCompression

This is an attempt at porting @lemire's FastIntegerCompression.js library to Elixir. The use case for this is to be able to compress things on the server side, and then push them to the frontend, where they can be properly decompressed, and vice versa.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fast_integer_compression` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fast_integer_compression, "~> 0.0.0"}
  ]
end
```

Documentation can be found at <https://hexdocs.pm/fast_integer_compression>.

## Contributing

Contributions to this library are very much welcome! Before undertaking any substantial work, please open an issue on GitHub to discuss.

## License

@lemire's original project uses the Apache 2.0 License, which can be found here: https://github.com/lemire/FastIntegerCompression.js/blob/master/LICENSE. All attribution for building this should go to him, I'm simply porting this to Elixir in order to be able to use it on both ends of a project.

This library will also use Apache 2.0 for the sake of keeping the same license.
