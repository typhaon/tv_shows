require 'pry'

class CharactersController < ApplicationController

  def index
    @characters = Character.includes(:television_show)
    @character = Character.new
    @television_show = TelevisionShow.new
  end


  def create
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = "Success!"
      redirect_to "/television_shows/#{@character.television_show_id}"
    else
      flash[:notice] = "A new character could not be saved."
      @television_show = TelevisionShow.find(character_params[:television_show_id])
      render :'television_shows/show'
      #skips going back to controller - just redisplay show page...
      # redirect_to "/television_shows/#{@character.television_show_id}"
    end
  end

  def destroy
    @character = Character.find(params[:id])

    if @character.destroy
      flash[:notice] = "The character has been successfully deleted."
      redirect_to "/television_shows/#{@character.television_show_id}"
    else
      flash[:notice] = "The character could not be deleted."
      @television_show = TelevisionShow.find(character_params[:television_show_id])
      render :'television_shows/show'
    end
  end


  private

  def character_params
    params.require(:character).permit(:role, :actor, :description, :television_show_id)
  end

  # def television_show_params
  #   params.require(:television_show).permit(:title, :network, :years, :synopsis)
  # end

end
