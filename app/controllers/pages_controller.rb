class PagesController < ApplicationController
  def home
    @clothing = Clothing.all
  end
end
