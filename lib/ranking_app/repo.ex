defmodule RankingApp.Repo do
  use Ecto.Repo,
    otp_app: :ranking_app,
    adapter: Ecto.Adapters.Postgres
end
