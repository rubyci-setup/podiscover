# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    podcasts_path
  end  
end
