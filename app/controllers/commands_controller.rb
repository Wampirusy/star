class CommandsController < ApplicationController
  def index
    @commands = Command.all
  end

  def new
    @command = Command.new
  end

  def create
    @command = Command.new( params.require(:command).permit(:name, :logo))
    @command.user = current_user

    if @command.save
      redirect_to :root
    else
      flash[:error] = @command.errors

      redirect_to new_command_path
    end
  end

  def edit
    @command = Command.find(params[:id])
  end

  def update
    @command = Command.find(params[:id])
    # @command.logo = params[:command][:logo].read

    # p '---',params,'---'
    # return
    # # p ppp=params.require(:command),params.require(:command).permit(:name, :logo=>lambda{|logo| 'logogogogo'})
    # p ppp=params.require(:command),params.require(:command).permit(:name, {:logo=>'logogogogo'})
    # p 'zzzzzzzzzzzzzzzzz',ppp[:logo].read
    # return
    #
    # uploaded_io = params[:command][:logo]
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end

    # if @command.save
      if @command.update params.require(:command).permit(:name, :logo)
      redirect_to :root
    else
      flash[:error] = @command.errors

      redirect_to edit_command_path
    end
  end

  def destroy
    Command.delete(params[:id])

    redirect_to :root
  end
end
