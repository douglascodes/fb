class Gift < ActiveRecord::Base
  attr_accessible :amount, :receiver_id, :sender_id, :title
  attr_reader :xfer_complete
  validates_numericality_of :amount, :greater_than => 0 
  before_save :self_gifting?
  before_save :can_afford?
  after_save :xfer_points
  
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
    if self.xfer_complete then return end
    self.sender.update_points(-self.amount)
    self.receiver.update_points(+self.amount)  
    not self.xfer_complete
  end

  def can_afford?
    self.sender.points >= self.amount
  end

end
