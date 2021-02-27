class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :api_info ]

  def home
  end

  def api_info
  end
end
