package mediators;
import view.ScrollerBackgroundView;
import flash.geom.Point;
import view.ApplicationView;
import flash.events.Event;
import flash.events.MouseEvent;
import view.ScrollContainer;
class ScrollContainerMediator extends mmvc.impl.Mediator<ScrollContainer> {
    @inject public var applicationView:ApplicationView;
    var scrollContainer:ScrollContainer;
    var initialY:Float;
    var point:Point;
    var tpoint:Point;

    override public function onRegister():Void {
        point = new Point();
        tpoint = new Point();
        scrollContainer = cast view;
        scrollContainer.addChild(new ScrollerBackgroundView());
        scrollContainer.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        scrollContainer.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        scrollContainer.addEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
    }


    override public function preRemove():Void {
        scrollContainer.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        scrollContainer.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        scrollContainer.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);

        scrollContainer.clearChildren();
    }

    private function mouseDownHandler(e:MouseEvent):Void {
        point.y = applicationView.getPointerY();
        tpoint = scrollContainer.globalToLocal(point);
        initialY = tpoint.y;
        scrollContainer.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }

    private function mouseUpHandler(e:Event):Void {
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }

    private function enterFrameHandler(e:Event):Void {
        point.y = applicationView.getPointerY();
        tpoint = applicationView.getRootContainer().globalToLocal(point);
        scrollContainer.y = tpoint.y - initialY;
    }

}