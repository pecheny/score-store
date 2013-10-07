package commands;
import constants.FilePaths;
import signals.SetStateSignal;
import model.vo.PlayerId;
import factories.PlayerViewFactory;
import view.PlayersChooserView;
import signals.ShowModalWindowSignal;
import signals.StageResizedSignal;
import signals.RefreshButtonsSignal;
import view.ScrollContainer;
import constants.LayerName;
import signals.AddChildSignal;
import constants.LayerName;
import signals.NewGameSignal;
import signals.ExitSignal;
import flash.display.DisplayObject;
import view.Button;
import constants.ButtonName;
import model.ButtonsModel;
import view.ApplicationView;
import view.ViewBase;
import model.ButtonBarContainerModel;
import model.AssetsModel;
import format.SWF;
import openfl.Assets;
import signals.EnablePlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject public var buttonsModel:ButtonsModel;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;
    @inject public var appView:ApplicationView;

    @inject public var enablePlayerSignal:EnablePlayerSignal;
    @inject public var exitSignal:ExitSignal;
    @inject public var newGameSignal:NewGameSignal;
    @inject public var showModalWindowSignal:ShowModalWindowSignal;
    @inject public var addChildSignal:AddChildSignal;
    @inject public var refreshButtonsSignal:RefreshButtonsSignal;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var setStateSignal:SetStateSignal;

    @inject public var playerViewFactory:PlayerViewFactory;


    var swf:SWF;

    override public function execute():Void {
        swf = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var layout = new AssetsModel(swf);
        injector.mapValue(AssetsModel, layout);
        initLayers();
        initButtonBar();
        registerButtons();

        buttonsModel.enableButtons(ButtonName.New, ButtonName.EditPlayer, ButtonName.Exit);
        refreshButtonsSignal.dispatch();
        stageResizedSignal.dispatch();


#if mobile
        var path = SystemPath.documentsDirectory + FilePaths.APP_DIR + FilePaths.SESSION_FILE_NAME;
            if(sys.FileSystem.exists(path)) {
        var state = sys.io.File.getContent(path);
              setStateSignal.dispatch(state);
            } else {
                    showWelcomeState();
            }
        #else
        showWelcomeState();
#end
    }

    private function showWelcomeState():Void {
        enablePlayerSignal.dispatch(PlayerId.fromInt(1));
        enablePlayerSignal.dispatch(PlayerId.fromInt(2));
        showModalWindowSignal.dispatch(playerViewFactory.getPlayersChooser());
    }

    private function initButtonBar():Void {
        var buttonBar = new ViewBase();
        addChildSignal.dispatch(LayerName.MAIN, buttonBar);
        buttonBarContainerModel.butonBarContainer = buttonBar;
    }

    private function initLayers():Void {
        appView.addLayer(LayerName.MAIN, new ScrollContainer());
        appView.addLayer(LayerName.TOP, new ViewBase());
    }

    private function registerButtons():Void {
        buttonsModel.registerButtonType(ButtonName.Exit, createButtonView("ButtonExit"), function() {exitSignal.dispatch();});
        buttonsModel.registerButtonType(ButtonName.EditPlayer, createButtonView("ButtonEditPlayer"), function() {showModalWindowSignal.dispatch(playerViewFactory.getPlayersChooser());});
        buttonsModel.registerButtonType(ButtonName.New, createButtonView("ButtonNew"), function() {showModalWindowSignal.dispatch(playerViewFactory.getNewGameConfirmation());});
    }

    function createButtonView(assetName:String):ViewBase {
        var asset = swf.createMovieClip(assetName);
        var icon = asset.getChildByName("_icon");
        var button = new Button(icon);
        return button;
    }

}