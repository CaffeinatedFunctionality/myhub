class DashboardController < ApplicationController

  has_widgets do |root|
    root << widget(:stockfeed)
  end 

  def index
  end
end
