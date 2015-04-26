# What goes into a badass Mecha?
# It needs weapon systems
# It needs a power source
# It needs a cockpit/pilot interface system
# There's the exoskeletal and inner skeletal mechanics, arms/legs/chest/head etc. stuff like that.
# Optics
# Flight systems
# What should come FIRST though?

# Create Weapons Modules
module WeaponSystems


end

# Create Power Source Class
# What else does the power source need?
class PowerSource
  # Initialized these Constants to get used to the idea of using them and how they work.
  POWER_SOURCE_INFO = "'The Solix Drive': Custom Fusion Reactor for the X89 Plasma Phoenix"
  POWER_OUTPUT_INFO = "3.8x10**26 Joules per second, utterly ridiculous."
  @@number_of_drives = 0

  attr_reader :status, :charge
  def initialize(args = {})
    @status = args[:status] || "off"
    @charge = args[:charge] || 0
    @@number_of_drives += 1
  end

  def self.ping_drives
    # Returns the total number of Solix Drives in existance using special tracking tech.
    # Doubles as a tracking tool.
    @@number_of_drives
  end

# In a way, this is a setter method.
  def activate_system
    @status = "on"
   puts "Fusion Core online!!"
  end

  def charge_system
    if @status == "off"
      return "The system is offline! You can't charge it until it's been activated!"
    else
      until @charge == 100
        @charge += 10
      end
       @charge
      "The system is fully charged! Let's get it!"
    end
  end
# Also a setter method.
  def deactivate_system
    if @status == "on"
      @status = "off"
      @charge = 0
    else
      raise "The system is already deactivated."
    end
    @status
  end
end


# Create Pilot Interface
class MainControlSystem
  attr_reader :power_source
  def initialize(systems = {})
    @power_source = systems[:power_source]
  end

  def power_source_control(command)
    puts "power source control online, what would you like to do?"
    # command = gets.chomp Commented out for sake of testing
    if command == "charge"
      power_source.charge_system
    elsif command == "activate"
      power_source.activate_system
    elsif command == "deactivate"
      power_source.deactivate_system
    elsif command == "display energy levels"
      power_source.charge
    end
  end

end


# Create cockpit
class Cockpit



end

# Create Skeleton/Movement Systems



