class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_trip
    Trip.find(session[:trip_id])
  rescue ActiveRecord::RecordNotFound
    trip = Trip.create
    session[:trip_id] = trip.id
  end
end
