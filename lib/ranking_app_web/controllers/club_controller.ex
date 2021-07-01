defmodule RankingAppWeb.ClubController do
  use RankingAppWeb, :controller

  alias RankingApp.Account
  alias RankingApp.Account.Club

  action_fallback RankingAppWeb.FallbackController

  def index(conn, _params) do
    clubs = Account.list_clubs()
    render(conn, "index.json", clubs: clubs)
  end

  def create(conn, %{"club" => club_params}) do
    with {:ok, %Club{} = club} <- Account.create_club(club_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.club_path(conn, :show, club))
      |> render("show.json", club: club)
    end
  end

  def show(conn, %{"id" => id}) do
    club = Account.get_club!(id)
    render(conn, "show.json", club: club)
  end

  def update(conn, %{"id" => id, "club" => club_params}) do
    club = Account.get_club!(id)

    with {:ok, %Club{} = club} <- Account.update_club(club, club_params) do
      render(conn, "show.json", club: club)
    end
  end

  def delete(conn, %{"id" => id}) do
    club = Account.get_club!(id)

    with {:ok, %Club{}} <- Account.delete_club(club) do
      send_resp(conn, :no_content, "")
    end
  end
end
