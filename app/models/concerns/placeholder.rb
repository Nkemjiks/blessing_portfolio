module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height, width)
    "https://via.placeholder.com/#{height}x#{width}/0000FF/808080"
  end
end
