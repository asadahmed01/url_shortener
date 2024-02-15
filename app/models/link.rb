class Link < ApplicationRecord

  has_many :views, dependent: :destroy
  validates :url, presence: true

  scope :recent_first, -> { order(created_at: :desc)}
  # Ex:- scope :active, -> {where(:active => true)}
  #

  # override the default activerecord find method
  def self.find(id)
    super Base62.decode(id)
  end
  def to_param
    Base62.encode(id)
  end
end
