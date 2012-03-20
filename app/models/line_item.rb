class LineItem < ActiveRecord::Base
  #relational database:
    #each LineItem belongs to one product
    #each LineItem belongs to one cart
    #each LineItem belongs to one order
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  #validates column product_id: presence (can't be black).
  validates :product_id, :presence => true
end
