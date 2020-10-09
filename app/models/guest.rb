class Guest < ActiveRecord::Base
  belongs_to :category
  belongs_to :gender
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  validates_associated :phones
end
