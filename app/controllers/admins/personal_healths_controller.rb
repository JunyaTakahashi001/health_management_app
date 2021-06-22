class Admins::PersonalHealthsController < Admins::ApplicationController
  # GET /admins/personal_healths
  def index
    if params[:user].present?
      # ユーザー選択あり
      @users = User.all
      @user = User.where(id: params[:user])
      # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
      @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
      # 取得した時刻が含まれる日の範囲のデータを取得
      @admins_personal_healths = Health.where(date: @month.all_month).where(user_id: @user[0].id).order('date ASC')
      # 行動履歴取得
      @users_actlogs = Actlog.where(date: @month.all_month).where(user_id: @user[0].id).order('date ASC')
    else
      # ユーザー選択なし
      @users = User.all
      @user = @users
      # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
      @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
      # 取得した時刻が含まれる日の範囲のデータを取得
      @admins_personal_healths = Health.where(date: @month.all_month).order('date ASC')
      # 行動履歴取得
      @users_actlogs = Actlog.where(date: @month.all_month).where(user_id: @user[0].id).order('date ASC')
    end
  end
end
