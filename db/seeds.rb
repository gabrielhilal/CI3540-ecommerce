# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Category.create(id: '1', name: 'Ruby on Rails')
# . . .
Category.create(id: '2', name: 'C ++')
# . . .
Category.create(id: '3', name: 'Java')
# . . .
Category.create(id: '4', name: 'PHP')
# . . .
Category.create(id: '5', name: 'ASP.net')
# . . .
Category.create(id: '6', name: 'HTML/CSS')
# . . .
Category.create(id: '7', name: 'Javascript')
# . . .

Product.delete_all
Product.create(title: 'Programming Ruby 1.9',
  description: %{Ruby is the fastest growing and most exciting dynamic language
  out there. If you need to get working programs delivered fast, you should add
  Ruby to your toolbox.},
  image: 'ruby.jpg',
  price: 49.95,
  category_id: 1,
  quantity: 7)
# . . .
Product.create(title: 'Rails Test Prescriptions',
  description: %{Rails Test Prescriptions is a comprehensive guide to testing
  Rails applications, covering Test-Driven Development from both a
  theoretical perspective (why to test) and from a practical perspective
  (how to test effectively). },
  image: 'rtp.jpg',
  price: 34.95,
  category_id: 1,
  quantity: 15)
# . . .
Product.create(title: 'The C Programming Language',
  description: %{An indisputably classic computing text, Kernighan and Ritchie's
  The C Programming Language, 2nd Edition, is the standard reference for learning
  and using ANSI C.},
  image: 'thecpl.jpg',
  price: 38.90,
  category_id: 2,
  quantity: 9)
# . . .
Product.create(title: 'Expert C Programming',
  description: %{Defying the stereotypical notion that technical books tend to be boring,
  Expert C Programming offers a lively and often humorous look at many aspects of C--from
  how memory is laid out to the details of pointers and arrays.},
  image: 'expertc.jpg',
  price: 41.35,
  category_id: 2,
  quantity: 12)
# . . .
Product.create(title: 'Ruminations on C++',
  description: %{A book that stands out from the herd. Ruminations on C++ concentrates
  on the key C++ ideas and programming techniques--skimming the cream--to let you understand
  the "why" and not just the "how" of C++ programming.},
  image: 'rc.jpg',
  price: 30.50,
  category_id: 2,
  quantity: 3)
# . . .
Product.create(title: 'Sams Teach Yourself Java in 24 Hours',
  description: %{In just 24 lessons of one hour or less, you can learn how to create Java applications
  with the free NetBeans visual editing tools. Using a straightforward, step-by-step approach, popular
  author Rogers Cadenhead helps you master the skills and technology you need to create desktop and web
  programs, web services, and even an Android app in Java.},
  image: 'java1.jpg',
  price: 27.40,
  category_id: 3,
  quantity: 5)
# . . .
Product.create(title: 'Java Pocket Guide',
  description: %{How many times have you reached an impasse while writing code because you couldn't remember
  how something in Java worked? This new pocket guide is designed to keep you moving. Concise, convenient and
  easy to use, the Java Pocket Guide gives you Java stripped down to its bare essentials -- in fact, it's the
  only book on Java that you can actually fit in your pocket.},
  image: 'java2.jpg',
  price: 18.99,
  category_id: 3,
  quantity: 3)
# . . .
Product.create(title: 'Essential PHP Security',
  description: %{You've heard the nasty stories about PHP sites being wiped off the web by evil hackers?
  Sadly it's not scare-mongering as it does happen, and as much as we love PHP it needs proper security
  to keep your site safe from harm.},
  image: 'php1.jpg',
  price: 29.70,
  category_id: 4,
  quantity: 3)
# . . .
Product.create(title: 'PHP: The Complete Reference',
  description: %{PHP: The Complete Reference explains how to personalize the PHP work space, define
  operators and variables, manipulate strings and arrays, deploy HTML forms and buttons, and process
  user input.},
  image: 'php2.jpg',
  price: 51.00,
  category_id: 4,
  quantity: 2)
# . . .
Product.create(title: 'Learning ASP.NET 3.5',
  description: %{With this book, you will learn how to create engaging and interactive web applications
  using the latest version of the world's most popular web development platform: ASP.NET with AJAX, built
  on the productivity-enhancing features of Visual Studio 2008.},
  image: 'asp.jpg',
  price: 32.50,
  category_id: 5,
  quantity: 2)
# . . .
Product.create(title: 'Sams Teach Yourself HTML and CSS in 24 Hours',
  description: %{In just 24 lessons of one hour or less, you can learn how to use HTML and CSS to design,
  create, and maintain world-class web sites.},
  image: 'css1.jpg',
  price: 18.95,
  category_id: 6,
  quantity: 2)
# . . .
Product.create(title: 'HTML & CSS: Design and Build Web Sites',
  description: %{Every day, more and more people want to learn some HTML and CSS. Joining the
  professional web designers and programmers are new audiences who need to know a little bit of
  code at work (update a content management system or Ecommerce store) ...},
  image: 'css2.jpg',
  price: 23.99,
  category_id: 6,
  quantity: 2)
# . . .
Product.create(title: 'CoffeeScript',
  description: %{CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.},
  image:   'cs.jpg',
  price: 36.00,
  category_id: 7,
  quantity: 10)
# . . .

User.delete_all
User.create(name: 'admin', email: 'admin@admin.com', password: 'admin', admin: '1',
  address: "line1
            line2
            postcode")
# . . .
User.create(name: 'gabriel', email: 'gabriel@gmail.com', password: 'admin', admin: '1',
  address: "line1
            line2
            postcode")
# . . .
User.create(name: 'user1', email: 'user1@gmail.com', password: 'user1', admin: '0',
  address: "line1
            line2
            postcode")
# . . .
User.create(name: 'user2', email: 'user2@gmail.com', password: 'user2', admin: '0',
  address: "line1
            line2
            postcode")
# . . .