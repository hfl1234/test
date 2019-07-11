class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = picture.all.page(params[:page])
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @posts = @picture.posts
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.create(avatar: params[:avatar])
    render json: {status: 1, id: @picture.id.to_s, notice: "新增成功W", errors: []}
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    if @picture.update(picture_params)
      render json:{status: 1, id: @picture.id.to_s, notice: "修改成功", errors: []}
    else
      render json: {status: -1, notice: "修改失败", errors: @picture.errors.fall_message}
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    if @picture.destroy
      render json: {status: 1, notice: "删除成功", errors: []}
    else
      render json: {status: -1, notice: "删除失败", errors: @picture.errors.fall_message}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:avatar)
    end
  end
