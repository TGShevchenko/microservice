source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rubyzip", ">= 1.3.0"
gem "ffi", ">= 1.9.24"
gem "sprockets", ">= 3.7.2"
#gem "nokogiri", '~> 1.11.4'
gem "websocket-extensions", ">= 0.1.5"
gem "activesupport", "~> 6.1.3"
gem "actionpack", "~> 6.1.3"
gem "rake", ">= 12.3.3"

# Use Puma as the app server
gem "puma", ">= 3.12.6"
gem "actionview", "~> 6.1.3"
gem "activejob", "~> 6.1.3"
gem "rails-html-sanitizer", ">= 1.0.4"
gem "loofah", ">= 2.3.1"
# Bundle edge Rails instead: gem rubyzip'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'webhook', '~> 1.0'
# We need to use ultrahook in order to utilize our localhost as a callback URL
# Usage: ultrahook -k I9P1YKVlI8L4ljP9Qvj6cFOm7bMoBitT stripe 3000
# Forwarding will be activated as follows:
#     http://stripe.kisi.ultrahook.com -> http://localhost:3000
gem 'ultrahook'
gem 'mail'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
