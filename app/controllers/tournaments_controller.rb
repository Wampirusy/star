class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def sign_in
    tournament = Tournament.find params[:id]
    tournament.commands << current_user.command

    if tournament.save
      redirect_to tournaments_path
    end
  end

  def sign_out
    tournament = Tournament.find params[:id]

    if tournament.commands.delete current_user.command
      redirect_to tournaments_path
    end
  end
end
