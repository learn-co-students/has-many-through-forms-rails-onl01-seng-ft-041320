class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
