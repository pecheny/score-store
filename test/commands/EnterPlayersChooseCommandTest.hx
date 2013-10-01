package commands;
import org.hamcrest.MatchersBase;
import Array;
import Array;
import signals.AddChildSignal;
import massive.munit.Assert;
import massive.munit.Assert;
import constants.LayerName;
import flash.display.DisplayObject;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.AddPlayerSignal;
import view.ModalBackgroundView;
import view.PlayersChooserView;
import view.ApplicationView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class EnterPlayersChooseCommandTest extends MatchersBase{
    var enterPlayersChooseCommand:EnterPlayersChooseCommand;
    var applicationView:ApplicationView;
    var playersChooserView:PlayersChooserView;
    var modalBackgroundView:ModalBackgroundView;
    var timer:Timer;

    var passedNames:Array<String>;
    var passedChilds:Array<DisplayObject>;

    @Before public function startup() {
        modalBackgroundView = mock(ModalBackgroundView);
        playersChooserView = mock(PlayersChooserView);
        applicationView = mock(ApplicationView);
        enterPlayersChooseCommand = new EnterPlayersChooseCommand();
        enterPlayersChooseCommand.applicationView = applicationView;
        enterPlayersChooseCommand.playersChooserView = playersChooserView;
        enterPlayersChooseCommand.modalBackgroundView = modalBackgroundView;
        enterPlayersChooseCommand.addChildSignal = new AddChildSignal();


        passedNames = new Array<String>();
        passedChilds = new Array<DisplayObject>();
    }


    @AsyncTest public function should_add_modal_background_and_chooser(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldAddModalBackgroundHandler, 300);
        timer = Timer.delay(handler, 200);

        enterPlayersChooseCommand.addChildSignal.add(function(name:String, child:DisplayObject):Void {
            passedChilds.push(child);
            passedNames.push(name);
        });
        enterPlayersChooseCommand.execute();
    }

    function shouldAddModalBackgroundHandler():Void {
        assertThat(passedNames, arrayWithSize(2));
        assertThat(passedChilds, arrayWithSize(2));
        assertThat(passedNames, hasItemInArray(LayerName.TOP));
        assertThat(passedChilds, hasItemInArray(playersChooserView));
        assertThat(passedChilds, hasItemInArray(modalBackgroundView));
    }





}