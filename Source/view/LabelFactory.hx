package view;
import flash.text.TextFormat;
import openfl.Assets;
import flash.text.Font;
import flash.text.TextField;
class LabelFactory {
    public function new() {
    }

    public function getLabel(fontSize:Int, fontColor:UInt):TextField {
        var fontAsset:Font = Assets.getFont("assets/DroidSans-Bold.ttf");
        var mTFormat:TextFormat = new TextFormat(fontAsset.fontName, fontSize);
        mTFormat.color = fontColor;
        var mTF:TextField = new TextField();
        mTF.defaultTextFormat = mTFormat;
        mTF.embedFonts = true;
        return mTF;
    }
}