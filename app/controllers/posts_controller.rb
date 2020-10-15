class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :post_set, only: [:show,:edit,:update,:destroy]
  before_action :move_to_index_another_user, only:[:edit,:update,:destroy]
  # before_action :liked_by?

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id

    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
    
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
    if current_user.id != @post.user.id
      redirect_to action: :index
    end
  end

  def update
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
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to root_path
    else
      flash[:notice] = "投稿削除に失敗しました"
      render :show
    end
  end

  private

  def post_set
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_index_another_user
    if current_user.id != @post.user.id
      redirect_to action: :index
    end
  end

  # def liked_by?(post_id)
  #   likes.where(post_id: post_id).exists?
  # end

  def post_params
    params.require(:post).permit(:image, :book_name, :category_id, :wrap_up, :impressions, :action_plan).merge(user_id: current_user.id)
  end
end
