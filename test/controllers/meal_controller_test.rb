require "test_helper"

class MealControllerTest < ActionDispatch::IntegrationTest
  test "should get food" do
    get meal_food_url
    assert_response :success
  end
end
