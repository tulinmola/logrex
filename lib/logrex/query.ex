defmodule Logrex.Query do
  @moduledoc """
  Database queries module.
  """
  alias Logrex.{Message, Repo}

  def insert_message(type, content) do
    type
    |> Message.changeset(content)
    |> Repo.insert()
  end
end
