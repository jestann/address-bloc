class Script < ActiveRecord::Base
    has_many :characters
    has_many :acts
    has_many :scenes, through: :acts
end
