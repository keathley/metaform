defmodule Metaform.Repo.Migrations.CreateWidgets do
  use Ecto.Migration

  def change do
    create table(:widgets) do
      add :metadata, :map

      timestamps()
    end
  end
end
