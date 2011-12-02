class IngredientsController < ApplicationController
  def index
  	@ingredients = Ingredient.all
  end

  def show
  	@ingredient = Ingredient.find(params[:id])
  end

	def search
	  @ingredients = Ingredient.search(params[:search])

	  respond_to do |format| 
		  format.html 
		  format.js 
		end
	end
end
