require 'spec_helper'

describe User do
	
	it "should respond to its attributes"	do
	  subject.should respond_to(:email, :name, :points)
	end

	
	
end
