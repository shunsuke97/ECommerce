source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  # modelにschemaの内容をメモ
  gem 'annotate'
end

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'hamlit'
# メソッドを定義してviewを補佐する
gem 'active_decorator'
# form_forの記述を簡略化
gem 'simple_form'
# モデルにて列挙型を扱いやすくする
gem 'enumerize'
# 画像アップロード
gem 'carrierwave', '~> 1.0'
gem 'jquery-rails'
gem 'materialize-sass'
# 商品にhash値を付与
gem 'hashid-rails', '~> 1.0'
# 決済サービスを導入
gem 'stripe'