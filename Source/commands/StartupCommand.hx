package commands;
import signals.StageResizedSignal;
import view.PlayerViewLayout;
import format.SWF;
import openfl.Assets;
import signals.AddPlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject public var addPlayerSignal:AddPlayerSignal;
    @inject public var resizeSignal:StageResizedSignal;

    override public function execute():Void {
        var swf:SWF = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var layout = new PlayerViewLayout(swf);
        injector.mapValue(PlayerViewLayout, layout);
        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        addPlayerSignal.dispatch();
        resizeSignal.dispatch();
    }

}