package mediators;
import flash.Lib;
import flash.geom.Point;
import org.hamcrest.MatchersBase;
import flash.events.Event;
import flash.events.MouseEvent;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import view.ApplicationView;
import flash.display.Sprite;
import view.ScrollContainer;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.*;

using mockatoo.Mockatoo;
class ScrollContainerMediatorTest extends MatchersBase {

    var scrollContainerMediator:ScrollContainerMediator;
    var scrollContainer:ScrollContainer;
    var containerFake:Sprite;
    var stageFake:Sprite;
    var applicationView:ApplicationView;
    var timer:Timer;


    @Before public function startup() {

        scrollContainer = new ScrollContainer();
        containerFake = new Sprite();
        containerFake.scaleX = containerFake.scaleY = 1.67;
        containerFake.addChild(scrollContainer);
        stageFake = new Sprite();
        stageFake.addChild(containerFake);
        Lib.current.addChild(stageFake);

        applicationView = mock(ApplicationView);
        applicationView.getRootContainer().returns(containerFake);

        scrollContainerMediator = new ScrollContainerMediator();
        scrollContainerMediator.view = scrollContainer;
        scrollContainerMediator.applicationView = applicationView;
    }

    @AsyncTest public function should_keep_position_when_pointer_does_not_move(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldKeepPositionWhenPointerDoesNotMoveHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationView.getPointerY().returns(134);
        scrollContainerMediator.onRegister();
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
    }

    function shouldKeepPositionWhenPointerDoesNotMoveHandler():Void {
        assertThat(scrollContainer.y, closeTo(0, 0.1));
    }

    @AsyncTest public function should_scroll_container_according_to_pointer(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldScrollContainerAccordingToPointerHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationView.getPointerY().when().thenReturn(135).thenReturn(215);
        scrollContainerMediator.onRegister();
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
    }

    function shouldScrollContainerAccordingToPointerHandler():Void {
        var targetPoint = scrollContainer.localToGlobal(new Point());
        assertThat(targetPoint.y, closeTo(215-135, 0.1));
    }





}