class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.page(params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @posts = @user.posts
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {status: 1, id: @user.id.to_s, notice: "新增成功W", errors: []}
    else
      render json: {status: -1, notice: "新增失败", errors: @user.errors.full_messages}
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render json:{status: 1, id: @user.id.to_s, notice: "修改成功", errors: []}
    else
      render json: {status: -1, notice: "修改失败", errors: @user.errors.full_messages}
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.destroy
      render json: {status: 1, notice: "删除成功", errors: []}
    else
      render json: {status: -1, notice: "删除失败", errors: @user.errors.fall_message}
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :age, :address, :password)
  end
end