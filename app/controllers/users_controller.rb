class UsersController < ApplicationController
  before_action :unless_login, only: [:new, :create]
  before_action :require_login, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    set_available_tags_to_gon
  end

  # GET /users/1/edit
  def edit
    gon.tag_list = current_user.tags
    set_available_tags_to_gon
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      set_tags @user
      login @user
      redirect_to account_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if current_user.update(user_params)
      set_tags current_user
      redirect_to current_user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_tags(user)
      user.users_tags.destroy_all
      params[:user][:tag_list].split(",").each do |name|
        tag = Tag.find_by(name: name)
        tag = Tag.create(name: name) unless tag
        UsersTag.create(user_id: user.id, tag_id: tag.id)
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:display_name, :family_name, :first_name, :email, :student_number, :phone, :password, :password_confirmation)
    end
end
