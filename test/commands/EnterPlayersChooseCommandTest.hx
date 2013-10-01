package commands;
import view.ModalBackgroundView;
import view.PlayersChooserView;
import view.ApplicationView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class EnterPlayersChooseCommandTest {
    var enterPlayersChooseCommand:EnterPlayersChooseCommand;
    var applicationView:ApplicationView;
    var playersChooserView:PlayersChooserView;
    var modalBackgroundView:ModalBackgroundView;

    @Before public function startup() {
        modalBackgroundView = mock(ModalBackgroundView);
        playersChooserView = mock(PlayersChooserView);
        applicationView = mock(ApplicationView);
        enterPlayersChooseCommand = new EnterPlayersChooseCommand();
        enterPlayersChooseCommand.applicationView = applicationView;
        enterPlayersChooseCommand.playersChooserView = playersChooserView;
        enterPlayersChooseCommand.modalBackgroundView = modalBackgroundView;
    }

    @Test public function should_add_modal_background():Void {
        enterPlayersChooseCommand.execute();
        applicationView.addChild(modalBackgroundView).verify(1);
    }

    @Test public function should_add_players_chooser():Void {
        enterPlayersChooseCommand.execute();
        applicationView.addChild(playersChooserView).verify(1);
    }
}