# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: `3.0.3`
* Rails Version: `6.1`

* Installation:

  1- clone the app
  
  2- make sure you have the right ruby version 
  
  3- run `bundle install`
  
  4- run `rails db:migrate`
  
  5- run `rails s` to start the server
  
* Usage

you need to create a user using `rails c` for example:
`User.create(email: 'user@recipelane.com', password: '123123123')`

you can create another `admin` user:
`User.create(email: 'admin@recipelane.com', password: '123123123', role: 'admin')` to access `rails_admin`

* Database

very simple and stright forward, just one table called `recipe`
