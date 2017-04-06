class Act < ActiveRecord::Base
    belongs_to :script
    has_many :scenes
end
