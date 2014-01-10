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

  it "updates both players" do
    player = view('Your Move:')
    computer = view('Their Move:')
    outcome = view('Winner:')
    tap 'Rock'
    player.text.should == 'Rock'
    computer.text.should == 'Paper'
    outcome.text.should == 'Opponent'
  end

end
