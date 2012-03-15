class Product < ActiveRecord::Base
  #relational database:
    #each Product has zero or many line_items
    #each Product belongs to one category
  has_many :line_items
  belongs_to :category

  #this line will order the products to have the newest listed on the top of the home page (store/index).
  default_scope order: "created_at DESC"

  #validations
    #validates column category_id: presence (can't be black).
    #validates column title: presence (can't be black) and uniqueness (two categories with the
    # same name can't be created). Furthermore, it is case_sensitive false, so if "Test" exist,
    #                                                          "test" can't be creates as well.
    #validates column description: presence (can't be black).
    #validates column price: presence (can't be blank and numerically (must be a number). Furthermore,
    #                                   it must be grater than 0, so negative numbers are not allowed.
  validates :category_id, presence: true
  validates :title,       presence: true,
                          uniqueness: {case_sensitive: false}
  validates :description, presence: true
  validates :price,       presence: true,
                          numericality: { greater_than: 0 }


end
