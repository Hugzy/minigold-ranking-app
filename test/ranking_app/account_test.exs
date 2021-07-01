defmodule RankingApp.AccountTest do
  use RankingApp.DataCase

  alias RankingApp.Account

  describe "users" do
    alias RankingApp.Account.User

    @valid_attrs %{email: "some email", is_active: true, password: "some password"}
    @update_attrs %{
      email: "some updated email",
      is_active: false,
      password: "some updated password"
    }
    @invalid_attrs %{email: nil, is_active: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    def user_without_password(attrs \\ %{}) do
      %{user_fixture(attrs) | password: nil}
    end

    test "list_users/0 returns all users" do
      user = user_without_password()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_without_password()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.is_active == true
      assert Bcrypt.verify_pass("some password", user.password_hash)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_without_password()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.is_active == false
      assert Bcrypt.verify_pass("some updated password", user.password_hash)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_without_password()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_without_password()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_without_password()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end

    test "authenticate_user/2 authenticates the user" do
      user = user_without_password()

      assert {:error, "Wrong email or password"} = Account.authenticate_user("wrong email", "")
      assert {:ok, authenticated_user} = Account.authenticate_user(user.email, @valid_attrs.password)
      assert user == authenticated_user
    end

  end

  describe "clubs" do
    alias RankingApp.Account.Club

    @valid_attrs %{city: "some city", name: "some name", postalcode: 42}
    @update_attrs %{city: "some updated city", name: "some updated name", postalcode: 43}
    @invalid_attrs %{city: nil, name: nil, postalcode: nil}

    def club_fixture(attrs \\ %{}) do
      {:ok, club} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_club()

      club
    end

    test "list_clubs/0 returns all clubs" do
      club = club_fixture()
      assert Account.list_clubs() == [club]
    end

    test "get_club!/1 returns the club with given id" do
      club = club_fixture()
      assert Account.get_club!(club.id) == club
    end

    test "create_club/1 with valid data creates a club" do
      assert {:ok, %Club{} = club} = Account.create_club(@valid_attrs)
      assert club.city == "some city"
      assert club.name == "some name"
      assert club.postalcode == 42
    end

    test "create_club/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_club(@invalid_attrs)
    end

    test "update_club/2 with valid data updates the club" do
      club = club_fixture()
      assert {:ok, %Club{} = club} = Account.update_club(club, @update_attrs)
      assert club.city == "some updated city"
      assert club.name == "some updated name"
      assert club.postalcode == 43
    end

    test "update_club/2 with invalid data returns error changeset" do
      club = club_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_club(club, @invalid_attrs)
      assert club == Account.get_club!(club.id)
    end

    test "delete_club/1 deletes the club" do
      club = club_fixture()
      assert {:ok, %Club{}} = Account.delete_club(club)
      assert_raise Ecto.NoResultsError, fn -> Account.get_club!(club.id) end
    end

    test "change_club/1 returns a club changeset" do
      club = club_fixture()
      assert %Ecto.Changeset{} = Account.change_club(club)
    end
  end
end
