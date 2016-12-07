class PasswordController < ApplicationController

  def check
    if !(params[:userid].nil? || params[:pw].nil?)
      @userid = params[:userid]
      @password = params[:pw]
      if check_all(@userid.to_s, @password.to_s)
        flash.now[:success] = "String Credentials are acceptable!"
      else
        flash.now[:alert] = "Try again."
      end
    end
  end

  private

  def ge_six(word)
    word.length >= 6
  end

  def has_chars(word)
    word.include?("!") || word.include?("#") || word.include?("$")
  end

  def has_no_chars(word)
    !has_chars(word)
  end

  def check_all(userid, password)
    ge_six(userid) && ge_six(password) && has_chars(password) && has_no_chars(userid)
  end

end
