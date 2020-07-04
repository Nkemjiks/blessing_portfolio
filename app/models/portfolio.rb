class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: :reject_technologies, allow_destroy: true

  validates_presence_of :title, :subtitle, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :angular_portfolio_item, -> { where(:subtitle => "Angular") }
  scope :by_position, -> { self.order("position asc") }

  after_initialize :set_position

  def reject_technologies(attributes)
    attributes["name"].blank?
  end

  def set_position
    self.position ||= (Portfolio.all.count + 1)
  end
end
