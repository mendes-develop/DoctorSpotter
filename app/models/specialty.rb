class Specialty < ApplicationRecord
    has_many :doctors
    has_many :insurances, through: :doctors
end
