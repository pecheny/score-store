package mediators;
import model.ButtonsModel;
import flash.events.MouseEvent;
import view.Button;
class ButtonMediator extends mmvc.impl.Mediator<Button> {

    @inject public var buttonsModel:ButtonsModel;

    override public function onRegister():Void {
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
    }

    function mouseHandler(e:MouseEvent) {
        var signal = buttonsModel.getSignal(view);
        signal.dispatch();
    }
}