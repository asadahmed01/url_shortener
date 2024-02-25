class Link < ApplicationRecord

  belongs_to :user
  has_many :views, dependent: :destroy
  validates :url, presence: true

  after_save_commit if: :url_previously_changed? do
    MetadataJob.perform_later(to_param)
  end
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

  def domain
    URI(url).host
    rescue URI::InvalidURIError
  end
end
