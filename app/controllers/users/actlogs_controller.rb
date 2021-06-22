class Users::ActlogsController < Users::ApplicationController
  before_action :set_users_actlog, only: %i[ edit update ]

  # GET /users/actlogs or /users/actlogs.json
  def index
    @date = params[:date].to_date
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @actlogs = Actlog.where(date: @date.all_day).where(user_id: current_user.id).order('date ASC')
  end

  # GET /users/actlogs/new
  def new
    @users_health_id = params[:users_health_id]
    @date = params[:date].to_date
    @path = users_actlogs_path
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @actlogs = ActlogCollection.new
  end

  # GET /users/actlogs/1/edit
  def edit
    @actlog = Actlog.find(params[:id])
    @path = "/users/actlogs/#{@actlog[:id]}"
  end

  # POST /users/actlogs
  def create
    @actlogs = ActlogCollection.new(actlog_params)

    if @actlogs.save
      redirect_to users_healths_path, notice: "行動履歴を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/actlogs/1
  def update
    actlog = Actlog.find(params[:id])
    if actlog.update(actlog_edit_params)
      redirect_to users_healths_path, notice: "行動履歴を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_actlog
      @users_actlog = Actlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actlog_params
      params.require(:actlogs)
    end

    def actlog_edit_params
      params.require(:actlog).permit(:renge, :date, :start_time, :end_time, :destination, :transportation, :departure, :arrival, :attendees, :attendees_details, :other, :user_id, :health_id)
    end
end
