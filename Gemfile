source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.7.1'
gem 'prawn-icon'
gem 'rails', '6.0.3.1'
gem "audited", "~> 4.7"
gem 'autonumeric-rails'
gem 'spreadsheet'
gem 'rqrcode'
gem 'webpacker', '~> 4.x'
gem 'activerecord-postgis-adapter'
gem 'pg_search'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rubyzip', '>= 1.2.1'
gem 'axlsx', git: 'https://github.com/randym/axlsx.git', ref: 'c8ac844'
gem 'caxlsx_rails'
gem 'mina', require: false
gem 'mina-ng-puma', require: false
gem 'mina-whenever', require: false
gem 'sass-rails', '~>6.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem "select2-rails"
gem 'bootstrap-datepicker-rails'
gem 'chartkick'
gem 'groupdate'
gem 'chosen-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'public_activity'
gem 'redis', '~> 4.0'
gem 'bootstrap', '~> 4.3.1'
gem 'barby'
gem 'font-awesome-sass', '~> 5.0.13'
gem 'simple_form'
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'mini_magick'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'prawn'
gem 'prawn-table'
gem 'sidekiq', '<7'
# gem 'paymaya'
gem 'precise_distance_of_time_in_words'
gem 'image_processing', '~> 1.2'
gem 'pundit'
gem 'will_paginate'
gem 'money-rails', '~>1.12'
gem "roo", "2.7.0"
gem 'simple_calendar'
gem "pdf-reader"
gem 'pagy'

group :development do
  gem "letter_opener"
  gem 'guard-rspec', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'webdrivers', '~> 3.0'
  gem 'database_rewinder'
end
