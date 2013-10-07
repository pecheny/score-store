package mediators;
import model.PlayerViewsModel;
import signals.UpdateLayoutSignal;
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
    @inject public var updateLayoutSignal:UpdateLayoutSignal;
    @inject public var playerViewsModel:PlayerViewsModel;
    var scrollContainer:ScrollContainer;
    var initialY:Float;
    var point:Point;
    var tpoint:Point;
    var scrollerBackgroundView:ScrollerBackgroundView;
    var pointerPosition:Float;
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
        applicationView.getStage().addEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
        updateLayoutSignal.add(updateLayoutHandler);
    }


    override public function preRemove():Void {
        scrollContainer.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        scrollContainer.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        scrollContainer.stage.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        scrollContainer.clearChildren();
        updateLayoutSignal.remove(updateLayoutHandler);
    }

    private function mouseDownHandler(e:MouseEvent):Void {
        if (checkScrollNeeded()) {
            pointerPosition = applicationView.getPointerY() / applicationView.getScale();
            storeStartPosition();
            scrollContainer.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }

    private function storeStartPosition():Void {
        initialY = pointerPosition - scrollContainer.y;
    }

    private function checkScrollNeeded():Bool {
        return scrollerBackgroundView.height * applicationView.getScale() > applicationView.getStageHeight();
    }

    private function mouseUpHandler(e:Event):Void {
        scrollContainer.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }


    private function enterFrameHandler(e:Event):Void {
        pointerPosition = applicationView.getPointerY() / applicationView.getScale();
        var ty = pointerPosition - initialY;
        scrollContainer.y = clamp(ty, applicationView.getStageHeight() / applicationView.getScale() - scrollContainer.height, 0);
        if (scrollContainer.y != ty) {
            storeStartPosition();
        }
        log += " " + Math.round(pointerPosition) + " " + Math.round(initialY) + " " + Math.round(ty) + ";";
    }

    private function updateLayoutHandler():Void {
        var containerHeight = playerViewsModel.calculateContainerHeight();
        var stageHeight = applicationView.getStageHeight() / applicationView.getScale();
        if (scrollContainer.y + containerHeight < stageHeight) {
            scrollContainer.y = stageHeight - containerHeight;
        }
    }

    private function clamp(value:Float, min:Float, max:Float):Float {
        if (value < min) {
            return min;
        }
        else if (value > max) {
            return max;}
        else
            return value;
    }

}