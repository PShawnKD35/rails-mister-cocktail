# frozen_string_literal: true

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients_names = Ingredient.all.select(&:name)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params.require(:cocktail).permit(:name))
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    if Cocktail.destroy(params[:id])
      redirect_to cocktails_path
    else
      render text: 'Deleting failed for no reason!'
    end
  end
end
