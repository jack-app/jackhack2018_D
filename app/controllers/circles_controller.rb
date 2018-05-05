class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy, :new_member, :create_member]
  before_action :require_login

  # GET /circles
  # GET /circles.json
  def index
    @circles = Circle.all
  end

  # GET /circles/1
  # GET /circles/1.json
  def show
    gon.image_path = @circle.id
  end

  # GET /circles/new
  def new
    @circle = Circle.new
    set_available_tags_to_gon
  end

  # GET /circles/1/edit
  def edit
    gon.tag_list = @circle.tags
    set_available_tags_to_gon
  end

  # POST /circles
  # POST /circles.json
  def create
    @circle = Circle.new(circle_params)
    if @circle.save
      @user_circle = UsersCircle.new(user_id: current_user.id, circle_id: @circle.id)
      set_tags @circle
      if @user_circle.save
        redirect_to @circle, notice: 'Circle was successfully created.'
      else
        render :new
      end
    else
      render :new
    end
  end

  # PATCH/PUT /circles/1
  # PATCH/PUT /circles/1.json
  def update
    if @circle.update(circle_params)
      set_tags @circle
      redirect_to @circle, notice: 'Circle was successfully updated.'
    else
      render :edit
    end
  end

  def new_member
  end

  def create_member
    @user_circle = UsersCircle.new(user_id: User.find_by(email: params[:new_member][:email]).id, circle_id: @circle.id)
    if @user_circle.save
      redirect_to @circle, notice: 'Circle was successfully created.'
    else
      flash.now[:danger] = "そのメールアドレスは間違っています"
      render :new_member
    end
  end

  # DELETE /circles/1
  # DELETE /circles/1.json
  def destroy
    @circle.destroy
    redirect_to circles_url, notice: 'Circle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end
    def set_tags(circle)
      circle.circles_tags.destroy_all
      params[:circle][:tag_list].split(",").each do |name|
        tag = Tag.find_by(name: name)
        tag = Tag.create(name: name) unless tag
        CirclesTag.create(circle_id: circle.id, tag_id: tag.id)
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def circle_params
      params.require(:circle).permit(:name, :profile, :intercollege, :cost)
    end
end
