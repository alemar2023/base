class PagesController < ApplicationController

  def home

  end

  def dashboard
    before_action :authenticate_user!
    before_action :check_permission, only: [:dashboard]
  end

  private
  def check_permission
    if current_user.role != 'admin'
      redirect_to root_path
    end
  end
end
