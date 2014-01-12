describe "The RPS view controller" do
  tests RpsController
  before do
    controller.game_ai = :deterministic_game
  end
  it "has a Rock label" do
    view('Rock').should.not == nil
  end

  it "starts a game" do
    tap 'Rock'
    controller.game.isValid.should == true
  end

  it "updates both players and the winner" do
    player = view('Your Move:')
    computer = view('Their Move:')
    outcome = view('Winner:')
    tap 'Rock'
    player.text.should == 'Your Move: Rock'
    computer.text.should == 'Their Move: Paper'
    outcome.text.should == 'Winner: Opponent'
  end

  it "has a Scissors label" do
    view('Scissors').should.not == nil
  end

  it "handles scissors plays and ties" do
    player = view('Your Move:')
    computer = view('Their Move:')
    outcome = view('Winner:')
    tap 'Scissors'
    player.text.should == 'Your Move: Scissors'
    computer.text.should == 'Their Move: Scissors'
    outcome.text.should == 'Game: Tie'
  end

  it "has a Paper label" do
    view('Paper').should.not == nil
  end

  it "handles paper plays and losses" do
    player = view('Your Move:')
    computer = view('Their Move:')
    outcome = view('Winner:')
    tap 'Paper'
    player.text.should == 'Your Move: Paper'
    computer.text.should == 'Their Move: Rock'
    outcome.text.should == 'You Won!'
  end

  it 'can reset the game' do
    player = view('Your Move:')
    computer = view('Their Move:')
    outcome = view('Winner:')
    tap 'Paper'
    tap 'New Game'
    player.text.should == 'Your Move:'
    computer.text.should == 'Their Move:'
    outcome.text.should == 'Winner:'
  end
end
