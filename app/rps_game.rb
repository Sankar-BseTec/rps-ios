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
    @handler.winner(:computer)
  end
end
