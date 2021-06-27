defmodule RankingAppWeb.HelloController do
  use RankingAppWeb, :controller

  def index(conn, _params) do
    json(conn, "Hello WorldHello WorldHello WorldHello WorldHello World")
  end
end
