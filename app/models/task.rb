class Task < ActiveRecord::Base
	belongs_to :user
	has_many :tactivities
	validates   :user_id, presence: true
	validates   :name, presence: true,
			    length: { minimum: 3,maximum: 25 }
    validates   :description, presence: true,  length: { minimum: 3,maximum: 250 }
    validates :start, :end, presence: true
end
