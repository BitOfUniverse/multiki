require "test_helper"

class MultikiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Multiki::VERSION
  end

  def test_it_does_something_useful
    tasks = [
      ->{ sleep(0.1); 'Cartoons!' },
      ->{ sleep(0.05); 'Time for:' }
    ]
    assert_equal 'Time for: Cartoons!', Multiki.new(tasks).to_a.join(' ')
  end
end
