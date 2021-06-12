class Admins::PersonalHealthsController < Admins::ApplicationController
  before_action :set_admins_personal_health, only: %i[ show edit update destroy ]

  # GET /admins/personal_healths or /admins/personal_healths.json
  def index
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる日の範囲のデータを取得
    @admins_personal_healths = Health.where(date: @month.all_month).where(user_id: 1).order('date ASC')
  end

  # GET /admins/personal_healths/1 or /admins/personal_healths/1.json
  def show
  end

  # GET /admins/personal_healths/new
  def new
    @admins_personal_health = Admins::PersonalHealth.new
  end

  # GET /admins/personal_healths/1/edit
  def edit
  end

  # POST /admins/personal_healths or /admins/personal_healths.json
  def create
    @admins_personal_health = Admins::PersonalHealth.new(admins_personal_health_params)

    respond_to do |format|
      if @admins_personal_health.save
        format.html { redirect_to @admins_personal_health, notice: "Personal health was successfully created." }
        format.json { render :show, status: :created, location: @admins_personal_health }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_personal_health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/personal_healths/1 or /admins/personal_healths/1.json
  def update
    respond_to do |format|
      if @admins_personal_health.update(admins_personal_health_params)
        format.html { redirect_to @admins_personal_health, notice: "Personal health was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_personal_health }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_personal_health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/personal_healths/1 or /admins/personal_healths/1.json
  def destroy
    @admins_personal_health.destroy
    respond_to do |format|
      format.html { redirect_to admins_personal_healths_url, notice: "Personal health was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_personal_health
      @admins_personal_health = Admins::PersonalHealth.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_personal_health_params
      params.fetch(:admins_personal_health, {})
    end
end
