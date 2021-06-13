class Users::ActlogsController < Users::ApplicationController
  before_action :set_users_actlog, only: %i[ show edit update destroy ]

  # GET /users/actlogs or /users/actlogs.json
  def index
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @users_actlogs = Actlog.where(health_id: 1).where(user_id: current_user.id).order('date ASC')
  end

  # GET /users/actlogs/1 or /users/actlogs/1.json
  def show
  end

  # GET /users/actlogs/new
  def new
    @path = users_actlogs_path
    @actlog = Actlog.new
  end

  # GET /users/actlogs/1/edit
  def edit
  end

  # POST /users/actlogs or /users/actlogs.json
  def create
    @users_actlog = Users::Actlog.new(users_actlog_params)

    respond_to do |format|
      if @users_actlog.save
        format.html { redirect_to @users_actlog, notice: "Actlog was successfully created." }
        format.json { render :show, status: :created, location: @users_actlog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_actlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/actlogs/1 or /users/actlogs/1.json
  def update
    respond_to do |format|
      if @users_actlog.update(users_actlog_params)
        format.html { redirect_to @users_actlog, notice: "Actlog was successfully updated." }
        format.json { render :show, status: :ok, location: @users_actlog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_actlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/actlogs/1 or /users/actlogs/1.json
  def destroy
    @users_actlog.destroy
    respond_to do |format|
      format.html { redirect_to users_actlogs_url, notice: "Actlog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_actlog
      @users_actlog = Users::Actlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_actlog_params
      params.fetch(:users_actlog, {})
    end
end
