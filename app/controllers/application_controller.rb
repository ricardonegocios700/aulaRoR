class ApplicationController < ActionController::Base
  before_action :set_locale#, :set_types
  before_action :set_types
  
  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
    end
    if cookies[:locale]
      if I18n.locale != cookies[:locale]
        I18n.locale = cookies[:locale]
      end
    end  
  end

  def set_types
    @types = ["provider", "client", "user"]
  end
end
