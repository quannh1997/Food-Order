class SessionsController < ApplicationController
  def login
    render :template => '/sessions/login'
  end
end