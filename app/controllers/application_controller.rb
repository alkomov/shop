class ApplicationController < ActionController::Base
   include CartHelper
  protect_from_forgery with: :exception
end
