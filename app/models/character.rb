class Character < ActiveRecord::Base
  validates :name, presence: true, unique: true
end
