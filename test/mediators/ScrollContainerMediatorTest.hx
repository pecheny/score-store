package mediators;
import model.PlayerViewsModel;
import signals.UpdateLayoutSignal;
import view.ScrollerBackgroundView;
import factories.PlayerViewFactory;
import massive.munit.Assert;
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
import mockatoo.Mockatoo.
* ;

using mockatoo.Mockatoo;
class ScrollContainerMediatorTest extends MatchersBase {

    var scrollContainerMediator:ScrollContainerMediator;
    var scrollContainer:ScrollContainer;
    var containerFake:Sprite;
    var stageFake:Sprite;
    var applicationView:ApplicationView;
    var playerViewFactory:PlayerViewFactory;
    var timer:Timer;


    @Before public function startup() {
        var scale = 1.67;
        scrollContainer = new ScrollContainer();
        containerFake = new Sprite();
        containerFake.scaleX = containerFake.scaleY = scale;
        containerFake.addChild(scrollContainer);
        stageFake = new Sprite();
        stageFake.addChild(containerFake);
//        Lib.current.addChild(stageFake);

        var bg:ScrollerBackgroundView = new ScrollerBackgroundView();
        bg.initBounds(10, 1000, 5);
        playerViewFactory = mock(PlayerViewFactory);
        playerViewFactory.getScrollerBackground().returns(bg);

        var playerViewsModel:PlayerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.calculateContainerHeight().returns(400);


        applicationView = mock(ApplicationView);
        applicationView.getRootContainer().returns(containerFake);
        applicationView.getStageHeight().returns(800);
        applicationView.getScale().returns(scale);
        applicationView.getStage().returns(stageFake);

        scrollContainerMediator = new ScrollContainerMediator();
        scrollContainerMediator.view = scrollContainer;
        scrollContainerMediator.applicationView = applicationView;
        scrollContainerMediator.playerViewFactory = playerViewFactory;
        scrollContainerMediator.updateLayoutSignal = new UpdateLayoutSignal();
        scrollContainerMediator.playerViewsModel = playerViewsModel;
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
        applicationView.getPointerY().when().thenReturn(135).thenReturn(115);
        scrollContainerMediator.onRegister();
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
    }

    function shouldScrollContainerAccordingToPointerHandler():Void {
        var targetPoint = scrollContainer.localToGlobal(new Point());
        assertThat(targetPoint.y, closeTo(115 - 135, 0.1));
    }

    @AsyncTest public function move_to_top_should_be_constrained(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, moveToTopShouldBeConstrainedHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationView.getPointerY().when().thenReturn(10).thenReturn(10).thenReturn(0).thenReturn(600);
        scrollContainerMediator.onRegister();
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));

    }

    function moveToTopShouldBeConstrainedHandler():Void {
        trace("boo " + scrollContainerMediator.log);
        Assert.areEqual(0, scrollContainer.y);
    }

    @AsyncTest public function move_bottom_should_be_constrained(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, moveBottomShouldBeConstrainedHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationView.getPointerY().when().thenReturn(1350).thenReturn(1355).thenReturn(1);
        scrollContainerMediator.onRegister();
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new Event(Event.ENTER_FRAME));
        scrollContainer.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
    }

    function moveBottomShouldBeConstrainedHandler():Void {
        var bounds = scrollContainer.getBounds(stageFake);
        assertThat(bounds.y + bounds.height, lessThanOrEqualTo(800));
    }


}