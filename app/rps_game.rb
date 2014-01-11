class RpsGame
  def initialize(handler)
    @handler = handler
  end
  def isValid
    true
  end
  def playersMove(move)
    @handler.playerThrew(move)
    case move
    when :rock then
    @handler.computerThrew(:paper)
    @handler.outcome(:computer)
    when :scissors then
      @handler.computerThrew(:scissors)
      @handler.outcome(:tie)
    end
  end
  def playedRock
    playersMove(:rock)
  end
  def playedScissors
    playersMove(:scissors)
  end
  def playedPaper
    playersMove(:paper)
  end

end
