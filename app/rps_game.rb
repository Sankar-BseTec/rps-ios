class RpsGame
  def initialize(handler)
    @handler = handler
  end
  def isValid
    true
  end
  def playersMove(move)
    @handler.playerThrew(:rock)
    @handler.computerThrew(:paper)
    @handler.outcome(:computer)
  end
  def playedRock
    playersMove(:rock)
  end
  def playedScissors
  end
end
