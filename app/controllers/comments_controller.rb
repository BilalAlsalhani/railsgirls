class CommentsController < ApplicationController
  before_action :set_idea, only: %i[create edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.new
  end

  def create
    @comment = @idea.comments.new(comment_params)

    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment was successfully created."
    else
     render :new, status: :unprocessable_entity
    end
  end
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @idea, notice: "Comment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @comment.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @comment.destroy

    redirect_to idea_path(@idea), notice: "Comment was successfully destroyed."
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def set_comment
    @comment = @idea.comments.find(params[:id])
  end


  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end
