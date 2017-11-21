class TournamentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def index
    @tournaments = Tournament.all
  end
  
  def show
    @tournament = Tournament.find(params[:id])
  end
  
  def sign_in
    if current_user.has_command?
      tournament = Tournament.find params[:id] rescue redirect_to tournaments_path
      
      if !tournament.sign_in(current_user.command)
        flash[:errors] = ['allready subscribed']
      end
    end
    
    redirect_to tournaments_path
  end

  def sign_out
    if current_user.has_command?
      tournament = Tournament.find params[:id] rescue redirect_to tournaments_path
      tournament.sign_out(current_user.command)
    end
    
    redirect_to tournaments_path
  end
end
