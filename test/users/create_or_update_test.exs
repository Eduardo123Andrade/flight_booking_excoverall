defmodule FlightBookingExcoveralls.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import FlightBookingExcoveralls.Factory

  alias FlightBookingExcoveralls.Users.CreateOrUpdate
  alias FlightBookingExcoveralls.Users.Agent, as: UserAgent

  describe "call/1" do
    test "when all params are valid, save the user" do
      UserAgent.start_link(%{})

      response =
        :user
        |> build
        |> CreateOrUpdate.call()

      expected_response = {:ok, "User created or updated successfully"}

      assert expected_response == response
    end
  end
end
