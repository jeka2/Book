require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get user:belongs_to" do
    get books_user:belongs_to_url
    assert_response :success
  end

end
