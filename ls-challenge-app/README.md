# LS Code challenge - Tab Delimited file uploader
This app accepts an upload of a tab-delimited file with the columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name. In this exact order. The app parses the data into a relational database. Then it will display the gross revenue of all the purchases within the form. It also includes user authorization with devise.

# Userflow
- They upload a file containing the columns listed above, data is imported into the database, returns gross revenue of the file.

# Setup
- clone the Repo by entering `git clone git@github.com:SteveChenDC/web-engineering.git` in Terminal
- navigate to `/ls-challenge-app` folder containing the Rails app
- run `bundle install` in the Terminal to install gems
- run `rake db:migrate` in Terminal to migrate the database
- run `rails server` into Terminal
- The app should be accessible at `localhost:3000` within your Terminal

# Prequisites
- Rails 4.2.6
- SQLite version 3.8.10.2

# Things I would do with more time and to make it production-ready
- Write unit and integration tests
- Implement automated testing with Codeship
- Job processing with ActiveJob and Sidekiq
- Track issues and features within the Github Issue tab or a trello board
- Use a scalable production grade database like PostgreSQL instead of SQLite
- Do data modeling with multiple models instead of using just an order model
- Have an association with User and Order to only have the orders from the uploaded user be visible to that user
- Add an admin role to be able to see all the orders uploaded
- Use OpenID for authentication
- Have main content display ONLY after user is authenticated


# Notes
It was a pleasure working on this project. It helped me get familiar with some useful libraries within Rails and the numbers_to_currency helper method in `ActionView::Helpers::NumberHelper` that I never knew existed!

References
- http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html
- http://stackoverflow.com/questions/4404787/whats-the-best-way-to-parse-a-tab-delimited-file-in-ruby
- http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html
- https://github.com/plataformatec/devise#getting-started
- http://apidock.com/rails/Hash/transform_keys
