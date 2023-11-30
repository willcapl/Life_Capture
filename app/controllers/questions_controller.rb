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
        format.html { render :show, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :video)
  end
end
