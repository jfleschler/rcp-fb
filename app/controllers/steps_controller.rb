class StepsController < ApplicationController
  def show
  	@step = Step.find(params[:id])
  end

  def new 
  	@recipe = Recipe.find(params[:recipe_id])
  	nextNum = @recipe.steps.count + 1
  	@recipe.steps.create({:step_num => nextNum})

  	respond_to do |format|
	    format.html { redirect_to edit_recipe_path(@recipe) }
	    format.js
    end
  end

  def destroy
    step = Step.find(params[:id])
    @recipe = step.recipe
    step.destroy()
    @recipe.save

    respond_to do |format|
      format.html { redirect_to edit_recipe_path(@recipe) }
      format.js
    end
  end

  def prioritize
    step = Step.find(params[:id])
    associations = step.associations
    associations.each do |association|
      association.position = params['association'].index(association.id.to_s) + 1
      association.save
    end

    recipe = Recipe.find(step.recipe_id)
    #recipe.build_tag_list
    recipe.save

    render :nothing => true
  end
    

  def save_note
    step = Step.find(params[:id])
    step.note = params[:note].downcase
    step.save
    
    render :nothing => true
  end
end
