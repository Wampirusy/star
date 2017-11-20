class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end
  
  def show
    @tournament = Tournament.find params[:id]
    p '111111111111111',params[:id],@tournament
  end
  
  def sign_in
    if current_user.has_command?
      tournament = Tournament.find params[:id]    
      tournament.commands << current_user.command
      tournament.save
    end
    
    redirect_to tournaments_path
  end

  def sign_out
    if current_user.has_command?
      tournament = Tournament.find params[:id]
      tournament.commands.delete current_user.command
    end
    
      redirect_to tournaments_path
  end
end
