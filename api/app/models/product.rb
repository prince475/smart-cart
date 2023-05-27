class Product < ApplicationRecord
    belongs_to :user

    before_save :calculate_total 

    validates :image, :description, :unit_price, :quantity, presence: true
    validates :unit_price, :quantity, numericality: { greater_than_or_equal_to: 0 }

    private

    def calculate_total
        self.total = unit_price * quantity
    rescue => e
        errors.add(:total, "could not be calculated: #{e.message}")
        throw(:abort)
    end

end
