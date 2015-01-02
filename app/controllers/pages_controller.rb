class PagesController < ApplicationController
  def home
    @user = User.new
  end

  def bench
    @warmers = Warmer.all
  end
end
