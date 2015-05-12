require 'active_record'
require 'logger'
require 'fileutils'
require 'database_cleaner'

FileUtils.mkdir_p('log')

# TODO: why not make this use Travis::Database.connect ?
config = Travis.config.database.dup
config.merge!('adapter' => 'jdbcpostgresql', 'username' => ENV['USER']) if RUBY_PLATFORM == 'java'
config['database'] = "travis_test"

ActiveRecord::Base.default_timezone = :utc
ActiveRecord::Base.logger = Logger.new('log/test.db.log')
ActiveRecord::Base.configurations = { 'test' => config }
ActiveRecord::Base.establish_connection('test')

