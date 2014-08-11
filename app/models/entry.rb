class Entry < ActiveRecord::Base
  belongs_to :category
  # has_one :friend

  # validates_format_of :friend, with: /[a-zA-Z]/, message: "must include letters"
  validates_length_of :name, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :name, :category, :note
  validates_uniqueness_of :name, message: "already exists"


end
