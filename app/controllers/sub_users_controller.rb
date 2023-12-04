class SubUsersController < ApplicationController
  def show
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  def new
    @sub_user = SubUser.new
  end

  def other_new
    @sub_user = SubUser.new
  end

  def create
    @sub_user = SubUser.new(sub_user_params)
    @sub_user.user = current_user
    if @sub_user.save
      @sub_user.content
      redirect_to sub_user_questions_path(@sub_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sub_user = SubUser.find(params[:id])
  end

  def update
    @sub_user = SubUser.find(params[:id])
    if @sub_user.update(sub_user_params)
      redirect_to @sub_user
    else
      render :edit
    end
  end

  def destroy
    @sub_user = SubUser.find(params[:id])
    @sub_user.destroy
    redirect_to dashboard_path
  end

  def update_avatar
    @sub_user = current_user.sub_users.find(params[:id])
    if @sub_user.update(sub_user_params)
      flash[:success] = "Avatar Updated Successfully"
    else
      flash[:error] = "Error updating avatar"
    end
    redirect_to sub_user
  end

  def playlists
  end

  def stories
  end

  def film
  end

  def book
  end

  private

  def sub_user_params
    params.require(:sub_user).permit(:name, :relationship_to_user, :dob, :childhood_location, :post_education, :birthplace, :career, :adult_life_location, :hobbies, :life_after_retirement, :photo)
  end

end
