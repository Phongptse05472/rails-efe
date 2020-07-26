source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.1', '>= 5.1.1'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'faker', '~> 2.13'
gem 'devise'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'azure-storage-blob', require: false
gem 'foreman'
gem 'byebug'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-ui-rails'
gem 'friendly_id', '~> 5.2.4'
gem 'wicked'
gem 'pg_search'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
