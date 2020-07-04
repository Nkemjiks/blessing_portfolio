source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "rails", "~> 6.0.3"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "friendly_id", "~> 5.2.4"
gem "bootsnap", ">= 1.4.2", require: false
gem "devise"
gem "petergate", "~> 1.6", ">= 1.6.3"
gem "kaminari"
gem "carrierwave", "~> 2.1"
gem "carrierwave-aws", "~> 1.0"
gem "mini_magick", "~> 4.10", ">= 4.10.1"

group :development, :test do
  gem "dotenv-rails", "~> 2.7", ">= 2.7.5"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
