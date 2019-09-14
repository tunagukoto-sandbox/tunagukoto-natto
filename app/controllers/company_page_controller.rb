class CompanyPageController < ApplicationController
  def show
    @company = Corporation.find(params[:id])
  end
  
  def index
    @companies = Corporation.all
  end
end
