class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :date_loaded

private
  def date_loaded
    return Time.now
  end

end
