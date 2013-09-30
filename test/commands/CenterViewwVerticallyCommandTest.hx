package commands;
import flash.display.Sprite;
import massive.munit.Assert;
import view.ApplicationView;
import view.ViewBase;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class CenterViewwVerticallyCommandTest {
    var centerViewwVerticallyCommand:CenterViewwVerticallyCommand;
    var viewBase:ViewBase;
    var applicationView:ApplicationView;
//    var containter:Sprite;

    @Before public function startup() {
        centerViewwVerticallyCommand = new CenterViewwVerticallyCommand();
//        containter = new Sprite();
        viewBase = new ViewBase();
        applicationView = mock(ApplicationView);
        applicationView.calculateScale().returns(1);
        centerViewwVerticallyCommand.viewBase = viewBase;
        centerViewwVerticallyCommand.applicationView = applicationView;
    }

    @Test public function should_center_view():Void {
        viewBase.initBounds(100, 300, 0);
        applicationView.getStageHeight().returns(800);
//        applicationView.getRootContainer().returns(containter)
        centerViewwVerticallyCommand.execute();
        Assert.areEqual(250, viewBase.y);
    }
}