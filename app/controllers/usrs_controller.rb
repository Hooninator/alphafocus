class UsrsController < ApplicationController
  before_action :set_usr, only: %i[ show edit update destroy ]
  #before_action :check_time_input, only: %i[ timer ]

  # GET /usrs or /usrs.json
  def index
    @usrs = Usr.all
  end

  # GET /usrs/1 or /usrs/1.json
  def show
    this_user = Usr.find(params[:id])


    @this_usr = Usr.where("usrname=?", this_user.usrname).first
    @timer_url = "/usrs/#{@this_usr.id}/timer"
    @message = params[:msg]
  end

  # GET /usrs/new
  def new
    @usr = Usr.new
  end

  # GET /usrs/1/edit
  def edit
  end

  # POST /usrs or /usrs.json
  def create
    username = params[:usr][:username]
    password = params[:usr][:password]
    repeat_password = params[:usr][:password_repeat]
    duplicate_usr = Usr.where("usrname=?", username).first
    if duplicate_usr!=nil 
        flash[:warning]='Username taken'
        redirect_to create_usr_path
        return
    end
    if password!=repeat_password
        #Error handling 
    end
    if password.nil? && username.nil?
        return
    end
    Usr.create({:usrname => username, :password => password})
    flash[:notice]='Account successfully created!'
    redirect_to login_path
    return
  end

  # PATCH/PUT /usrs/1 or /usrs/1.json
  def update
    respond_to do |format|
      if @usr.update(usr_params)
        format.html { redirect_to usr_url(@usr), notice: "Usr was successfully updated." }
        format.json { render :show, status: :ok, location: @usr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usrs/1 or /usrs/1.json
  def destroy
    @usr.destroy

    respond_to do |format|
      format.html { redirect_to usrs_url, notice: "Usr was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def timer 
    @work = params[:worktime]
    @rest = params[:resttime]
    @sessions = params[:numsessions]
    correct_input = check_time_input(@work, @rest, @sessions)
    if correct_input==false
      flash[:warning] = "Only use numbers for all 3 inputs!"
      redirect_to usr_path(:id => params[:id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usr
      @usr = Usr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usr_params
      params.require(:usr).permit(:usrname, :password)
    end

    def check_time_input(work, rest, sessions)
      return /^\d+$/.match?(work) && /^\d+$/.match?(rest) && /^\d+$/.match?(sessions)
    end
end
