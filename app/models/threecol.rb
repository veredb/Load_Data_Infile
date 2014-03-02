require 'active_record'
require 'benchmark'
require 'csv'

class Threecol < ActiveRecord::Base
end

class TestModel < ActiveRecord::Base
end


ActiveSupport.on_load :active_record do
     require "mysql-copy/acts_as_copy_target"
     require "active_record"
end
ActiveRecord::Base.establish_connection(
        :adapter  => "mysql2",
        :host     => "localhost",
        :database => "testmsbin"
)

ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS `test_models`")
ActiveRecord::Base.connection.execute("CREATE TABLE `test_models` (`id` int(11) NOT NULL AUTO_INCREMENT, `wor` varchar(255), `sym` varchar(255), PRIMARY KEY (`id`))")
 

puts "Loading data to db"
puts Benchmark.measure {
     ActiveRecord::Base.connection.execute("LOAD DATA LOCAL INFILE 'lib/ms_data_encoder/file3.csv' INTO TABLE test_models FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (wor, sym)")
}
