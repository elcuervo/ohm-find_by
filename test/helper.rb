require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'ohm'
require 'ohm-find_by'
Ohm.connect(:port=>6379)        # this port number should be defined in redis.conf

class Test::Unit::TestCase
end
