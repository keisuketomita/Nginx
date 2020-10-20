class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid
  end
  def create
    @blog = Blog.new(blog_params)
    if @bog.save
      redirect_to blogs_path, notice: "ブログを投稿しました"
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, "ブログを編集しました"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:content)
  end
  def set_blog
    @blog = blog.find(params[:id])
  end
end