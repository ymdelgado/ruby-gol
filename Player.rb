require_relative 'Cell'
require_relative 'Grid'

class Player

  attr_accessor :timeinterval
  attr_accessor :rows, :cols
  attr_reader   :grid
  attr_accessor :actions

  def initialize
    @rows, @cols= 10, 10
    @timeinterval= 1
    self.menuactions
  end

  def menuactions
    system('clear')
    #STDOUT.flush
    puts "="*50
    puts "Give an action:"
    puts "="*50
    puts "set grid size (def 10,10)   --> size>###, ###"
    puts "set timeinterval (def 1)    --> time>number(1..10)"
    puts "initialize grid             --> init"
    puts "run                         --> run"
    puts "clear grid                  --> clear"
    puts "exit                        --> exit or word unrecognized"
    puts "="*50

    if(@grid)
      @grid.draw
    end

    puts "enter command... "
    @actions = gets.chomp
    #@grid= Grid.new
    #@grid.draw

    self.procaction
    #x= @actions.split('>')
    #puts x

  end

  def procaction
    if(@actions!="")
      x= @actions.split('>')
      case x[0].downcase

        when "init"

          @grid= Grid.new(@rows, @cols)
          self.menuactions

        when "size"

          rc= x[1].split(',')
          @rows, @cols = rc[0].to_i, rc[1].to_i
          @grid= Grid.new(@rows, @cols)
          self.menuactions

        when "time"

          @timeinterval = x[1].to_i
          self.menuactions

        when "clear"

          @grid.clear
          self.menuactions

        when "run"
          if(!@grid)
            @grid= Grid.new(@rows,@cols)
          end
          t = Thread.new do
            i = 0
            while true
              system 'clear'
              @grid.play
              puts "\n<enter> to stop >> "
              sleep(@timeinterval)
            end
          end
          gets
          t.kill

          self.menuactions

      end
    end
  end

end

player= Player.new
