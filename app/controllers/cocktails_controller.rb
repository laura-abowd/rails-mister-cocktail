class CocktailsController < ApplicationController

  def index
    @class = 'bg-black'
    @cocktails = Cocktail.all
  end

  def create
     @cocktail = Cocktail.new(cocktail_params)
     if @cocktail.save
       redirect_to cocktail_path(@cocktail)
     else
       render :new
     end
   end

  def new
     @cocktail = Cocktail.new
   end

  def show
   @cocktail =  Cocktail.find(params[:id])
 end


 private
   def cocktail_params
     params.require(:cocktail).permit(:name, :ingredients, :description, :photo)
   end
end
