class ConversionPixelsController < ApplicationController
  before_filter :authenticate_admin! unless Rails.env.development?
  def new 
  end

end
