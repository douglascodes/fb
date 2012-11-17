require 'spec_helper'

describe Gift do

	before do
		subject.id = 9999
		subject.title = "Bday gift"
		subject.receiver_id = 2
		subject.sender_id = 1
		subject.amount = 100
	end

	it "should respond to its attributes"	do
	  subject.should respond_to(:amount, :receiver_id, :sender_id, :title)
	end

	it "should not allow gifts to self" do
		subject.save.should be_true
		subject.receiver_id = subject.sender_id
		subject.save.should be_false
	end

	it "should add points to receiver" do
		expect { subject.save }.to change { subject.receiver.points}.by(100)
 	end

	it "should subtract points from sender" do
		expect { subject.save }.to change { subject.sender.points}.by(-100)
 	end

	it "should not allow negative gifts" do
		subject.amount = -100
		subject.save.should be_false
	end

	it "should not allow a gift larger than Giver's total points" do
		subject.sender.points = 0
		subject.save.should be_false
	end


end
