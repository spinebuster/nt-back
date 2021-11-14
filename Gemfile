source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4"

# acts_as_api makes creating XML/JSON responses in Rails 3, 4, 5 and 6 easy and fun.
gem "acts_as_api"
gem "pagy", "~> 5.1"
# Track changes to your models, for auditing or versioning. See how a model looked at any stage in
# its lifecycle, revert it to any version, or restore it after it has been destroyed.
gem "paper_trail"
# Ransack enables the creation of both simple and advanced search forms for your Ruby on Rails application
gem "ransack", github: "activerecord-hackery/ransack"
# A set of tools to make the Sorbet typechecker work with Ruby on Rails seamlessly.
gem "sorbet-rails"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to its
  # default testing framework, Minitest.
  gem "rspec-rails", "~> 5.0.0"
end

group :development do
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"

  # The Bullet gem is designed to help you increase your application's performance by reducing the number
  # of queries it makes
  gem "bullet"
  # Reek is a tool that examines Ruby classes, modules and methods and reports any Code Smells it finds
  gem "reek"
  # A Ruby static code analyzer (a.k.a. linter) and code formatter
  gem "rubocop"
  # A RuboCop extension for Faker.
  gem "rubocop-faker"
  # Performance optimization analysis for your projects, as an extension to RuboCop.
  gem "rubocop-performance"
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails"
  # RSpec-specific analysis for your projects, as an extension to RuboCop.
  gem "rubocop-rspec"
  # Tapioca is a library used to generate RBI (Ruby interface) files for use with Sorbet.
  gem "tapioca"
end

group :test do
  # Database Cleaner is a set of gems containing strategies for cleaning your database in Ruby.
  gem "database_cleaner-active_record"
  # factory_bot is a fixtures replacement with a straightforward definition syntax
  gem "factory_bot_rails"
  # This gem is a port of Perl's Data::Faker library that generates fake data.
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
  # SimpleCov is a code coverage analysis tool for Ruby.
  gem "simplecov"
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that, if
  # written by hand, would be much longer, more complex, and error-prone.
  gem "shoulda-matchers", "~> 5.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
