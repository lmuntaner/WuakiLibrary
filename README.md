The App
=======

Steps to setup the app:
1. git clone
2. bundle install
3. rake db:create
4. rake db:seed
5. Run tests
  - rspec spec/requests
  - bundle exec cucumber


The Problem
===========

Our application has movies, seasons and episodes. Let's simplify the metadata, so it only has a title and a plot. An episode belongs to a season and a season can have N episodes, the episode also has the number of episode in the season.

Movies and seasons can be purchased (but not episodes), they have several purchase options, a purchase option has a price (2.99) and a video quality (HD or SD).

We also have users, to simplify, an user only will have an email.

An user can make a purchase of a content (movie/season) through a purchase option. When a user makes a purchase, we store it in his library, the user has up to 2 days to see the content. In his library, we only show the titles that the user has "alive" and he can see and not the expired purchases. Also, while the user has a content in his library, he can't purchase the same content again.

For instance, if the user purchases the movie '300: Rise of an Empire' and goes to his library, he will find the movie, if he tries to purchase it again, he will receive an error. 3 days after, if he goes to the library, the movie will not appear in his library and he can purchase it again.

**Define and implement the following REST API in Ruby:**

1. An endpoint to return the movies, ordered by creation
2. An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number
3. An endpoint to return both movies and seasons, ordered by creation.
4. An endpoint for a user to perform a purchase of a content
5. An endpoint to get the library of a user ordered by the time that it's left to watch the content

### Define and implement the following app in Rails using the previous API :

**As a user I can**

- see the movies ordered by creation
- see the detail of a movie
- purchase a movie
- Validate the register's form (format of email, username should not be nil and the passwords must be equal) The purchase must be done by ajax and if there is any error, the error must be displayed.

**Notes:**

- Implement the API and the rails app following the REST principles
- Use any gem or library that you need
- Implement the tests that you consider appropriate ( both backend and frontend ) in both apps.
- Implement a caching mechanism when you consider appropriate
- Suppose that the user is already registered and authenticated, identify the user by his id
- Use a SQL database to persist the data
