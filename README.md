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
iex> Logrex.subscribe("test")
:ok
iex> Logrex.log("test", %{foo: "bar"})
{:ok, %Logrex.Message{content: %{foo: "bar"}, id: 1, type: "test", ...}}
iex> flush
%Logrex.Message{content: %{foo: "bar"}, id: 1, type: "test", ...}
:ok
iex> Logrex.log("other", %{foo: "bar"})
{:ok, %Logrex.Message{content: %{foo: "bar"}, id: 1, type: "other", ...}}
iex> flush
:ok
```
