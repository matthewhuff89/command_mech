require_relative 'mecha_object'

describe PowerSource do
  let(:power_source) {PowerSource.new()}
  describe "PowerSource#initialize" do
    it 'should create a power source for the Plasma Phoenix' do
      expect(power_source).to be_a(PowerSource)
      expect(PowerSource.ping_drives).to eq(1)
    end
  end

    describe "PowerSource#activate_system" do
      it 'should activate the power source' do
      expect{power_source.activate_system}.to change{power_source.status} .from("off").to("on")
      end
    end

    describe "PowerSource#charge_system" do
      it 'should charge the power source to full capacity' do
        expect{power_source.charge_system}.to change{power_source.charge}.from(0).to(100)
      end
    end

    describe "PowerSource#deactivate_system" do
      it 'should deactivate the power source' do
        p power_source.activate_system
        p power_source.charge_system
        expect{power_source.deactivate_system}.to change{power_source.status}.from("on").to("off")
      end
    end
end

describe MainControlSystem do
  let(:power) {PowerSource.new}
  let(:control) {MainControlSystem.new({power_source: power})}
    describe "MainControlSystem#initialize" do
      it "should create a Control System instance" do
        expect(control).to be_a MainControlSystem
      end
    end

    describe "MainControlSystem#power_source_control" do
      it "should allow the Pilot to control the power source using typed commands" do
        expect{control.power_source_control("activate")}.to change{power.status}.from("off").to("on")
      end
    end


end