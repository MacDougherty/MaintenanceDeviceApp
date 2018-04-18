class CreateMaintenanceDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_device_maintenance_devices do |t|
      t.string :apiotics_instance
      t.string :name
      t.timestamps
    end
  end
end