defmodule RankingApp.Repo.Migrations.CreateClubs do
  use Ecto.Migration

  def change do
    create table(:clubs) do
      add :name, :string
      add :city, :string
      add :postalcode, :integer

      timestamps()
    end

  end
end
