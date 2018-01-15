source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'capistrano-bundler'
gem 'capistrano', '~> 3.5.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise_cas_authenticatable'
gem 'devise-guests', '~> 0.6'
gem 'devise'
gem 'figaro'
gem 'hyrax', '2.0.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-cache'
gem 'rails', '~> 5.1.4'
gem 'resque-pool'
gem 'rsolr', '>= 1.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-mini-profiler'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'fcrepo_wrapper'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'solr_wrapper', '>= 0.3'
end
