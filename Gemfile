source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '2.4.2'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'carrierwave', '~> 1.2', '>= 1.2.2'
gem 'cloudinary', '~> 1.8', '>= 1.8.3'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.3'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
gem 'omniauth', '~> 1.8', '>= 1.8.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rails_admin', '~> 1.2'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'omniauth-facebook', '~> 4.0'
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'cancancan', '~> 2.1', '>= 2.1.3'
gem 'simple_form', '~> 3.5', '>= 3.5.1'
gem 'country_select', '~> 3.1', '>= 3.1.1'

group :development, :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'pry', '~> 0.11.3'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'ffaker', '~> 2.8', '>= 2.8.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
end

group :development do
  gem 'html2haml', '~> 2.2'
  gem 'letter_opener', '~> 1.6'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
