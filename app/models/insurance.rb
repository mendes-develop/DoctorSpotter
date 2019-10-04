class Insurance < ApplicationRecord
    has_many :doctors
    has_many :specialties, through: :doctors
end
