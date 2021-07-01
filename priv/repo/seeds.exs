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

{:ok, User1} = RankingApp.Account.create_user(%{email: "user2@email.com", password: "oaijdsf"})
{:ok, User2} = RankingApp.Account.create_user(%{email: "user3@email.com", password: "asdfgh"})
{:ok, User3} = RankingApp.Account.create_user(%{email: "some@email.com", password: "some password"})

IO.puts(User1)
IO.puts(User2)
IO.puts(User3)

#RankingApp.Account.create_club(%{city: "Odense", name: "Bolbro minigolf club", postalcode: 5000})
