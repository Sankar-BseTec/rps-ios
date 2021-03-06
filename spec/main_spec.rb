describe "Application 'RPS'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end
  it "loads RpsController" do
    RpsController.should === @app.windows.first.rootViewController
  end
end
