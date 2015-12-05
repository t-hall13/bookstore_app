class Address < ActiveRecord::Base
  validates :address_line1, :city, :zipcode,  presence: true
  belongs_to :user
end
 