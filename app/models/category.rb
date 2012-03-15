class Category < ActiveRecord::Base
  #relational database:
    #each Category has zero or many products.
  has_many :products

  #validations
    #validates column name: presence (can't be black) and uniqueness (two categories with the
    # same name can't be created). Furthermore, it is case_sensitive false, so if "Test" exist,
    #                                                          "test" can't be creates as well.
  validates :name, presence: true,
                   uniqueness: {case_sensitive: false}


end
