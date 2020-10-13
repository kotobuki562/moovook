class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :move_to_index, except: [:index, :show]
  # before_action :post_set, omly: [:show]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private

  # def post_set
  #   @post = Post.find(params[:id])
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def post_params
    params.require(:post).permit(:image, :book_name, :category_id, :wrap_up, :impressions, :action_plan).merge(user_id: current_user.id)
  end
end
