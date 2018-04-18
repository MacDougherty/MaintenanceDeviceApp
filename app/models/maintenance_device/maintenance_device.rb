module MaintenanceDevice
  class MaintenanceDevice < ApplicationRecord
    
      
        
          has_one :electricity_sensor, dependent: :destroy
          accepts_nested_attributes_for :electricity_sensor
        
          has_one :magnetic_field_sensor, dependent: :destroy
          accepts_nested_attributes_for :magnetic_field_sensor
        
          has_one :vibration_sensor, dependent: :destroy
          accepts_nested_attributes_for :vibration_sensor
        
      
    
  end
end