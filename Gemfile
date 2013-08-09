source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '0.3.11'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.3.2.1'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'thin'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'
gem 'devise'
gem 'friendly_id', github: 'FriendlyId/friendly_id', branch: 'master'

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'pry-rails'
  gem 'selenium-webdriver'
  gem 'annotate'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'quiet_assets'
end
