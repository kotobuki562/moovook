class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :post_set, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index_another_user, only: [:edit, :update, :destroy]

  def index
    unless user_signed_in?
      flash[:notice] = 'ようこそ！ログインはお済みですか？'
    end
    @posts = Post.includes(:user).order('created_at DESC').page(params[:page]).per(6)
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC')
  end

  def edit
    redirect_to action: :index if current_user.id != @post.user.id
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:notice] = '編集成功！'
      redirect_to post_path
    else
      flash[:notice] = '編集できませんでした'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = '投稿を削除しました'
      redirect_to root_path
    else
      flash[:notice] = '投稿削除に失敗しました'
      render :show
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    @post = Post.includes(:user).order('created_at DESC')
  end

  # def search_category
  #   @posts = Post.search(params[:keyword])
  #   @post = Post.includes(:user).order('created_at DESC')
  # end

  private

  def post_set
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def move_to_index_another_user
    redirect_to action: :index if current_user.id != @post.user.id
  end

  def post_params
    params.require(:post).permit(:image, :book_name, :category_id, :wrap_up, :impressions, :action_plan).merge(user_id: current_user.id)
  end
end
