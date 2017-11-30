defmodule Logrex do
  @moduledoc """
  Logrex public API.
  """

  alias Logrex.{Channels, Query, Repo}
  alias Ecto.Multi

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
    transaction = Multi.new
      |> Multi.run(:message, fn _ -> Query.insert_message(type, message) end)
      |> Multi.run(:broadcast, &Channels.broadcast(&1.message))
      |> Repo.transaction()

    case transaction do
      {:ok, %{message: message}} -> {:ok, message}
      {:error, _failed_operation, failed_value, _changes_so_far} -> {:error, failed_value}
    end
  end

  @doc """
  Subscribes to a channel. Messages will come to subscriptor pid in the form of
  `{:message, %{type: "foo", id: 1, content: %{...}}}`.

  This function returns `:ok` when subscription was correct.

  ## Examples

      iex> Logrex.subscribe("foo")
      :ok

  """
  def subscribe(type) do
    Channels.subscribe(type)
  end
end
