class Cell

  attr_reader :state

  def initialize(rand=1)
    # initialize cell with random value 0||1
    @state= rand==1 ? Random.rand(2) : 0
  end

  def chgstate
    # change cell status
    @state= @state==1?0:1
  end

end
