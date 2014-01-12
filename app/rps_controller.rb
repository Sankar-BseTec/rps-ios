class RpsController  < UIViewController
  attr_accessor :game
  def game_ai=(ai)
  end

  def viewDidLoad
    self.game = RpsGame.new(self)
    margin = 20

    @outcome = UILabel.new
    @outcome.font = UIFont.systemFontOfSize(30)
    @outcome.text = 'Winner:'
    @outcome.textAlignment = UITextAlignmentCenter
    @outcome.textColor = UIColor.whiteColor
    @outcome.backgroundColor = UIColor.clearColor
    @outcome.frame = [[margin, 40], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@outcome)

    @rock = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @rock.setTitle('Rock', forState:UIControlStateNormal)
    @rock.setTitle('New Game', forState:UIControlStateSelected)
    @rock.addTarget(@game, action:'playedRock', forControlEvents:UIControlEventTouchUpInside)
    @rock.frame = [[margin, 100], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@rock)

    @paper = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @paper.setTitle('Paper', forState:UIControlStateNormal)
    @paper.setTitle('New Game', forState:UIControlStateSelected)
    @paper.addTarget(@game, action:'playedPaper', forControlEvents:UIControlEventTouchUpInside)
    @paper.frame = [[margin, 130], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@paper)

    @scissors = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @scissors.setTitle('Scissors', forState:UIControlStateNormal)
    @scissors.setTitle('New Game', forState:UIControlStateSelected)
    @scissors.addTarget(@game, action:'playedScissors', forControlEvents:UIControlEventTouchUpInside)
    @scissors.frame = [[margin, 160], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@scissors)


    @computer = UILabel.new
    @computer.font = UIFont.systemFontOfSize(30)
    @computer.text = 'Their Move:'
    @computer.textAlignment = UITextAlignmentCenter
    @computer.textColor = UIColor.whiteColor
    @computer.backgroundColor = UIColor.clearColor
    @computer.frame = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@computer)

    @player = UILabel.new
    @player.font = UIFont.systemFontOfSize(30)
    @player.text = 'Your Move:'
    @player.textAlignment = UITextAlignmentCenter
    @player.textColor = UIColor.whiteColor
    @player.backgroundColor = UIColor.clearColor
    @player.frame = [[margin, 260], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@player)
  end

  SIGNS = {
    :rock => 'Rock',
    :scissors => 'Scissors',
    :paper => 'Paper',
  }

  OUTCOMES = {
    :computer => 'Winner: Opponent',
    :player => 'You Won!',
    :tie => 'Game: Tie',
  }

  def reset_game
    self.game = RpsGame.new(self)
    @player.text = "Your Move:"
    @computer.text = "Their Move:"
    @outcome.text = "Winner:"
    true
  end

  def playerThrew(sign)
    play = instance_variable_get(:"@#{sign}")
    return begin
             play.selected = false
             reset_game
    end if play.selected?
    play.selected = true
    @player.text = "Your Move: #{SIGNS[sign]}"
  end

  def computerThrew(sign)
    @computer.text = "Their Move: #{SIGNS[sign]}"
  end
  def outcome(outcome)
    @outcome.text = OUTCOMES[outcome]
  end
end

class TimerController < UIViewController
  attr_reader :timer

  def viewDidLoad
    margin = 20

    @state = UILabel.new
    @state.font = UIFont.systemFontOfSize(30)
    @state.text = 'Tap to start'
    @state.textAlignment = UITextAlignmentCenter
    @state.textColor = UIColor.whiteColor
    @state.backgroundColor = UIColor.clearColor
    @state.frame = [[margin, 200], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@state)

    @action = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @action.setTitle('Start', forState:UIControlStateNormal)
    @action.setTitle('Stop', forState:UIControlStateSelected)
    @action.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)
    @action.frame = [[margin, 260], [view.frame.size.width - margin * 2, 40]]
    view.addSubview(@action)
  end

  def actionTapped
    if @timer
      @timer.invalidate
      @timer = nil
    else
      @duration = 0
      @timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:'timerFired', userInfo:nil, repeats:true)
    end
    @action.selected = !@action.selected?
  end

  def timerFired
    @state.text = "%.1f" % (@duration += 0.1)
  end
end
