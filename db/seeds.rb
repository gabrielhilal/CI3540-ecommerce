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
  (how to test effectively). It covers the core Rails testing tools and
  procedures for Rails 2 and Rails 3, and introduces popular add-ons,
  including Cucumber, Shoulda, Machinist, Mocha, and Rcov. },
  image: 'rtp.jpg',
  price: 34.95,
  category_id: 1,
  quantity: 15)
# . . .
Product.create(title: 'The C Programming Language',
  description: %{An indisputably classic computing text, Kernighan and Ritchie's
  The C Programming Language, 2nd Edition, is the standard reference for learning
  and using ANSI C. Written by the co-inventors of C, this concise tutorial has a
  well-deserved reputation for clarity and precision as it defines one of the most
  successful programming languages of all time. It's an essential reference, which
  will be useful for beginners and experienced programmers alike.},
  image: 'thecpl.jpg',
  price: 38.90,
  category_id: 2,
  quantity: 9)
# . . .
Product.create(title: 'Expert C Programming',
  description: %{Defying the stereotypical notion that technical books tend to be boring,
  Expert C Programming offers a lively and often humorous look at many aspects of C--from
  how memory is laid out to the details of pointers and arrays. The author reveals his points
  through invaluable anecdotes, such as stories of costly bugs, and through folklore, such as
  the contents of Donald Knuth's first publication. Each chapter ends with a section entitled
  "Some Light Relief," which discusses topics (topics that some may consider to be "recreational"),
  such as programming contests. A fabulous appendix on job interview questions finishes the book.},
  image: 'expertc.jpg',
  price: 41.35,
  category_id: 2,
  quantity: 12)
# . . .
Product.create(title: 'Ruminations on C++',
  description: %{A book that stands out from the herd. Ruminations on C++ concentrates
  on the key C++ ideas and programming techniques--skimming the cream--to let you understand
  the "why" and not just the "how" of C++ programming. You need not be an expert C++ programmer
  to find solid fodder here, yet even experts need not fear overgrazing: You will find something
  worth chewing on in every chapter. This should be your next C++ book, because it *covers a broad
  range of C++ ideas and techniques, from detailed code examples to design principles and philosophy
  *shows how to think about programming in C++, not just how to follow rules *explains the motivation
  behind its examples; sometimes even solving the same problem in two different ways *covers both
  object-oriented programming and generic programming *explains the ideas behind the Standard...},
  image: 'rc.jpg',
  price: 30.50,
  category_id: 2,
  quantity: 3)
# . . .
Product.create(title: 'Sams Teach Yourself Java in 24 Hours',
  description: %{In just 24 lessons of one hour or less, you can learn how to create Java applications
  with the free NetBeans visual editing tools. Using a straightforward, step-by-step approach, popular
  author Rogers Cadenhead helps you master the skills and technology you need to create desktop and web
  programs, web services, and even an Android app in Java. Each lesson builds on what you have already
  learned, giving you a rock-solid foundation for real-world success. Full-color figures and clear
  step-by-step instructions visually show you how to program with Java. Quizzes and Exercises at the
  end of each chapter help you test your knowledge. Notes, Tips, and Cautions provide related information,
  advice, and warnings.},
  image: 'java1.jpg',
  price: 27.40,
  category_id: 3,
  quantity: 5)
# . . .
Product.create(title: 'Java Pocket Guide',
  description: %{How many times have you reached an impasse while writing code because you couldn't remember
  how something in Java worked? This new pocket guide is designed to keep you moving. Concise, convenient and
  easy to use, the Java Pocket Guide gives you Java stripped down to its bare essentials -- in fact, it's the
  only book on Java that you can actually fit in your pocket. Written by Robert and Patricia Liguori, senior
  software and lead information engineers for Java-based air traffic management and simulation environments,
  Java Pocket Guide contains everything you really need to know about Java, particularly everything you need
  to remember. The book pays special attention to the new areas in Java 5 and 6, such as generics and
  annotations.},
  image: 'java2.jpg',
  price: 18.99,
  category_id: 3,
  quantity: 3)
# . . .
Product.create(title: 'Essential PHP Security',
  description: %{You've heard the nasty stories about PHP sites being wiped off the web by evil hackers?
  Sadly it's not scare-mongering as it does happen, and as much as we love PHP it needs proper security
  to keep your site safe from harm. Plenty of PHP books have the odd chapter on security but at last
  O'Reilly have published a whole volume dedicated to the cause, with all the code you'll need to keep
  everything in order. Each chapter covers a different aspect of the application, from form processing
  to database programming and session management. Written in a straight forward style, it's ideal for every
  PHP user, but at GBP20 you might expect a little more than just 100 pages." .NET, November 2005 "If you
  write PHP scripts, get a copy" - Alain Williams, news@UK, March 2006},
  image: 'php1.jpg',
  price: 29.70,
  category_id: 4,
  quantity: 3)
# . . .
Product.create(title: 'PHP: The Complete Reference',
  description: %{PHP: The Complete Reference explains how to personalize the PHP work space, define
  operators and variables, manipulate strings and arrays, deploy HTML forms and buttons, and process
  user input. You'll learn how to access database information, track client-side preferences using
  cookies, execute FTP and e-mail transactions, and publish your applications to the Web. You'll also
  get in-depth coverage of PHP's next-generation Web 2.0 design features, including AJAX, XML, and RSS},
  image: 'php2.jpg',
  price: 51.00,
  category_id: 4,
  quantity: 2)
# . . .
Product.create(title: 'Learning ASP.NET 3.5',
  description: %{With this book, you will learn how to create engaging and interactive web applications
  using the latest version of the world's most popular web development platform: ASP.NET with AJAX, built
  on the productivity-enhancing features of Visual Studio 2008. All you need to get started is a basic
  knowledge of HTML and a desire to produce professional quality websites. Learning ASP.NET 3.5 introduces
  new skills in each new chapter and offers fully annotated and fully functional examples that you can put
  to work immediately. Each chapter adds detailed summaries, practice questions to ensure comprehension,
  and exercises so you can apply what you've learned to new situations.},
  image: 'asp.jpg',
  price: 32.50,
  category_id: 5,
  quantity: 2)
# . . .
Product.create(title: 'Sams Teach Yourself HTML and CSS in 24 Hours',
  description: %{In just 24 lessons of one hour or less, you can learn how to use HTML and CSS to design,
  create, and maintain world-class web sites. Using a clear, down-to-earth approach, each lesson builds
  upon the previous one, allowing even complete beginners to learn the essentials from the ground up.
  Full-color figures and clear step-by-step instructions help you learn quickly. Practical, hands-on
  examples show you how to apply what you learn. Quizzes and Exercises help you test your knowledge
  and stretch your skills.},
  image: 'css1.jpg',
  price: 18.95,
  category_id: 6,
  quantity: 2)
# . . .
Product.create(title: 'HTML & CSS: Design and Build Web Sites',
  description: %{Every day, more and more people want to learn some HTML and CSS. Joining the
  professional web designers and programmers are new audiences who need to know a little bit of
  code at work (update a content management system or Ecommerce store) and those who want to make
  their personal blogs more attractive. Many books teaching HTML and CSS are dry and only written
  for those who want to become programmers, which is why this book takes an entirely new approach.},
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