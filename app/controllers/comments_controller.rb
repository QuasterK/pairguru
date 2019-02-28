class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_movie

  def new
  end

  def create
    @comment = @movie.comments.build(comments_params)
      unless @comment.save
         flash[:alert] = @comment.errors.full_messages.join('<br>')
      end
      redirect_to post_path(@post)
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
  def find_movie
       @movie = Movie.find(params[:movie_id])
   end
  def comments_params
  params.require(:comment).permit(:description).merge({
    user_id: current_user.id
  })

end
