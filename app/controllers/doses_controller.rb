class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @params = params.require(:dose).permit(:description, :ingredient_id)
    # @dose = Dose.new(description: @params[:description])
    @dose = Dose.new(@params)
    # @dose.ingredient = Ingredient.find_by(name: @params[:ingredient])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if Dose.delete(params[:id])
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render text: "Deleting failed for no reason!!!"
    end
  end
end
