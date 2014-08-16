RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, truncation: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, jbuilder: true) do
    config.render_views = true
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each, jbuilder: true) do
    config.render_views = false
  end

  config.after(:each, js: true) do
    load Rails.root.join('db', 'seeds.rb')
  end

  config.after(:each, truncation: true) do
    load Rails.root.join('db', 'seeds.rb')
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end