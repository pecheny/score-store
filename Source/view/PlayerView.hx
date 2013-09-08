package view;
import flash.text.TextFormat;
import flash.text.TextField;
import openfl.Assets;
import flash.text.Font;
import flash.display.Sprite;
class PlayerView extends Sprite {
    private var mTF:TextField;

    public function new() {
        super();
        graphics.beginFill(0, 0.75);
        graphics.drawRoundRect(0, 0, 300, 100, 20, 20);
        graphics.endFill();
        initTextField();
    }

    private function initTextField() {
        var fontAsset:Font = Assets.getFont("assets/DroidSans-Bold.ttf");
        var mTFormat:TextFormat = new TextFormat(fontAsset.fontName, 30);
        mTFormat.color = 0xffffff;
        mTF = new TextField();
        mTF.defaultTextFormat = mTFormat;
        mTF.embedFonts = true;
        mTF.x = 30;
        mTF.y = 30;
//            mTF.height = sourceTextField.height;
//            mTF.width = sourceTextField.width;
//            mTF.text = sourceTextField.text;
//            mTF.transform.matrix = sourceTextField.transform.matrix;
//            parent.removeChild(sourceTextField);
        addChild(mTF);
    }

    public function setText(text:String):Void {
        mTF.text = text;
    }
}