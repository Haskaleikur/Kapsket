class Product < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true
    has_many :line_items 
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true
    validates :stock, presence: true
    has_many_attached :photos

    def thumbnail input
        return self.photos[input].variant(resize: '200x200!').processed  
    end

    private 

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw :abort 
        end
    end 
end
