class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :faq, :about ]

  def home
  end

  def faq
  end

  def about
  end

  def dashboard
    @sub_users = current_user.sub_users
  end
end
