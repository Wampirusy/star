class CommandsController < ApplicationController
   before_action :authenticate_user!, :except => [:index]
  
  def index
    @commands = Command.all
  end

  def new
    @command = Command.new
  end

  def create
    @command = Command.new(params.require(:command).permit(:name, :logo))
    @command.user = current_user

    if @command.save
      redirect_to :root
    else
      flash[:errors] = @command.errors

      redirect_to new_command_path
    end
  end

  def edit
    @command = Command.find(params[:id])
  end

  def update
    @command = Command.find(params[:id])
    
    if @command.update(params.require(:command).permit(:name, :logo))
      redirect_to :root
    else
      flash[:errors] = @command.errors

      redirect_to edit_command_path
    end
  end

  def destroy
    Command.delete(params[:id])

    redirect_to :root
  end
end
