class PagesController < ApplicationController
  before_action :require_admin, only: [:bench]

  def home
    @user = User.new
  end

  def bench
    @warmers = Warmer.all
  end

  private

  def require_user
    redirect_to root_url unless current_user
  end
end
