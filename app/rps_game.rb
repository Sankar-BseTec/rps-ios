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
    end
  end
  def playedRock
    playersMove(:rock)
  end
  def playedScissors
  end
end
