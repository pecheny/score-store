package view;


import flash.text.TextField;
import massive.munit.Assert;
import model.vo.PlayerId;
class PlayerViewTest  {
    public var playerView:PlayerView;

    @Before
    public function setup():Void {
        playerView = new PlayerView();
    }

      @Test
    public function should_generate_toString():Void {
        playerView.setPlayerId(PlayerId.fromInt(1));
        Assert.areEqual(playerView.toString(), "PlayerView for player 1");
    }

    @Test
       public function should_generate_set_label_text():Void {
           var label:TextField = new TextField();
           playerView.setMainTextField(label);
           playerView.setScore(10);
           Assert.areEqual(label.text, 10);
       }
}