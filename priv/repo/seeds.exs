# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RankingApp.Repo.insert!(%RankingApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

IO.puts("Adding a couple of users...")

RankingApp.Account.create_user(%{email: "user2@email.com", password: "oaijdsf"})
RankingApp.Account.create_user(%{email: "user3@email.com", password: "asdfgh"})
RankingApp.Account.create_user(%{email: "some@email.com", password: "some password"})
