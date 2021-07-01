defmodule RankingApp.Repo.Migrations.UserBelongsToClub do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :club_id, references(clubs)
    end
  end
end
