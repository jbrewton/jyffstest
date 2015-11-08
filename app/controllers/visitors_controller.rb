class VisitorsController < ApplicationController
  def index
    @name = cookies['name']
  end
end
