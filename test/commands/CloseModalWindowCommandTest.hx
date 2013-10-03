package commands;
import signals.RemoveChildSignal;
import constants.CustomViewName;
import constants.LayerName;
import massive.munit.Assert;
import org.hamcrest.MatchersBase;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import model.PlayerViewsModel;
import factories.PlayerViewFactory;
import view.ModalBackgroundView;
import flash.display.Sprite;
import Array;
import flash.display.DisplayObject;
import signals.AddChildSignal;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class CloseModalWindowCommandTest extends MatchersBase {
    var showModalWindowCommand:CloseModalWindowCommand;
    var passedLayerName:String;
    var passedChilds:Array<DisplayObject>;
    var child:Sprite;
    var bg:ModalBackgroundView;
    var timer:Timer;


    @Before public function startup() {
        passedChilds = new Array<DisplayObject>();
        child = mock(Sprite);
        bg = mock(ModalBackgroundView);

        showModalWindowCommand = new CloseModalWindowCommand();

        showModalWindowCommand.removeChildSignal = new RemoveChildSignal();
        showModalWindowCommand.removeChildSignal.add(function(child:DisplayObject) {
            passedChilds.push(child);
        });

        showModalWindowCommand.playerViewsModel = mock(PlayerViewsModel);
        showModalWindowCommand.playerViewsModel.getCustomView(CustomViewName.BACKGROUND).returns(bg);
        showModalWindowCommand.playerViewsModel.getCustomView(CustomViewName.WINDOW).returns(child);
    }

    @AsyncTest public function should_dispatch_removeChild(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchRemovechildHandler, 300);
        timer = Timer.delay(handler, 200);
        showModalWindowCommand.execute();
    }

    function shouldDispatchRemovechildHandler():Void {
        assertThat(passedChilds, arrayWithSize(2));
        assertThat(passedChilds, containsInAnyOrder(bg, child));
    }

    @AsyncTest public function should_remove_views_to_model(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRemoveViewsToModelHandler, 300);
        timer = Timer.delay(handler, 200);
        showModalWindowCommand.execute();
    }

    function shouldRemoveViewsToModelHandler():Void {
        showModalWindowCommand.playerViewsModel.removeCustomView(CustomViewName.BACKGROUND).verify();
        showModalWindowCommand.playerViewsModel.removeCustomView(CustomViewName.WINDOW).verify();
    }
}