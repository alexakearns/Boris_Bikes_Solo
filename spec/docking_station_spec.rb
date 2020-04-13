require 'docking_station'

describe DockingStation do 

  describe '#release_bike' do
    it 'responds to .release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bike available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe '#dock' do 
    it 'responds to .dock with 1 argument' do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it  'docks bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'raises an error when docking station is full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station is full'
    end
  end

end