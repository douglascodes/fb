require 'spec_helper'

describe User do
	
	before do
		subject.name = "Douglas"
		subject.id = 1
		subject.email = "douglasdrinks@gmail.com"
		subject.points = 1000
	end

	it "should respond to its attributes"	do
	  subject.should respond_to(:email, :name, :points)
	end

	it "should list all gifts received" do
		subject.received_gifts[0].should be_an_instance_of(Gift)
		subject.sent_gifts[0].should be_an_instance_of(Gift)
	end

end
