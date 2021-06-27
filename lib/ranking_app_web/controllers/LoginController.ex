defmodule RankingAppWeb.LoginController do
  use RankingAppWeb, :controller

  alias RankingAppWeb.User

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    json(conn, user)
  end

  def new(conn, _params) do
    # TODO
  end
end
