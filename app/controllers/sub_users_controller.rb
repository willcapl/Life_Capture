class SubUsersController < ApplicationController
  def show
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
    @questions = @questions.sort_by { |question| question.answer_date }
    @dates = @questions.each_with_index.map { |question, index| question.answer_date if index % 2 == 0}.compact
  end

  def new
    @sub_user = SubUser.new
  end

  def other_new
    @sub_user = SubUser.new
  end

  def create
    sleep(7)
    @sub_user = SubUser.new(sub_user_params)
    @sub_user.user = current_user
    if @sub_user.save
      @sub_user.content
      redirect_to sub_user_path(@sub_user)
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
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  def stories
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  def film
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  def book
    @sub_user = SubUser.find(params[:id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  private

  def sub_user_params
    params.require(:sub_user).permit(:name, :dob, :childhood_location, :education, :career, :adult_life_location, :hobbies, :photo)
  end

end
