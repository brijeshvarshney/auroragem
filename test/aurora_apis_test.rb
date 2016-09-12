require "test_helper"
class Auroragem < test ::Unit::TestCase
	
	def test_version
		assert_aqual"0.1.0" ,Auroragem::VERSION
	end

end