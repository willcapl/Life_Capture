class FormValidations::SubUsersController < SubUsersController
  def update
    @sub_user.assign_attributes(sub_user_params)
    @sub_user.valid?
    respond_to do |format|
      format.text do
        render partial: "sub_users/form", locals: { sub_user: @sub_user }, formats: [:html]
      end
    end
  end

  def create
    @sub_user = sub_user.new(sub_user_params)
    @sub_user.validate
    respond_to do |format|
      format.text do
        render partial: "sub_users/form", locals: { sub_user: @sub_user }, formats: [:html]
      end
    end
  end
end
