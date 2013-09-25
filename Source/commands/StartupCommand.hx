package commands;
import signals.EnterGameModeSignal;
import signals.EnterEditModeSignal;
import signals.PlayersModifyComplete;
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
import signals.AddPlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject public var buttonsModel:ButtonsModel;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;
    @inject public var appView:ApplicationView;

    @inject public var addPlayerSignal:AddPlayerSignal;
    @inject public var exitSignal:ExitSignal;
    @inject public var enterEditModeSignal:EnterEditModeSignal;
    @inject public var enterGameModeSignal:EnterGameModeSignal;
    @inject public var newGameSignal:NewGameSignal;
    @inject public var playersModifyComplete:PlayersModifyComplete;



    var swf:SWF;

    override public function execute():Void {
        swf = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var layout = new AssetsModel(swf);
        injector.mapValue(AssetsModel, layout);

        initButtonBar();
        registerButtons();
        enterGameModeSignal.dispatch();
    }

    private function initButtonBar():Void {
        var buttonBar = new ViewBase();
        appView.addChild(buttonBar);
        buttonBarContainerModel.butonBarContainer = buttonBar;

    }

    private function registerButtons():Void {
        buttonsModel.registerButtonType(ButtonName.AddPlayer, createButtonView("ButtonAddPlayer"), addPlayerSignal);
        buttonsModel.registerButtonType(ButtonName.Exit, createButtonView("ButtonExit"), exitSignal);
        buttonsModel.registerButtonType(ButtonName.EditPlayer, createButtonView("ButtonEditPlayer"), enterEditModeSignal);
        buttonsModel.registerButtonType(ButtonName.ToGame, createButtonView("ButtonOk"), enterGameModeSignal);
        buttonsModel.registerButtonType(ButtonName.New, createButtonView("ButtonNew"), newGameSignal);
    }

    function createButtonView(assetName:String):ViewBase {
        var asset = swf.createMovieClip(assetName);
        var icon = asset.getChildByName("_icon");
        var button = new Button(icon);
        return button;
    }

}