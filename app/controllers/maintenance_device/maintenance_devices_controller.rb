module MaintenanceDevice
  class MaintenanceDevicesController < ApplicationController
    before_action :set_maintenance_device, only: [:show, :edit, :update, :destroy]

    # GET /alert/leds
    def index
      @maintenance_devices = ::MaintenanceDevice::MaintenanceDevice.all
    end

    # GET /alert/leds/1
    def show
    end

    # GET /alert/leds/new
    def new
      redirect_to maintenance_devices_url, notice: 'You are not authorized to do that.'
    end

    # GET /alert/leds/1/edit
    def edit
    end

    # POST /alert/leds
    def create
      @maintenance_device = ::MaintenanceDevice::MaintenanceDevice.new(maintenance_device_params)

      if @maintenance_device.save
        redirect_to maintenance_device_path(@maintenance_device), notice: 'MaintenanceDevice was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /alert/leds/1
    def update
      if @maintenance_device.update(maintenance_device_params)
        redirect_to maintenance_device_path(@maintenance_device), notice: 'MaintenanceDevice was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /alert/leds/1
    def destroy
      @maintenance_device.destroy
      redirect_to maintenance_devices_url, notice: 'maintenance_device was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_maintenance_device
        @maintenance_device = ::MaintenanceDevice::MaintenanceDevice.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def maintenance_device_params
        params.fetch(:maintenance_device_maintenance_device, {}).permit(:id, :apiotics_instance, :electricity_sensor_attributes => ["current", "port_number", "id"], :magnetic_field_sensor_attributes => ["port_number", "active", "id"], :vibration_sensor_attributes => ["threshold_exceeded", "port_number", "id"])
      end
  end
end