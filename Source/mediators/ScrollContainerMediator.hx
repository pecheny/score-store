package mediators;
import view.ScrollerBackgroundView;
import factories.PlayerViewFactory;
import flash.geom.Point;
import view.ApplicationView;
import flash.events.Event;
import flash.events.MouseEvent;
import view.ScrollContainer;
class ScrollContainerMediator extends mmvc.impl.Mediator<ScrollContainer> {
    @inject public var applicationView:ApplicationView;
    @inject public var playerViewFactory:PlayerViewFactory;
    var scrollContainer:ScrollContainer;
    var initialY:Float;
    var point:Point;
    var tpoint:Point;
    var scrollerBackgroundView:ScrollerBackgroundView;
    public var log:String;

    override public function onRegister():Void {
        log = "";
        point = new Point();
        tpoint = new Point();
        scrollContainer = cast view;
        scrollerBackgroundView = playerViewFactory.getScrollerBackground();
        scrollContainer.addChild(scrollerBackgroundView);
        scrollContainer.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        scrollContainer.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        scrollContainer.stage.addEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
    }


    override public function preRemove():Void {
        scrollContainer.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        scrollContainer.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        scrollContainer.stage.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        scrollContainer.clearChildren();
    }

    private function mouseDownHandler(e:MouseEvent):Void {
        if (checkScrollNeeded()) {
            storeStartPosition();
            scrollContainer.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }

    private function storeStartPosition():Void {
        initialY = applicationView.getPointerY() / applicationView.getScale() - scrollContainer.y;
    }

    private function checkScrollNeeded():Bool {
        return scrollerBackgroundView.height * applicationView.getScale() > applicationView.getStageHeight();
    }

    private function mouseUpHandler(e:Event):Void {
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }


    private function enterFrameHandler(e:Event):Void {
        var ty = applicationView.getPointerY() / applicationView.getScale() - initialY;
        scrollContainer.y =  clampAndUpdateState(ty, applicationView.getStageHeight() / applicationView.getScale() - scrollContainer.height, 0);
    }

    private function clampAndUpdateState(value:Float, min:Float, max:Float):Float {
        if (value < min) {
            storeStartPosition();
            return min;
        }
        else if (value > max) {
            storeStartPosition();
            return max;}
        else
            return value;
    }

}