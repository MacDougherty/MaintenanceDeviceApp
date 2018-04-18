class CreateMaintenanceDeviceVibrationSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_device_vibration_sensors do |t|
      
      t.boolean :threshold_exceeded
      t.boolean :threshold_exceeded_ack
      t.boolean :threshold_exceeded_complete
      
      
      t.string :port_number
      t.boolean :port_number_ack
      t.boolean :port_number_complete
      
      
      t.integer :maintenance_device_id
      t.timestamps
    end
  end
end