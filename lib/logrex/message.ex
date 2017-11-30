defmodule Logrex.Message do
  @moduledoc """
  Basic message schema with an id, a type and its content.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Logrex.Message

  schema "messages" do
    field :type, :string
    field :content, :map

    timestamps type: :utc_datetime
  end

  def changeset(type, content) do
    %Message{}
    |> cast(%{type: type, content: content}, [:type, :content])
    |> validate_required([:type, :content])
  end
end
