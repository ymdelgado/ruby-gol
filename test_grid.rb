require 'test/unit'

require_relative 'Cell'
require_relative "Grid"

class TestCell < Test::Unit::TestCase

  def test_grid_all_must_be_cell_objects
    g= Grid.new(3,3)
    assert_block("Not all are cells..."){ g.container.flatten.each do |cell|
                                            if cell.class!="Cell"
                                              false
                                            end
                                          end
                                          true
                                        }
  end

  def test_all_cells_must_have_state_0_or_1
    g= Grid.new(5,3)
    assert_block("Not all are cells..."){ g.container.flatten.each do |cell|
                                            if ! cell.state === (0..1)
                                              false
                                            end
                                          end
                                          true
                                        }
  end

end


