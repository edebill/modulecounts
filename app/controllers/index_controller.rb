class IndexController < ApplicationController
  def index
    @repositories = Repository.order(:name)

    response.headers['Cache-Control'] = 'public, max-age=300'
  end

end
