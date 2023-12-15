# app/models/product.rb
class Product < ApplicationRecord
  validates :name, presence: { message: "must be present and not blank" }
  validates :phone_number, presence: { message: "must be present and not blank" }, uniqueness: true
end
 
