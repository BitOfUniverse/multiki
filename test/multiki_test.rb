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

  def test_it_stops_iteration
    tasks = [ ->{ sleep(0.05); 1 } ] * 10
    tasks[3] = -> { raise StopIteration.new('Time for rest!') }

    assert_equal true, Multiki.new(tasks).to_a.sum < 10
  end
end
