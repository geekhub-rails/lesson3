class User < ApplicationRecord
  validates :name, :role, presence: true
  enum role: %i[user admin]
end
