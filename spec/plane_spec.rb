require "plane"

describe Plane do

  subject(:plane) { described_class.new }

  context "take_off" do

    it "should test that plane responds to take off" do
      expect(plane).to respond_to :take_off
    end

    it "should raise an error when plan is in flight and instructed to take off" do
      expect{plane.take_off}.to raise_error("Plane cannot take off as it is already in flight")
    end
  end

  context "plane_land" do

    it "should test that plane responds to plane_land" do
      expect(plane).to respond_to :plane_landed
    end

    it "should raise error when plan tries to land but has already landed" do
      expect{plane.plane_landed}.to raise_error("Plane cannot land as it has already landed")
    end

  end

  context "airport" do

    it "should test that plane responds to airport" do
      expect(plane).to respond_to :airport
    end

    it "should raise an error plane cannot be at airport, plane is already flying" do
      expect{plane.airport}.to raise_error("Plane cannot be in airport as plane is already flying")
    end

  end

end
