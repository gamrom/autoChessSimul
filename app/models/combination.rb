class Combination < ApplicationRecord
  belongs_to :user
  has_many :combinationarrays, :dependent => :delete_all
end
