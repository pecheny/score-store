package commands;
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
class ShowModalWindowCommandTest extends MatchersBase {
    var showModalWindowCommand:ShowModalWindowCommand;
    var passedLayerName:String;
    var passedChilds:Array<DisplayObject>;
    var child:Sprite;
    var bg:ModalBackgroundView;
    var timer:Timer;


    @Before public function startup() {
        passedChilds = new Array<DisplayObject>();
        child = mock(Sprite);
        bg = mock(ModalBackgroundView);

        showModalWindowCommand = new ShowModalWindowCommand();
        showModalWindowCommand.playerViewFactory = mock(PlayerViewFactory);
        showModalWindowCommand.playerViewFactory.grtModalBackground().returns(bg);
        showModalWindowCommand.window = child;

        showModalWindowCommand.addChildSignal = new AddChildSignal();
        showModalWindowCommand.addChildSignal.add(function(layerName:String, child:DisplayObject) {
            passedLayerName = layerName;
            passedChilds.push(child);
        });

        showModalWindowCommand.playerViewsModel = mock(PlayerViewsModel);
    }

    @AsyncTest public function should_dispatch_addChild(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchAddchildHandler, 300);
        timer = Timer.delay(handler, 200);
        showModalWindowCommand.execute();
    }

    function shouldDispatchAddchildHandler():Void {
        assertThat(passedChilds, arrayWithSize(2));
        assertThat(passedChilds, contains(bg, child));
        Assert.areEqual(LayerName.TOP, passedLayerName);
    }

    @AsyncTest public function should_add_views_to_model(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldAddViewsToModelHandler, 300);
        timer = Timer.delay(handler, 200);
        showModalWindowCommand.execute();
    }

    function shouldAddViewsToModelHandler():Void {
        showModalWindowCommand.playerViewsModel.addCustomView(CustomViewName.BACKGROUND, bg).verify();
        showModalWindowCommand.playerViewsModel.addCustomView(CustomViewName.WINDOW, child).verify();
    }
}