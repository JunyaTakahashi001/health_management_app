class Users::HealthsController < Users::ApplicationController
  before_action :set_users_health, only: %i[ show edit update destroy ]

  # GET /users/healths or /users/healths.json
  def index
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @users_healths = Health.where(date: @month.all_month).where(user_id: current_user.id).order('date ASC')
  end

  # GET /users/healths/1 or /users/healths/1.json
  def show
  end

  # GET /users/healths/new
  def new
    @path = users_healths_path
    @health = Health.new
  end

  # GET /users/healths/1/edit
  def edit
    @health.attributes = flash[:health] if flash[:health]
    @path = "/users/healths/#{@health[:id]}"
  end

  # POST /users/healths or /users/healths.json
  def create
    @health = Health.new(health_params)
    respond_to do |format|
      if @health.save
        format.html { redirect_to users_healths_path, notice: "Health was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/healths/1 or /users/healths/1.json
  def update
    respond_to do |format|
      if @health.update(health_params)
        format.html { redirect_to users_healths_path, notice: "Health was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/healths/1 or /users/healths/1.json
  def destroy
    @users_health.destroy
    respond_to do |format|
      format.html { redirect_to users_healths_url, notice: "Health was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_health
      @health = Health.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def health_params
      params.require(:health).permit(:date, :temperature_morning, :temperature_night, :cough, :dyspnea, :nasal, :throat, :headache, :diarrhea, :taste, :smell, :ather, :user_id)
    end
end
