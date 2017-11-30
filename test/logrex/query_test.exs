defmodule Logrex.QueryTest do
  use Logrex.DataCase

  alias Logrex.{Message, Query}
  alias Ecto.Changeset

  test "insert valid message" do
    assert {:ok, %Message{} = message} =
            Query.insert_message("test", %{hello: "world"})

    assert Repo.get(Message, message.id)
    assert message.type == "test"
    assert message.content == %{hello: "world"}
  end

  test "doesn't insert a non valid message" do
    assert {:error, %Changeset{} = changeset} =
            Query.insert_message(:not_a_string, "not a hash")

    assert "is invalid" in errors_on(changeset).type
    assert "is invalid" in errors_on(changeset).content
  end
end
