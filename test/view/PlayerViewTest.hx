package view;
import flash.text.TextField;
import mockatoo.Mockatoo.* ;
import massive.munit.Assert;
import org.hamcrest.MatchersBase;
import org.hamcrest.MatcherAssert;
import flash.display.DisplayObject;
import view.PlayerView;
using org.hamcrest.MatcherAssert;
using mockatoo.Mockatoo;


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
    public function should_generate_toString():Void {
        var label:TextField = new TextField();
        label.text = "foobar";
        playerView.setMainTextField(label);
        Assert.areEqual(label.text, "foobar");
        Assert.areEqual(playerView.toString(), "PlayerView: foobar");
    }

    @Test
       public function should_generate_set_label_text():Void {
           var label:TextField = new TextField();
           playerView.setMainTextField(label);
           playerView.setText("foobar");
           Assert.areEqual(label.text, "foobar");
       }
}