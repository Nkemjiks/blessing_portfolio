class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where(:status => 1) }
  # Ex:- scope :active, lambda {where(:active => true)}

  validates_presence_of :title, :body
  # belongs_to :topic
end
