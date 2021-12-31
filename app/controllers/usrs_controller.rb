class UsrsController < ApplicationController
  before_action :set_usr, only: %i[ show edit update destroy ]
  #before_action :check_time_input, only: %i[ timer ]

  # GET /usrs or /usrs.json
  def index
    @usrs = Usr.all
  end

  # GET /usrs/1 or /usrs/1.json
  def show
    # temporary call to retrieve test user for testing purposes

    @this_usr = Usr.where("usrname= 'tyler1'").first
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
    @usr = Usr.new(usr_params)

    respond_to do |format|
      if @usr.save
        format.html { redirect_to usr_url(@usr), notice: "Usr was successfully created." }
        format.json { render :show, status: :created, location: @usr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
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
      message = "Please only enter numbers for all three inputs!"
      redirect_to usr_path(:id => params[:id], :msg=> message)
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
