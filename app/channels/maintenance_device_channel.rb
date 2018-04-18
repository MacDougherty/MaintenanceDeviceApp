class MaintenanceDeviceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "maintenance_device_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
