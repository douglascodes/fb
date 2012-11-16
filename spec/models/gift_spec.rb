require 'spec_helper'

describe Gift do

	it "should respond to its attributes"	do
	  subject.should respond_to(:amount, :receiver_id, :sender_id, :title)
	end

	it "should not allow gifts to self" do
		subject.receiver_id = 2
		subject.sender_id = 2
		subject.amount = 100
		subject.save.should be_false
		subject.sender_id = 1
		subject.save.should be_true
	end

end
