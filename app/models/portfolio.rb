class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  scope :angular_portfolio_item, -> { where(:subtitle => "Angular") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/600x400/0000FF/808080?text=main+image"
    self.thumb_image ||= "https://via.placeholder.com/350x200/0000FF/808080?text=thumbnail+image"
  end
end
