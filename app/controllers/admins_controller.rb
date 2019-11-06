class AdminsController < ApplicationController
  def index
    return :template => '/admins/index'
  end
end
