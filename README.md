# Logrex

Basic log pubsub over postgrex

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `logrex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:logrex, "~> 0.0.1"}
  ]
end
```

## Using

Console example:

```
iex> Logrex.log("test", %{foo: "bar"})
{:ok, %Logrex.Message{...}}
```
