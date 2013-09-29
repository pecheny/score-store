package mediators;
import constants.AssetNames;
import flash.display.DisplayObject;
import flash.display.Sprite;
import signals.RemovePlayerSignal;
import flash.events.MouseEvent;
import flash.text.TextField;
import factories.LabelFactory;
import model.AssetsModel;
import constants.PlayerViewStyle;
import view.PlayerEditorView;
using mediators.AssetsMixin;
class PlayerEditorViewMediator extends mmvc.impl.Mediator<PlayerEditorView> {
    @inject public var assetsModel:AssetsModel;
    @inject public var labelFactory:LabelFactory;
    @inject public var removePlayerSignal:RemovePlayerSignal;
    var playerEditorView:PlayerEditorView;
    var deleteHitArea:DisplayObject;

    override public function onRegister():Void {
//      init bounds
        playerEditorView = cast view;
        playerEditorView.backgroundColor = 0xffffff;
        playerEditorView.initBounds(PlayerViewStyle.UNIT_WIDTH, PlayerViewStyle.UNIT_HEIGHT, PlayerViewStyle.CORNER_RADIUS);
//      init views
        var mc = assetsModel.getPlayerEditMovieClip();
        var deleteView = mc.makeGraphics(AssetNames.EDITOR_DELETE);
        var _name:TextField = cast mc.getChildByName(AssetNames.NAME);
        var nameView = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_NAME_EDITOR);
        nameView.copyTransformFrom(_name);
        nameView.text = "Boo";
        playerEditorView.addChild(deleteView);
        playerEditorView.addChild(nameView);
//      init hitareas
        deleteHitArea = mc.makeTapZone(AssetNames.EDITOR_DELETE_HITAREA);
        playerEditorView.addChild(deleteHitArea);
//      listen input events
        deleteHitArea.addEventListener(MouseEvent.CLICK, deleteClickHandler);
    }

    override public function preRemove():Void {
        deleteHitArea.removeEventListener(MouseEvent.CLICK, deleteClickHandler);
        playerEditorView.clearChildren();
    }

    private function deleteClickHandler(e:MouseEvent):Void {
        removePlayerSignal.dispatch(playerEditorView.id);
    }
}

