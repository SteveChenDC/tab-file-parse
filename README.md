# Dead company Code challenge - Tab Delimited file uploader
This app accepts an upload of a tab-delimited file with the columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name. In this exact order. The app parses the data into a relational database. Then it will display the gross revenue of all the purchases within the form. It also includes user authorization with devise.

# Userflow
- They upload a file containing the columns listed above, data is imported into the database, returns gross revenue of the file.

# You need
- Ruby 2.3
- Rails 4.2.x
- Postgres 9.5

# Setup
- clone the Repo by entering `git clone git@github.com:SteveChenDC/web-engineering.git` in Terminal
- navigate to `/ls-challenge-app` folder containing the Rails app
- run `bundle install` in the Terminal to install gems
- run `rake db:create` in Terminal to create the database
- run `rake db:migrate` in Terminal to migrate the database
- run `rails server` into Terminal
- The app should be accessible at `localhost:3000` within your Terminal

# Notes
- The order.rb holds the `import_file` method this app is primarily using.
- The method uses the CSV library within Rails and reads through each line of the file and declaring it to the block parameter, `row`.
- The file.path is indicated from the `<%= file_field_tag :file %>` in the views/orders/index.html.erb.
- Each line of the file is now a hash with the keys indicated by the headers of the file.
- As the block is run it saves the data into each table given the assumed hash key.
- The revenue of each order is calculated by multiplying the item price by the count then pushed into an empty array called  `revenue_of_orders_arr`. The sum for that array is then found using `.inject(:+)` and returned to the `@revenue` variable in the orders_controller.rb.
- The `@revenue` is then shown to the user as part of a flash message, upon redirect with it interpolated into currency using the `number_to_currency` method from the ` ActionView::Helpers::NumberHelper`.

# Additional Notes
![Image of the ERD](http://i.imgur.com/beyDmMr.png)

It was a pleasure working on this project. It helped me get familiar with some useful libraries within Rails and the numbers_to_currency helper method in `ActionView::Helpers::NumberHelper` that I never knew existed!

<!-- # Things I would do with more time and to make it production-ready
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
- Get more specs to define long-term goals
- Get someone to QA this to make it better -->
