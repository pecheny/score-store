package commands;
import signals.AddChildSignal;
import flash.display.DisplayObject;
import constants.LayerName;
import signals.AddPlayerSignal;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import massive.munit.Assert;
import view.ScoreInputView;
import view.ApplicationView;
import model.vo.PlayerId;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class EnterScoreInputModeCommandTest {
    var enterScoreInputModeCommand:EnterScoreInputModeCommand;
    var applicationView:ApplicationView;
    var scoreInputView:ScoreInputView;

    var passedName:String;
    var passedChild:DisplayObject;
    var timer:Timer;

    @Before public function startup() {
        enterScoreInputModeCommand = new EnterScoreInputModeCommand();
        enterScoreInputModeCommand.playerId = PlayerId.fromInt(1);
        applicationView = mock(ApplicationView);
        scoreInputView = new ScoreInputView();
        enterScoreInputModeCommand.applicationView = applicationView;
        enterScoreInputModeCommand.scoreInputView = scoreInputView;
        enterScoreInputModeCommand.addChildSignal = new AddChildSignal();

        passedName = "";
        passedChild = null;
    }


    @AsyncTest public function should_add_ui_instance_to_appView(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldAddUiInstanceToAppviewHandler, 300);
        timer = Timer.delay(handler, 200);
        enterScoreInputModeCommand.addChildSignal.add(function(name, child):Void {
            passedChild = child;
            passedName = name;
        });
        enterScoreInputModeCommand.execute();
    }

    function shouldAddUiInstanceToAppviewHandler():Void {
        Assert.areEqual(LayerName.TOP, passedName);
        Assert.areEqual(scoreInputView, passedChild);
    }

    @Test public function should_define_playerId():Void {
        enterScoreInputModeCommand.execute();
        Assert.areEqual(PlayerId.fromInt(1), scoreInputView.id);
    }

}








