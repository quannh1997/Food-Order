class UsersController < ApplicationController
  # before_action :authenticate_user!
  def index
    # render :template => '/users/customs/index', :locals => {:users => User.all}
    render :template => '/users/customs/index'
  end

  def create
    # user = User.find_by name: params[:]
    # abort params[:email].inspect
    # sql = "INSERT INTO users(email,password_digest,updated_at,created_at) VALUES ('a@gmail.com','log','1970-01-02','1970-01-02')"
    # records_array = ActiveRecord::Base.connection.execute(sql)
    return :template => '/users/customs/index'
  end
end
