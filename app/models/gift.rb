class Gift < ActiveRecord::Base
  attr_accessible :amount, :receiver_id, :sender_id, :title


  def sender
  	User.find(self.sender_id)
  end

  def receiver
  	User.find(self.receiver_id)
  end
end
