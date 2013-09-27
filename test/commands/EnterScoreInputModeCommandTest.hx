package commands;
import massive.munit.Assert;
import view.ScoreInputView;
import factories.PlayerViewFactory;
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

    @Before public function startup() {
        enterScoreInputModeCommand = new EnterScoreInputModeCommand();
        enterScoreInputModeCommand.playerId = PlayerId.fromInt(1);
        applicationView = mock(ApplicationView);
        scoreInputView = new ScoreInputView();
        enterScoreInputModeCommand.applicationView = applicationView;
        enterScoreInputModeCommand.scoreInputView = scoreInputView;
    }

    @Test public function should_add_ui_instance_to_appView():Void {
        enterScoreInputModeCommand.execute();
        applicationView.addChild(scoreInputView).verify(1);
    }

    @Test public function should_define_playerId():Void {
          enterScoreInputModeCommand.execute();
          Assert.areEqual(PlayerId.fromInt(1), scoreInputView.id);
      }

}