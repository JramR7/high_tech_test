# User-CreditCard API
API to do registration, edition and consultation of users with their related credit cards.

## Table of contents
* [Introduction](#introduction)
* [Features](#features)
* [Technologies](#technologies)
* [Setup](#setup)
* [Tests](#tests)

## Introduction
This app will allow the users to register their data, add credit cards, edit and see their own data. Aditionally, the API has an administrator role, which can consult and edit the data of every single user.

## Features
This API allows the caller to:

User features:
[x] Register users.
[ ] Add credit cards for a user.
[ ] Edit own data.
[x] See own data.
[x] Authenticate and identify own profile/role.

Admin features:
[x] See all users data.
[ ] Edit all users data.
[x] Authenticate and identify role.

## Technologies
This project is created with:

* Ruby 2.3.5
* Rails 5.2.3
* Knock/JWT

For more information about dependencies, please go to the Gemfile

## Setup
* To setup this project you need to have installed ruby2.3.5, and run the command 'bundle install'
* Run the migrations with the command "rails db:migrate"
* To start the rails server locally, run the command "rails server"

## Tests
To run the unit test you can either run all tests, or a specific test:

* Running all tests: run command "rails test"
* Running a specifiic test: run command "rails test -b test/controllers/specificTest.rb", where specificTest can be one of the following:

## API calls
If you want more information about how to call the API, this is the postman repository: