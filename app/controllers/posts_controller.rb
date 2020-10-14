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
    @post = Post.find(params[:id])
      redirect_to action: :index if current_user.id != @post.user.id
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "編集成功！"
      redirect_to post_path
    else
      flash[:notice] = "編集できませんでした"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to root_path
    else
      flash[:notice] = "投稿削除に失敗しました"
      render :show
    end
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
