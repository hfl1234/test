class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:show, :update, :destroy]

  # GET /hobbies
  # GET /hobbies.json
  def index
    @hobbies = Hobby.all
  end

  # GET /hobbies/1
  # GET /hobbies/1.json
  def show
  end

  # POST /hobbies
  # POST /hobbies.json
  def create
    p "+++++++++++#{current_user.id}"
    @hobby = current_user.hobbies.new(hobby_params.merge(writter: current_user.name))

    if @hobby.save
      render json: {status: 1, notice: "新增成功,吃是：#{@hobby.like_eat.capitalize}", errors: []}
    else
      render json: {status: -1, notice: "新增失败，请先登录"}
    end
  end

  # PATCH/PUT /hobbies/1
  # PATCH/PUT /hobbies/1.json
  def update
    if @hobby.update(hobby_params)
      render json: {status: 1, notice: "修改成功", errors: [] }
    else
      render json: {status: -1, notice: "修改失败", errors: @user.errors.fall_message}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hobby
      @hobby = Hobby.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hobby_params
      params.require(:hobby).permit(:like_eat, :like_sport)
    end
end
