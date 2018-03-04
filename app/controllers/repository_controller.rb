class RepositoryController < ApplicationController
  def index
    repos = Repository.where(hidden: false).order(:name).all
    json = repos.map do |repo|
      {
        id: repo.id,
        name: repo.name,
        url: repo.url,
        first_checked: repo.counts.order(record_date: :asc).first.record_date.to_date.iso8601,
      }
    end

    response.headers['Cache-Control'] = 'public, max-age=300'
    render json: json
  end

  def counts
    repo = Repository.find(params[:id])

    counts = if params[:start] && params[:finish]
               repo.counts.where("record_date > ? and record_date < ?",
                                 Date.parse(params[:start]).beginning_of_day,
                                 Date.parse(params[:finish]).end_of_day
                                ).order(:record_date).all
             else
               repo.counts.order(:record_date).all
             end

    json = counts.map do |count|
      {
        value: count.value,
        date: count.record_date.to_date.iso8601
      }
    end

    response.headers['Cache-Control'] = 'public, max-age=300'
    render json: json
  end
end
