package model;
import view.PlayerView;
import org.hamcrest.MatchersBase;
import org.hamcrest.MatcherAssert;
import model.PlayerViewFactory;
using org.hamcrest.MatcherAssert;

class PlayerViewFactoryTest extends MatchersBase {
    public var playerViewFactory:PlayerViewFactory;

    @Before
    public function setup():Void {
        playerViewFactory = new PlayerViewFactory();
    }

    @Test
    public function should_return_instance_of_PlayerView():Void {
        var view:PlayerView = playerViewFactory.getView();
        assertThat(view, instanceOf(PlayerView));
    }
}