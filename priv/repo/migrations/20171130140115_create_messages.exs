defmodule Logrex.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :type, :string, null: false
      add :content, :map, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
