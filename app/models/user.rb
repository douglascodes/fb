class User < ActiveRecord::Base
  attr_accessible :email, :name, :points
  validates_uniqueness_of :name && :email
  validates_numericality_of :points, :greater_than => 0 


  has_many :gifts
  belongs_to :gift, :foreign_key => :receiver_id
  belongs_to :gift, :foreign_key => :sender_id

  def sent_gifts
  	Gift.where(:sender_id => self.id)
  end

  def received_gifts
  	Gift.where(:receiver_id => self.id)
  end

  def update_points(value)
    self.points += value
    self.save
  end

end

