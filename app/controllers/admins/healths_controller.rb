class Admins::HealthsController < Admins::ApplicationController
  # GET /admins/healths
  def index
    @users = User.all
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる日の範囲のデータを取得
    @admins_healths = Health.where(date: @month.all_day).order('date ASC')
    # 行動履歴取得
    @users_actlogs = Actlog.where(date: @month.all_day).order('date ASC')

    #テーブル結合
    @test = User.left_joins(:healths).select("users.*, healths.*").where(healths: {date: @month.all_day}).order('date ASC')
  end

  # GET /admins/healths/id
  def show
    # ユーザ名取得
    @user = params[:user]
    # 行動履歴取得
    @actlogid = params[:id]
    @users_actlog = Actlog.where(id: @actlogid)
    @users_actlogs = Actlog.where(date: @users_actlog[0].date).where(user_id: @users_actlog[0].user_id).order('date ASC')
  end

  # GET /admins/healths/new
  def new
    @admins_health = Admins::Health.new
  end

  private
    # Only allow a list of trusted parameters through.
    def admins_health_params
      params.fetch(:admins_health, {})
    end
end
