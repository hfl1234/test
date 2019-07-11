class UtilsController<ApplicationController

  def del_all
    Post.destroy_all
    User.destroy_all
    Comment.destroy_all
    render json: {status: 1, notice: "全部删除成功", errors:[]}
  end
end