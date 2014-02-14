class RpsGame
  class << self
    attr_accessor :handler
    attr_accessor :current
  end
  def self.handler=(handler)
    @handler = handler
  end
  def self.new_game
    @current ||= RpsGame.new(@handler)
  end
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
    when :paper then
      @handler.computerThrew(:rock)
      @handler.outcome(:player)
    end
    return self
  end
  def self.playedRock
    self.current.playersMove(:rock)
  end
  def self.playedScissors
    self.current.playersMove(:scissors)
  end
  def self.playedPaper
    self.current.playersMove(:paper)
  end

end
