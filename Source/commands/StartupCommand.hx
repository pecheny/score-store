package commands;
import model.ButtonsModel;
import view.ApplicationView;
import view.ViewBase;
import model.ButtonBarContainerModel;
import signals.StageResizedSignal;
import view.PlayerViewLayout;
import format.SWF;
import openfl.Assets;
import signals.AddPlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject public var addPlayerSignal:AddPlayerSignal;
    @inject public var resizeSignal:StageResizedSignal;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;
    @inject public var appView:ApplicationView;
    @inject public var buttonsModel:ButtonsModel;


    override public function execute():Void {
        var swf:SWF = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var layout = new PlayerViewLayout(swf);
        injector.mapValue(PlayerViewLayout, layout);

        initButtonBar();


        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        resizeSignal.dispatch();
    }

    private function initButtonBar():Void {
        var buttonBar = new ViewBase();
        buttonBar.initBounds(100, 140, 50);
        appView.addChild(buttonBar);
        buttonBarContainerModel.butonBarContainer = buttonBar;

    }

    private function registerButtons():Void {
//    buttonsModel.registerButtonType()
    }

}