class Gift < ActiveRecord::Base
  attr_accessible :amount, :receiver_id, :sender_id, :title
  before_save :self_gifting?
  after_create :xfer_points
  validates_numericality_of :amount, :greater_than => 0 

  def sender
  	User.find(self.sender_id)
  end

  def receiver
  	User.find(self.receiver_id)
  end

  def self_gifting?
  	self.receiver_id != self.sender_id
  end

  def xfer_points
    self.sender.update_points(-self.amount)
    self.receiver.update_points(self.amount)  
  end


end
