# User-CreditCard API
API to do registration, edition and consultation of users with their related credit cards.
The url for this project can be found at: http://34.66.204.216:3000/ please reffer to the API calls for more information.

## Table of contents
* [Introduction](#introduction)
* [Features](#features)
* [Technologies](#technologies)
* [Setup](#setup)
* [API calls](#api-calls)

## Introduction
This app will allow the users to register their data, add credit cards, edit and see their own data. Aditionally, the API has an administrator role, which can consult and edit the data of every single user.

## Features
This API allows the caller to:

- [x] Register users/admins.
- [x] Get own token.
- [x] Authenticate and identify own profile/role.

User features:
- [x] Show own user.
- [x] Update own user.
- [x] Add credit cards for own user.
- [x] Show own credit cards.
- [x] Show a single own credit card.
- [x] Update own credit card.
- [x] Delete own credit card.

Admin features:
- [x] Show all users.
- [x] Show any user.
- [x] Update any user.
- [x] Show all credit cards.
- [x] Show any credit card.
- [x] Update any credit card.

Aditional features:
- [x] Show all locations.
- [x] Show all banks.

## Technologies
This project is created with:

* Ruby 2.3.5
* Rails 5.2.3
* Knock/JWT

For more information about dependencies, please go to the Gemfile

## Setup
* To setup this project you need to have installed ruby2.3.5, and run the command 'bundle install'
* Please be sure that you have the dev lib for the database (sqlite3 dev lib)
* Run the migrations with the command "rails db:migrate"
* Run the seeder with the command "rails db:setup"
* To start the rails server locally, run the command "rails server"

## API calls
If you want more information about how to call the API, this is the postman repository: https://www.getpostman.com/collections/07073bb50fc74a26a80f go to the postman app and import the collection with the link.
