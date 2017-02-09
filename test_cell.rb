require 'test/unit'

require_relative 'Cell'

class TestCell < Test::Unit::TestCase

  def test_must_be_0_or_1
    cell= Cell.new
    assert_equal(true, (0..1) === cell.state )
  end

  def test_state_must_be_changeable_automatically
    cell= Cell.new
    bstate= cell.state
    cell.chgstate
    assert_not_equal(bstate, cell.state)
  end

  def test_cell_status_not_nill
    cell= Cell.new
    assert_not_nil(cell.state, "failure, cell status is nil...")
  end

end


