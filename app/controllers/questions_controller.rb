class QuestionsController < ApplicationController
  def index
    @sub_user = SubUser.find(params[:sub_user_id])
    @questions = Question.where(sub_user_id: @sub_user.id)
  end

  def show
    @sub_user = SubUser.find(params[:sub_user_id])
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @sub_user = @question.sub_user
    p params
    p question_params
    respond_to do |format|

      if @question.update(question_params)
        p @question.video
        p @question.video.attached?
        p @question.video_thumbnail
        p @question.video_thumbnail.attached?
        redirect_to sub_user_show_path(@sub_user)
        format.html { render :show, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to sub_user_show_path(@question.sub_user), status: :see_other
  end

  private

  def question_params
    params.require(:question).permit(:title, :video, :video_thumbnail)
  end
end
