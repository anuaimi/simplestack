
require 'active_record'


ActiveRecord::Base.logger = Logger.new( File.open('log/database.log', 'w'))

conn = ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
	:database => 'db/database.db'
)



