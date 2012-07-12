class PagesController < ApplicationController
  
  before_filter :authenticate
  
  def home
  end
end
