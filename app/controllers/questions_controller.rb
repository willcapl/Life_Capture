class QuestionsController < ApplicationController
  def index
    @sub_user = SubUser.find(params[:sub_user_id])
    @question = Question.where(sub_user_id: @sub_user.id)
  end
end
