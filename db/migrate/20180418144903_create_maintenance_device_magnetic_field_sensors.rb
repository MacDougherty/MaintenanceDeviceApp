class CreateMaintenanceDeviceMagneticFieldSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_device_magnetic_field_sensors do |t|
      
      t.string :port_number
      t.boolean :port_number_ack
      t.boolean :port_number_complete
      
      
      t.boolean :active
      t.boolean :active_ack
      t.boolean :active_complete
      
      
      t.integer :maintenance_device_id
      t.timestamps
    end
  end
end