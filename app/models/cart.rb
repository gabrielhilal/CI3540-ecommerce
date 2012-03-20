class Cart < ActiveRecord::Base
  #relational database:
    # cart has many items,
    # if cart is deleted the items in the cart must be deleted as well
  has_many :line_items, dependent: :destroy
end
