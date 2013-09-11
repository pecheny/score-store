package mediators;
class PlayerViewMediatorTest {
    public var playerViewMediator:PlayerViewMediator;

    @Before
    public function startup():Void {
        playerViewMediator = new PlayerViewMediator();
    }

    @Test
    public function should_handle_mouse_and_dispatch_signal():Void {

    }
}