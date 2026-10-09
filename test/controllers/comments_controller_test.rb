require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @idea = @comment.idea
  end

  test "should get edit" do
    get edit_idea_comment_url(@idea, @comment)

    assert_response :success
  end

  test "should update comment" do
    patch idea_comment_url(@idea, @comment), params: {
      comment: { user_name: "Updated name", body: "Updated comment" }
    }

    assert_redirected_to idea_url(@idea)
    assert_equal "Updated name", @comment.reload.user_name
    assert_equal "Updated comment", @comment.body
  end
end