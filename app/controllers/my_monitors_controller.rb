class MyMonitorsController < ApplicationController
  before_action :set_my_monitor, only: %i[ show edit update destroy ]

  # GET /my_monitors or /my_monitors.json
  def index
    @my_monitors = MyMonitor.all
  end

  # GET /my_monitors/1 or /my_monitors/1.json
  def show
  end

  # GET /my_monitors/new
  def new
    @my_monitor = MyMonitor.new
  end

  # GET /my_monitors/1/edit
  def edit
  end

  # POST /my_monitors or /my_monitors.json
  def create
    @my_monitor = MyMonitor.new(my_monitor_params)

    respond_to do |format|
      if @my_monitor.save
        format.html { redirect_to @my_monitor, notice: "My monitor was successfully created." }
        format.json { render :show, status: :created, location: @my_monitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_monitors/1 or /my_monitors/1.json
  def update
    respond_to do |format|
      if @my_monitor.update(my_monitor_params)
        format.html { redirect_to @my_monitor, notice: "My monitor was successfully updated." }
        format.json { render :show, status: :ok, location: @my_monitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_monitors/1 or /my_monitors/1.json
  def destroy
    @my_monitor.destroy!

    respond_to do |format|
      format.html { redirect_to my_monitors_path, status: :see_other, notice: "My monitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_monitor
      @my_monitor = MyMonitor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def my_monitor_params
      params.expect(my_monitor: [ :url, :schedule_interval ])
    end
end
