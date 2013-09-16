package view;

import massive.munit.Assert;
class ViewBaseTest {
    public var viewBase:ViewBase;

    @Before
    public function setup():Void {
        viewBase = new ViewBase();
    }

    @Test
    public function should_return_height_according_to_content():Void {
        viewBase.graphics.beginFill(0);
        viewBase.graphics.drawRect(0,0, 100, 100);
        viewBase.graphics.endFill();
        Assert.areEqual(viewBase.getHeight(), 100);
    }


}