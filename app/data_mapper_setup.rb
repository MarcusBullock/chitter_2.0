require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/reply'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chit_#{ENV['RACK_ENV']}")
DataMapper.finalize