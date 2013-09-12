package mediators;
import flash.display.Sprite;
import view.PlayerViewLayout;
import view.LabelFactory;
import flash.events.MouseEvent;
import view.PlayerView;
import signals.PlayerButtonSignal;
class PlayerViewMediator extends mmvc.impl.Mediator<PlayerView> {
    @inject public var playerButtonSignal:PlayerButtonSignal;
    @inject public var labelFactory:LabelFactory;
    @inject public var layout:PlayerViewLayout;
    public function new() {
        super();
    }


    override public function onRegister() {
        super.onRegister();
        view.setMainTextField(labelFactory.getLabel(30, 0xffffff));
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
        var layoutMc:Sprite = layout.movieClip;
        view.addChild(layoutMc);
    }


    override public function onRemove():Void {
        super.onRemove();
    }

    private function mouseHandler(e:MouseEvent):Void {
        playerButtonSignal.dispatch(view.getPlayerId(), e);
    }
}