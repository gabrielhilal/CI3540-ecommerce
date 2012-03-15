class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  CARDS = [ "Visa", "Visa Debit", "Mastercard", "Amex" ]
  STATUS = [ "Processing", "Approved", "Dispached", "Rejected" ]

  #this line will order the orders to have the newest listed on the top.
  default_scope order: "created_at DESC"


  validates :card_type, presence: true
  validates :card_number, presence: true
  validates :card_date, presence: true
  validates :card_cvc, presence: true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
