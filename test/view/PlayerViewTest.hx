package view;
import massive.munit.Assert;
import org.hamcrest.MatchersBase;
import org.hamcrest.MatcherAssert;
import flash.display.DisplayObject;
import view.PlayerView;
using org.hamcrest.MatcherAssert;

class PlayerViewTest extends MatchersBase {
    public var playerView:PlayerView;

    @Before
    public function setup():Void {
        playerView = new PlayerView();
    }

    @Test
    public function should_return_DO_as_plus_button():Void {
        var plusButton:DisplayObject = playerView.getPlusButton();
        assertThat(plusButton, instanceOf(DisplayObject));
    }

    @Test
    public function should_set_text():Void {
        playerView.setText("foobar");
        Assert.areEqual(playerView.toString(), "PlayerView: foobar");
    }
}