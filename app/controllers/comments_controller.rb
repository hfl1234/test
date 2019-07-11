class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy, :like, :top, :undotop, :unlike]
  before_action :set_post, only: [:show, :index, :des_all, :top, :undotop]


  # GET /comments
  def index
    @comments = @post.comments.order(location: :asc)
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    p "+++++++++++#{current_user.id}"
    post = current_user.posts.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    if @comment.save
      render json: { status: 1, notice: "新增成功", id: @comment.id.to_s, location: @comment.location, errors: [] }
    else
      render json: { status: -1, notice: "新增失败", errors: @comment.errors.full_messages }
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      render json: { status: 1, notice: "删除成功", errors: [] }
    else
      render json: { status: -1, notice: "删除失败", errors: @user.errors.fall_message }
    end
  end

  #通过Post_id删除全部评论
  def des_all
    @post.comments.destroy_all
    render json: { status: 1, notice: '全部删除成功' }
  end

  #点赞功能
  def like
    @comment.like @post
    render json: {status: 1, notice: "点赞成功"}
  end

  #撤销点赞
  def unlike
    if comment_like >0
      @comment.unlike @post
      render json: {status: 1, notice: "取消点赞成功"}
    else
      render json: {status: 1, notice: "该评论暂时没有点赞"}
    end
  end

  #置顶功能，
  def top
    @comment.update(location: 1)
    @post.comments.not_in(id: @comment.id).inc(location: 1)
    render json: {status: 1, notice: "置顶成功"}
  end

  #撤销置顶, 放在第二位，location变为2
  def undotop
    if @comment.location == 1
      @comment.update(location: 2)
      @post.comments.not_in(id: @comment.id).inc(location: 1)
      render json: {status: 1, notice: "已经撤销置顶"}
    else
      render json: {status: -1, notice: "该评论不是置顶评论，不能进行操作"}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  
    
  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comments).permit(:location, :post_comment, :comment_like)
  end
end