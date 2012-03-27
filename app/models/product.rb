class Product < ActiveRecord::Base
  #relational database:
    #each Product has zero or many line_items
    #each Product belongs to one category
  has_many :line_items
  belongs_to :category
  #this line will order the products to have the newest listed first.
  default_scope order: "created_at DESC"
  #validates column category_id: presence (can't be black).
  validates :category_id, presence: true
  #validates column title: presence (can't be black) and uniqueness (two categories with the same name can't be created).
  # Furthermore, it is case_sensitive false, so if "Test" exist, "test" can't be created.
  validates :title,       presence: true,
                          uniqueness: { case_sensitive: false }
  #validates column description: presence (can't be black).
  validates :description, presence: true
  #validates column price: presence (can't be blank and must be a number. Furthermore, it must be grater than 0.
  validates :price,       presence: true,
                          numericality: { greater_than: 0 }
  #here we define the search method.
  def self.search(search)
    #if the controller try to find the products by search.
    if search
      #we try to find the value searched in the columns title and description to return it.
      find(:all, :conditions => ['title ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%"])
    #if the value searched is empty we return all products.
    else
      find(:all)
    end
  end
end
