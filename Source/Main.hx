package;


import signals.RemovePlayerSignal;
import flash.text.TextField;
import flash.geom.Matrix;
import flash.text.TextFormat;
import flash.display.Sprite;
import flash.display.DisplayObjectContainer;
import format.SWF;
import openfl.Assets;
import flash.text.Font;


class Main extends Sprite {


    public function new() {

        super();
        var swf:SWF = new SWF (Assets.getBytes("assets/CounterAssets.swf"));
        var testButton:Sprite = swf.createMovieClip("PlayerUnitView");
        addChild(testButton);
testButton.transform.matrix = new Matrix();
                var name:TextField = cast testButton.getChildByName("_name");
                initTextField(name);
        var sig = new RemovePlayerSignal(Int);
    //        name.text = "Name";
    //        name.textColor = 0xffffff;
    //        name.defaultTextFormat = mTFormat;
    //        name.embedFonts = true;

           //     trace(name);

    }


public function initTextField(sourceTextField:TextField){
        var fontAsset:Font = Assets.getFont("assets/DroidSans-Bold.ttf");
        var mTFormat:TextFormat = new TextFormat(fontAsset.fontName, sourceTextField.textHeight);
        mTFormat.color =0xffffff;
        var parent:DisplayObjectContainer = cast (sourceTextField.parent);


        var mTF:TextField = new TextField();
        mTF.defaultTextFormat = mTFormat;
        mTF.embedFonts = true;
        mTF.height = sourceTextField.height;
        mTF.width = sourceTextField.width;
        mTF.text = sourceTextField.text;
        mTF.transform.matrix = sourceTextField.transform.matrix;
        parent.removeChild(sourceTextField);
        parent.addChild(mTF);
}

}
