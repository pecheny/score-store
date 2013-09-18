package model;
import view.ViewBase;
using Lambda;
class ViewsModel {
    public static var KEY_EXISTS:String = "Key exists";
    public static var VALUE_EXISTS:String = "Value exists";
    public static var VALUE_NOT_EXISTS:String = "Value does not exist";

    var customViews:Map<String, ViewBase>;

    public function new():Void {
        customViews = new Map<String, ViewBase>();
    }


    public function addCustomView(name:String, view:ViewBase):Void {
        if (customViews.exists(name)) {
            throw KEY_EXISTS;
        }
        if (customViews.has(view)) {
            throw VALUE_EXISTS;
        }
        customViews[name] = view;
    }

    public function getCustomViews():Array<ViewBase> {
    var val = new Array<ViewBase>();
        for (view in customViews.iterator()) {
        val.push(view);
        }
        return val;
    }

    public function getCustomView(name:String):ViewBase {
        if (hasCustomView(name)) {
            return customViews[name];
        }
        else {
            throw VALUE_NOT_EXISTS;
        }
    }

    public function removeCustomView(name:String):Void {
        if (hasCustomView(name)) {
            customViews.remove(name);
        }
        else {
            throw VALUE_NOT_EXISTS;
        }
    }

    public function hasCustomView(name:String):Bool {
        return customViews.exists(name);
    }

}