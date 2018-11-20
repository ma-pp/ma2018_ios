gem install bundler --no-rdoc --no-ri --no-document --quiet
bundle install
bundle exec pod repo update --silent
bundle exec pod install
carthage bootstrap --cache-builds --platform iOS