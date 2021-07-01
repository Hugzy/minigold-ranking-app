defmodule RankingApp.Account.Club do
  use Ecto.Schema
  import Ecto.Changeset

  alias RankingApp.Account.User

  schema "clubs" do
    field :city, :string
    field :name, :string
    field :postalcode, :integer
    has_many :users, User
    timestamps()
  end

  @doc false
  def changeset(club, attrs) do
    club
    |> cast(attrs, [:name, :city, :postalcode])
    |> validate_required([:name, :city, :postalcode])
  end
end
