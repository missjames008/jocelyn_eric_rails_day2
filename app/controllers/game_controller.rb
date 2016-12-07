class GameController < ApplicationController

  def try
    if cookies[:secret].to_i == 0
      r = Random.new
      cookies[:secret] = (1 + r.rand(100))
      cookies[:counter] = 0
    end
    if params[:guess].to_i < 1 || params[:guess].to_i > 100
      flash.now[:alert] = "You didn't have valid input"
    elsif cookies[:secret].to_i == params[:guess].to_i
      @result = "YOU WIN!!!!!!!111"
      r = Random.new
      cookies[:secret] = (1 + r.rand(100))
      cookies[:counter] = 0
    elsif cookies[:secret].to_i > params[:guess].to_i
      @result = "Try higher, dummy!"
      cookies[:counter] = cookies[:counter].to_i + 1
    else
      @result = "Try lower, idiot."
      cookies[:counter] = cookies[:counter].to_i + 1
    end
  end

end
