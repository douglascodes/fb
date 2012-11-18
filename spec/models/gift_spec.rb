require 'spec_helper'

describe Gift do
	let(:gift) { Gift.new(id: 9999, title: "Bday gift",
	 sender_id: 1, receiver_id: 2, amount: 100, xfer_complete: false)}

	# before do
	# 	subject.id = 9999
	# 	subject.title = "Bday gift"
	# 	subject.receiver_id = 2
	# 	subject.sender_id = 1
	# 	subject.amount = 100
	# end

	it { should respond_to(:amount, :receiver_id, :sender_id, :title, :xfer_complete)}
	# it "should respond to its attributes"	do
	#   subject.should respond_to(:amount, :receiver_id, :sender_id, :title)
	# end

	it "should not allow gifts to self" do
		gift.save.should be_true
		gift.receiver_id = gift.sender_id
		gift.save.should be_false
	end

	it "should add points to receiver" do
		expect { gift.save }.to change { gift.receiver.points}.by(100)
 	end

	it "should subtract points from sender" do
		expect { gift.save }.to change { gift.sender.points}.by(-100)
 	end

	it "should not allow negative gifts or zero gifts" do
		gift.amount = -100
		gift.save.should be_false
		gift.amount = 0 
		gift.save.should be_false
	end

	it "should not allow a gift larger than Giver's total points" do
		gift.amount = 1000000
		gift.save.should be_false
		gift.amount = 1
		gift.save.should be_true
	end


end
