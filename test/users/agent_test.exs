defmodule FlightBookingExcoveralls.Users.AgentTest do
  use ExUnit.Case

  import FlightBookingExcoveralls.Factory

  alias FlightBookingExcoveralls.Users.Agent, as: UserAgent
  # alias FlightBookingExcoveralls.Users.User

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link()
      :ok
    end

    test "when the user is found, return the user" do
      user = build(:user)

      UserAgent.save(user)

      response = UserAgent.get(user.id)
      expected_response = {:ok, user}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      wrong_id = UUID.uuid4()

      :user
      |> build
      |> UserAgent.save()

      response = UserAgent.get(wrong_id)
      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end

  describe "get_all/0" do
    test "List all users" do
      UserAgent.start_link()

      :user
      |> build()
      |> UserAgent.save()

      response =
        UserAgent.get_all()
        |> Enum.count()

      expected_response = 1

      assert expected_response == response
    end
  end
end
