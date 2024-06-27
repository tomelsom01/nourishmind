class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:home, :about, :contact_form, :price, :blogs, :show]
end
