package commands;
import view.ModalBackgroundView;
import view.PlayersChooserView;
import view.ApplicationView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.*;
using mockatoo.Mockatoo;
class LeavePlayersChooseCommandTest {
var leavePlayersChooseCommand:LeavePlayersChooseCommand;
    var applicationView:ApplicationView;
    var playersChooserView:PlayersChooserView;
    var modalBackgroundView:ModalBackgroundView;

    @Before public function startup() {
        modalBackgroundView = mock(ModalBackgroundView);
        playersChooserView = mock(PlayersChooserView);
        applicationView = mock(ApplicationView);
        leavePlayersChooseCommand = new LeavePlayersChooseCommand();
        leavePlayersChooseCommand.applicationView = applicationView;
        leavePlayersChooseCommand.playersChooserView = playersChooserView;
        leavePlayersChooseCommand.modalBackgroundView = modalBackgroundView;
    }

    @Test public function should_remove_modal_background():Void {
        leavePlayersChooseCommand.execute();
        applicationView.removeChild(modalBackgroundView).verify(1);
    }

    @Test public function should_remove_players_chooser():Void {
        leavePlayersChooseCommand.execute();
        applicationView.removeChild(playersChooserView).verify(1);
    }
}