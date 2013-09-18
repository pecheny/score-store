package model;

import org.hamcrest.MatchersBase;
import view.ViewBase;
import model.vo.PlayerId;
import view.PlayerView;
import org.hamcrest.MatcherAssert;
import massive.munit.Assert;
using org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;

class ViewsModelTest extends MatchersBase {
    var viewsModel:ViewsModel;

    @Before
    public function setup():Void {
        viewsModel = new ViewsModel();
    }


    @Test
    public function should_add_custom_view():Void {
        var customView = mock(ViewBase);
        var name = "CustomName";
        viewsModel.addCustomView(name, customView);
        Assert.isTrue(viewsModel.hasCustomView(name));
    }

    @Test
    public function should_hon_have_not_added_views():Void {
        var name = "CustomName";
        Assert.isFalse(viewsModel.hasCustomView(name));
    }

    @Test public function should_return_custom_view():Void {
        var customView = mock(ViewBase);
        var name = "CustomName";
        viewsModel.addCustomView(name, customView);
        Assert.areEqual(viewsModel.getCustomView(name), customView);
    }

    @Test public function should_return_custom_views():Void {
        var customView1 = mock(ViewBase);
        var customView2 = mock(ViewBase);
        var name1 = "CustomName1";
        var name2 = "CustomName2";
        viewsModel.addCustomView(name1, customView1);
        viewsModel.addCustomView(name2, customView2);
        var views = viewsModel.getCustomViews();

        assertThat(views, arrayWithSize(2));
        assertThat(views, hasItemInArray(customView1));
        assertThat(views, hasItemInArray(customView2));
    }

    @Test public function should_remove_custom_view():Void {
        var customView1 = mock(ViewBase);
        var customView2 = mock(ViewBase);
        var name1 = "CustomName1";
        var name2 = "CustomName2";
        viewsModel.addCustomView(name1, customView1);
        viewsModel.addCustomView(name2, customView2);
        viewsModel.removeCustomView(name1);
        Assert.isFalse(viewsModel.hasCustomView(name1));
        Assert.isTrue(viewsModel.hasCustomView(name2));
        viewsModel.removeCustomView(name2);
        Assert.isFalse(viewsModel.hasCustomView(name1));
        Assert.isFalse(viewsModel.hasCustomView(name1));
    }

    @Test public function should_not_add_same_view_with_different_names():Void {
        var customView = mock(ViewBase);
        var msg:String = "";
        try {
            viewsModel.addCustomView("Name1", customView);
            viewsModel.addCustomView("Name2", customView);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ViewsModel.VALUE_EXISTS);
    }

    @Test public function should_not_remove_not_existing_view():Void {
        var msg:String = "";
        try {
        viewsModel.removeCustomView("Name");
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ViewsModel.VALUE_NOT_EXISTS);
    }

    @Test public function should_not_add_view_with_existing_name():Void {
        var customView1 = mock(ViewBase);
        var customView2 = mock(ViewBase);
        var msg:String = "";
        try {
            viewsModel.addCustomView("Name1", customView1);
            viewsModel.addCustomView("Name1", customView2);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ViewsModel.KEY_EXISTS);
    }


}