source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem "rails", "~> 7.0.8", ">= 7.0.8.4"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"


gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


gem "bootsnap", require: false
gem 'stripe'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
end

group :development do

end

gem 'utf8-cleaner'