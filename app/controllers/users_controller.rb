class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    # render :template => '/users/customs/index', :locals => {:users => User.all}
    render :template => '/users/customs/index'
  end
end
