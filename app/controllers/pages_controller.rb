class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :faq ]

  def home
  end

  def faq
  end

  def dashboard
    current_user.sub_users
  end
end
