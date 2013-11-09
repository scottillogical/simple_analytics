class Admin::ArrivalSourcesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @arrival_sources = ArrivalSource.all
  end

  def new
    @arrival_source = ArrivalSource.new
  end
end
