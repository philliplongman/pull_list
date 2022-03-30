# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"

gem "administrate"
gem "bootsnap", ">= 1.4.4", require: false
gem "devise"
gem "pg", "~> 1.1"
gem "puma", "~> 5.6"
gem "responders"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen", "~> 3.3"
  gem "meta_request"
  gem "rails-erd"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "amazing_print"
  gem "factory_bot_rails"
  gem "humanize"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "fuubar"
  gem "launchy"
  gem "shoulda-matchers"
end
