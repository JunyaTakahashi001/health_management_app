class Users::HealthsController < Users::ApplicationController
  before_action :set_users_health, only: %i[ edit update ]

  # GET /users/healths
  def index
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @users_healths = Health.where(date: @month.all_month).where(user_id: current_user.id).order('date ASC')
  
    # 行動履歴取得
    @users_actlogs = Actlog.where(date: @month.all_month).where(user_id: current_user.id).order('date ASC')
  end

  # GET /users/healths/new
  def new
    @path = users_healths_path
    @params = params[:date]
    @health = Health.new(date: @params)
  end

  # GET /users/healths/1/edit
  def edit
    @health.attributes = flash[:health] if flash[:health]
    @path = "/users/healths/#{@health[:id]}"
  end

  # POST /users/healths
  def create
    @health = Health.new(health_params)
    if @health.save
      redirect_to users_healths_path, notice: "健康状態を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/healths/1
  def update
    if @health.update(health_params)
      redirect_to users_healths_path, notice: "健康状態を更新しました。"
    else
      render :edit, status: :unprocessable_entity
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
