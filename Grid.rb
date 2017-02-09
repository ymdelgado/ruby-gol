class Grid

  attr_reader :size_x, :size_y
  attr_reader :container

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    # multidimensional array of Cells
    @container= Array.new(size_x){ Array.new(size_y){ Cell.new } }
  end

  def clear
    @container= Array.new(size_x){ Array.new(size_y){ Cell.new(0) } }
  end

  def draw
    #print the grid
    #system('clear')
    @container.each do |row|
      strO = '[ '
      row.each do |col|
         strO+= col.state.to_s + ' '
      end
      puts strO + ']'
    end
  end

  def get_neighbours_state_count(x,y)
    #get cells surround xy-cell
    xini= x>0 ? x-1 : 0
    xend= x<@size_x-1 ? x+1 : @size_x-1
    yini= y>0 ? y-1 : 0
    yend= y<@size_y-1 ? y+1 : @size_y-1
    sum = 0
    # sum cells, discard the xy-cell
    xini.upto(xend) do |row|
      yini.upto(yend) do |cel|
        sum+= @container[row][cel].state if !(@container[row][cel].eql?@container[x][y])
      end
    end
    sum
  end

  def play
    selected_cells = []
    #obtain and analize cells
    @container.each_with_index do |cells, row|
      cells.each_with_index do |cell, col|
        # get the number of neighbors alive
        nc = get_neighbours_state_count(row, col)
        if cell.state == 1
          # rules 1..3
          if (nc<2 || nc>3)
            selected_cells << cell
          end
        else
          # rule 4
          if (nc==3)
            selected_cells << cell
          end
        end
      end
    end

    # now change the state of selected cells
    selected_cells.each do |c|
      c.chgstate
    end

    self.draw
  end

end
