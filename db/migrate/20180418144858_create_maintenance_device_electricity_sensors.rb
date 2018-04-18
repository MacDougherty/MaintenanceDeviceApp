class CreateMaintenanceDeviceElectricitySensors < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_device_electricity_sensors do |t|
      
      t.integer :current
      t.boolean :current_ack
      t.boolean :current_complete
      
      
      t.string :port_number
      t.boolean :port_number_ack
      t.boolean :port_number_complete
      
      
      t.integer :maintenance_device_id
      t.timestamps
    end
  end
end