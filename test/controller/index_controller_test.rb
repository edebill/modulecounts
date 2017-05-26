require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get csv" do
    CsvExport.create(csv: "1,2,3\n4,5,6")
    get :index, format: :csv
    assert_response :success
  end
end
