class RepositoryController < ApplicationController
  def index
    repos = Repository.where(hidden: false).order(:name).all
    today = Time.now.to_date

    json = repos.map do |repo|
      first_checked = repo.counts.order(record_date: :asc).first.record_date.to_date
      month_date = today - 1.month + 1.day
      month_path = repository_counts_range_path(
        id: repo.id,
        start: (month_date > first_checked ? month_date : first_checked).iso8601,
        finish: today.iso8601
      )

      year_date = today - 1.year + 1.day
      year_path = repository_counts_range_path(
        id: repo.id,
        start: (year_date > first_checked ? year_date : first_checked).iso8601,
        finish: today.iso8601,
      )

      {
        id: repo.id,
        name: repo.name,
        url: repo.url,
        first_checked: first_checked.iso8601,
        counts: {
          month: month_path,
          year: year_path,
          all: repository_counts_path(id: repo.id),
        }
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
