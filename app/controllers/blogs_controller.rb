class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: { except: [:destroy, :new, :edit, :create, :update, :toggle_status] }, site_admin: :all

  def index
    if logged_in?(:site_admin)
      @blogs = Blog.page(params[:page]).per(5).order("created_at")
    else
      @blogs = Blog.published.page(params[:page]).per(5).order("created_at")
    end
    @page_title = "Blogs"
  end

  def show
    @page_title = @blog.title
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "Your blog is now live"
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "Blog was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "Blog was successfully destroyed."
  end

  def toggle_status
    @blog.draft? ? @blog.published! : @blog.draft!
    redirect_to blogs_url, notice: "Post status has been updated."
  end

  private

  def set_blog
    @blog = Blog.friendly.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
