class StaticPagesController < ApplicationController
  # layout "inventory"
  def home
    if !user_signed_in?
      # render :template => "theme/index", :locals => {}
      render file: "#{Rails.root}/app/views/theme/full-theme.html.erb", layout: false
      # render layout: "theme/full-theme"
    end
  end
end
