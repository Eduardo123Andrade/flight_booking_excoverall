defmodule FlightBookingExcoveralls do
  alias FlightBookingExcoveralls.Bookings.Agent, as: BookingAgent
  alias FlightBookingExcoveralls.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking

  alias FlightBookingExcoveralls.Users.Agent, as: UserAgent
  alias FlightBookingExcoveralls.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents() do
    UserAgent.start_link(%{})
    BookingAgent.start_link()
  end

  defdelegate create_or_update_booking(params), to: CreateOrUpdateBooking, as: :call

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
end
