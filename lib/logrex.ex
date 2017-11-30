defmodule Logrex do
  @moduledoc """
  Logrex public API.
  """

  alias Logrex.Query

  @doc """
  Logs message to given channel by type with content.

  This function returns `{:ok, message}` when message is stored or
  `{:error, changeset}` when an error ocurred.

  ## Examples

      iex> {:ok, message} = Logrex.log("foo", %{foo: "bar"})
      iex> message.type == "foo"
      true
      iex> message.content == %{foo: "bar"}
      true

      iex> {:error, changeset} = Logrex.log(:not_a_string, "not a hash")
      iex> changeset.errors
      [type: {"is invalid", [type: :string, validation: :cast]},
       content: {"is invalid", [type: :map, validation: :cast]}]

  """
  def log(type, message) do
    Query.insert_message(type, message)
  end
end
