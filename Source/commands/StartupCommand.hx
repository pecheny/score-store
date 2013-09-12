package commands;
import flash.display.MovieClip;
import view.PlayerViewLayout;
import format.SWF;
import openfl.Assets;
import signals.AddPlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject
    public var addPlayerSignal:AddPlayerSignal;

    override public function execute():Void {
        var swf:SWF = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var testButton:MovieClip = swf.createMovieClip("PlayerUnitView");
        var layout = new PlayerViewLayout(testButton);
        injector.mapValue(PlayerViewLayout, layout);
        addPlayerSignal.dispatch();
    }

}