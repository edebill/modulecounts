require 'test_helper'

class RepositoryControllerTest < ActionController::TestCase
  test "gets list of repositories" do
    get :index

    assert_response :success

    repos = JSON.parse(response.body)

    assert_equal(2, repos.length, "wrong number of repos")

    repo = repos.first
    assert_equal("Ada", repo["name"], "wrong repo name")
    assert_not_nil(repo["counts"], "didn't have counts")
    assert_not_nil(repo.dig("counts", "month"), "didn't have month counts")
    assert_not_nil(repo.dig("counts", "year"), "didn't have year counts")
    assert_not_nil(repo.dig("counts", "all"), "didn't have all counts")
  end

  test "get all counts for a repository" do
    get :counts, params: { id: 1 }, format: "json"

    assert_response :success

    counts = JSON.parse(response.body)
    assert_equal(3, counts.length)
  end

  test "get 2 counts for a repository" do
    params = {
      id: 1,
      start: 2.days.ago.to_date.iso8601,
      finish: 1.days.ago.to_date.iso8601,
    }

    get :counts, params: params, format: "json"

    assert_response :success

    counts = JSON.parse(response.body)
    assert_equal(2, counts.length)
    assert_equal(2, counts.dig(0, "value"))
  end
end
