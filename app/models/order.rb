class Order < ActiveRecord::Base
  #relational database:
    #each Order has zero or many line_items
    # if Order is deleted the items in the order must be deleted as well
    #each Order belongs to one user
  has_many :line_items, dependent: :destroy
  belongs_to :user
  #list of credit cards, it will be used in a dropdown list.
  CARDS = [ "Visa", "Visa Debit", "Mastercard", "Amex", "Maestro" ]
  #list of order status, it will be used in a dropdown list.
  STATUS = [ "Processing", "Approved", "Dispached", "Rejected" ]
  #this line will order the orders to have the newest listed on the top.
  default_scope order: "created_at DESC"
  #validates the following columns by presence (can't be black).
  validates :card_type, presence: true
  validates :card_number, presence: true
  validates :card_date, presence: true
  validates :card_cvc, presence: true
  #here we define a method to move the lineitems from the cart to proper order.
  def add_line_items_from_cart(cart)
    #for each lineitem added to the cart we remove the cart id and add to the order (loop)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
