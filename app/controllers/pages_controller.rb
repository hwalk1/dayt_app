class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def journey
  end
end
