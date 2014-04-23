class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def self.cleanup!(cutoff)
    criteria = ["demo == 'false' AND created_at < (?)", cutoff]
    Photo.destroy_all(criteria)
    Tack.destroy_all(criteria)
    Board.destroy_all(criteria)
  end
end
