class IndexController < ApplicationController
  def index
    @repositories = Repository.order(:name)
  end

end
