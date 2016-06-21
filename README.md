# rockcontent Tasks

This is a project for the selection process of the rockcontent company.
It is a task organizer, which resembles the structure of the Scrum or Kanban

## Online Demo
[rockcontent-tasks](https://rockcontent-tasks.herokuapp.com/)


## Features
- User can Sign-up and Sign-in
- Not logged users can only see public boards
- Users can create / edit boards and add Tasks
- User can change tasks status to To-do, In Progress, To Verify and Done

## Installation

This application requires:

- Ruby 2.2.3
- Rails 4.2.6

Clone the project and run the following command to install it:

```console
bundle install
```

Run the migrations to setup the database:

```console
rake db:migrate
```

Run the seed to create the base data:

```console
rake db:seed
```
Unit Tests
---------------
Unit tests for all models validations and relationships

Acceptance Tests
---------------
- Login
- Logout
- Creation of Users
- Creation of Board with tasks
- Edition of Board with tasks
- Not logged users can not see private boards
- Change of the Task status

Main Gems used
---------------

```ruby
#Password Hash for the has_secure_password instance method
gem 'bcrypt-ruby'

# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup
gem 'simple_form'

# rspec-rails is a testing framework for Rails 3.x and 4.x.
gem 'rspec-rails'

# fixtures replacement with a straightforward definition syntax
gem 'factory_girl_rails'

#  test web applications by simulating how a real user would interact with your app
gem 'capybara'

# Strategies for cleaning databases in Ruby. Used to ensure a clean state for testing
gem 'database_cleaner'

# Shoulda Matchers provides RSpec-compatible one-liners that test common Rails functionality
gem 'shoulda-matchers'

# A library for generating fake data such as names, addresses, and phone numbers
gem 'faker'
