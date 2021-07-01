defmodule RankingAppWeb.ClubView do
  use RankingAppWeb, :view
  alias RankingAppWeb.ClubView

  def render("index.json", %{clubs: clubs}) do
    %{data: render_many(clubs, ClubView, "club.json")}
  end

  def render("show.json", %{club: club}) do
    %{data: render_one(club, ClubView, "club.json")}
  end

  def render("club.json", %{club: club}) do
    %{id: club.id,
      city: club.city,
      name: club.name,
      postalcode: club.postalcode}
  end
end
