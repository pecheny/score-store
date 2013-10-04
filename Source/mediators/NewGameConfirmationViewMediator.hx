package mediators;
import flash.display.DisplayObject;
import flash.events.MouseEvent;
import model.AssetsModel;
import signals.StageResizedSignal;
import signals.CenterViewVerticallySignal;
import constants.PlayerViewStyle;
import constants.AssetNames;
import flash.display.Sprite;
import view.NewGameConfirmationView;
import signals.NewGameSignal;
import signals.CloseModalWindowSignal;
using mediators.AssetsMixin;

class NewGameConfirmationViewMediator extends mmvc.impl.Mediator<NewGameConfirmationView> {
    @inject public var closeModalWindowSignal:CloseModalWindowSignal;
    @inject public var newGameSignal:NewGameSignal;
    @inject public var newGameConfirmationView:NewGameConfirmationView;
    @inject public var centerViewVerticallySignal:CenterViewVerticallySignal;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var assetsModel:AssetsModel;

    var assets:Sprite;
    var okTapZone:DisplayObject;
    var cancelTapZone:DisplayObject;

    override public function onRegister():Void {
        newGameConfirmationView = cast view;
        assets = assetsModel.getNewGameConfirmation();
        var _bg = assets.getChildByName(AssetNames.BACKGROUND);
        newGameConfirmationView.initBounds(_bg.width, _bg.height, PlayerViewStyle.CORNER_RADIUS);
        createViews();
        createTapZones();
        centerViewVerticallySignal.dispatch(newGameConfirmationView);
        stageResizedSignal.add(stageResizedHandler);
    }

    override public function preRemove():Void {
        stageResizedSignal.remove(stageResizedHandler);
        unmapTapZones();
        newGameConfirmationView.clearChildren();
    }

    function createViews() {
        var okView = assets.makeGraphics(AssetNames.NEW_GAME_OK);
        newGameConfirmationView.addChild(okView);
        var cancelView = assets.makeGraphics(AssetNames.NEW_GAME_CANCEL);
        newGameConfirmationView.addChild(cancelView);
        var icon = assets.makeGraphics(AssetNames.NEW_GAME_ICON);
        newGameConfirmationView.addChild(icon);
    }

    function createTapZones() {
        okTapZone = assets.makeTapZone(AssetNames.NEW_GAME_OK_HITAREA);
        okTapZone.addEventListener(MouseEvent.CLICK, okClickHandler);
        newGameConfirmationView.addChild(okTapZone);

        cancelTapZone = assets.makeTapZone(AssetNames.NEW_GAME_CANCEL_HITAREA);
        cancelTapZone.addEventListener(MouseEvent.CLICK, cancelClickHandler);
        newGameConfirmationView.addChild(cancelTapZone);
    }

    function unmapTapZones() {
        okTapZone.removeEventListener(MouseEvent.CLICK, okClickHandler);
        cancelTapZone.removeEventListener(MouseEvent.CLICK, cancelClickHandler);
    }

    function okClickHandler(e:MouseEvent) {
        newGameSignal.dispatch();
        closeModalWindowSignal.dispatch();
    }

    function cancelClickHandler(e:MouseEvent) {
        closeModalWindowSignal.dispatch();
    }

    private function stageResizedHandler():Void {
        centerViewVerticallySignal.dispatch(newGameConfirmationView);
    }


}