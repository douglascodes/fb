require 'spec_helper'

describe User do
	
	let(:user) { User.first }

	it { should respond_to(:email, :name, :points, :id)}

	it "should list all gifts received" do
		user.received_gifts.first.should be_an_instance_of(Gift)
	  user.sent_gifts.last.should be_an_instance_of(Gift)
	end
end
