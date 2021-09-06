class CharactersController < ApplicationController

  http_basic_authenticate_with name: "gamer", password: "catchmeifyoucan", only: :destroy
  
  def create
    @game = Game.find(params[:game_id])
    @characters = @game.characters.create(characters_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @characters = @game.characters.find(params[:id])
    @characters.destroy
    redirect_to game_path(@game)
  end

  private
  def characters_params
    params.require(:character).permit(:name, :description)
  end

end
