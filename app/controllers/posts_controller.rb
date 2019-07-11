class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :top, :undotop, :like, :unlike]


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @posts = @posts.where(user_id: params[:user_id]) unless params[:user_id].blank?
    @posts = @posts.order(number: :asc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.inc(view_count: 1)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params.merge(writter: current_user.name))

    if @post.save
      render json: {status: 1, id: @post.id.to_s, notice: "新增成功，标题是：#{@post.title.capitalize}", number: @post.number, errors: []}
    else
      render json: {status: -1, notice: "新增失败，请先登录", errors: @post.errors.full_messages}
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render json: {status: 1, id: @post.id.to_s, notice: "修改成功，标题是：#{@post.title.capitalize}", errors: []}
    else
      render json: {status: -1, notice: "修改失败", errors: @post.errors.fall_message}
    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.destroy
      render json: {status: 1, notice: "删除成功", errors: []}
    else
      render json: {status: -1, notice: "删除失败", errors: @post.errors.fall_message}     
    end
  end

  #文章置顶操作
  def top
    @post.update(number: 1)
    Post.not_in(id: @post.id).inc(number: 1)
    render json: {status: 1, notice: "置顶成功"}
  end

  #撤销置顶
  def undotop
    if @post.number == 1
      @post.update(number: 2)
      Post.not_in(id: @post.id).inc(number: 1)
      render json: {status: 1, notice: "撤销置顶"}
    else
      render json: {status: -1, notice: "该文章不是置顶文章，撤销无效"}
    end
  end

  #文章点赞
  def like
    @post.like @user
    render json: {status: 1, notice: @post.likes}
  end

   #撤销点赞
  def unlike
    @post.unlike @user
    render json: {status: 1, notice: "取消点赞成功,现在点赞数为#{@post.likes}"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :writter, :view_count)
    end
end