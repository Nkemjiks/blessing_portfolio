class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: :reject_technologies, allow_destroy: true

  include Placeholder
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  scope :angular_portfolio_item, -> { where(:subtitle => "Angular") }
  scope :by_position, -> { self.order("position asc") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end

  def reject_technologies(attributes)
    attributes["name"].blank?
  end
end
