class Admins::HealthsController < Admins::ApplicationController
  before_action :set_admins_health, only: %i[ show edit update destroy ]

  # GET /admins/healths or /admins/healths.json
  def index
    # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる日の範囲のデータを取得
    @admins_healths = Health.where(date: @month.all_day).order('date ASC')
  end

  # GET /admins/healths/1 or /admins/healths/1.json
  def show
  end

  # GET /admins/healths/new
  def new
    @admins_health = Admins::Health.new
  end

  # GET /admins/healths/1/edit
  def edit
  end

  # POST /admins/healths or /admins/healths.json
  def create
    @admins_health = Health.new(admins_health_params)

    respond_to do |format|
      if @admins_health.save
        format.html { redirect_to [:admins, @admins_health], notice: "Health was successfully created." }
        format.json { render :show, status: :created, location: @admins_health }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_health.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/healths/1 or /admins/healths/1.json
  def update
    respond_to do |format|
      if @admins_health.update(admins_health_params)
        format.html { redirect_to @admins_health, notice: "Health was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_health }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_health.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/healths/1 or /admins/healths/1.json
  def destroy
    @admins_health.destroy
    respond_to do |format|
      format.html { redirect_to admins_healths_url, notice: "Health was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_health
      @admins_health = Admins::Health.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_health_params
      params.fetch(:admins_health, {})
    end
end
