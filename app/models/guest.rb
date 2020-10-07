class Guest < ActiveRecord::Base
  belongs_to :category
  belongs_to :gender
end
