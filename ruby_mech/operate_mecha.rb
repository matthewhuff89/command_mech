require_relative 'mecha_object'
require_relative 'mecha_data_structures'

power_source = PowerSource.new
puts power_source.status
puts power_source.charge
puts power_source.activate_system
puts power_source.charge_system
puts power_source.charge