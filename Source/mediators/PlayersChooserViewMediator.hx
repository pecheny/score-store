package mediators;
import signals.CloseModalWindowSignal;
import flash.geom.Matrix;
import flash.display.DisplayObject;
import flash.events.MouseEvent;
import factories.LabelFactory;
import model.vo.PlayerId;
import signals.StageResizedSignal;
import constants.PlayerViewStyle;
import flash.display.Sprite;
import signals.CenterViewVerticallySignal;
import constants.AssetNames;
import model.AssetsModel;
import factories.PlayerViewFactory;
import view.PlayersChooserView;
using mediators.AssetsMixin;

class PlayersChooserViewMediator extends mmvc.impl.Mediator<PlayersChooserView> {

    @inject public var playerViewFactory:PlayerViewFactory;
    @inject public var closeModalWindowSignal:CloseModalWindowSignal;
    @inject public var assetsModel:AssetsModel;
    @inject public var centerViewwVerticallySignal:CenterViewVerticallySignal;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var labelFactory:LabelFactory;

    var playersChooserView:PlayersChooserView;
    var assets:Sprite;
    var okTapZone:DisplayObject;

    override public function onRegister():Void {
        playersChooserView = cast view;
        assets = assetsModel.getPlayersChooserMovieClip();
        var _bg = assets.getChildByName(AssetNames.BACKGROUND);
        playersChooserView.initBounds(_bg.width, _bg.height, PlayerViewStyle.CORNER_RADIUS);
        createViews();
        createTapZones();
        centerViewwVerticallySignal.dispatch(playersChooserView);
        stageResizedSignal.add(stageResizedHandler);
    }

    override public function preRemove():Void {
        stageResizedSignal.remove(stageResizedHandler);
        unmapTapZones();
        playersChooserView.clearChildren();
    }

    function createViews() {
        for (i in 1...9) {
            var switcher = playerViewFactory.getPlayerSwitcher(PlayerId.fromInt(i));
            var switcherAsset = assets.makeGraphics(AssetNames.CHOOSER_SWITCHER_PREFIX + i);
            var label = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_SCORE_INPUT_DIGIT);
            label.text = "" + i;
            switcher.x = switcherAsset.x;
            switcher.y = switcherAsset.y;
            switcherAsset.transform.matrix = new Matrix();
            switcher.addChild(switcherAsset);
            switcher.addChild(label);
            playersChooserView.addChild(switcher);
        }
        var okView = assets.makeGraphics(AssetNames.CHOOSER_OK);
        playersChooserView.addChild(okView);

    }

    function createTapZones() {
        okTapZone = assets.makeTapZone(AssetNames.CHOOSER_OK_HITAREA);
        okTapZone.addEventListener(MouseEvent.CLICK, okClickHandler);
        playersChooserView.addChild(okTapZone);
    }

    function unmapTapZones() {
        okTapZone.removeEventListener(MouseEvent.CLICK, okClickHandler);
    }

    function okClickHandler(e:MouseEvent) {
        closeModalWindowSignal.dispatch();
    }

    private function stageResizedHandler():Void {
        centerViewwVerticallySignal.dispatch(playersChooserView);
    }
}