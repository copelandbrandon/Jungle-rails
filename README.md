# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by means of a real world example where you inherit an existing codebase and complete tickets for bugs and missing features.

## Created as a project for Lighthouse Labs

starter code provided by lighthouse labs.

## Screenshots
-----------------------------------------
### Home page
![Home_screenshot](https://github.com/copelandbrandon/Jungle-rails/blob/master/public/images/home_page_screenshot.png?raw=true)

-----------------------------------------
### Product Details page
![Details_screenshot](https://github.com/copelandbrandon/Jungle-rails/blob/master/public/images/product_details_screenshot.png?raw=true)

-----------------------------------------
### My Cart page
![Cart_screenshot](https://github.com/copelandbrandon/Jungle-rails/blob/master/public/images/my_cart_screenshot.png?raw=true)

-----------------------------------------

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
