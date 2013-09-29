package constants;
typedef LabelStyle = {
size:Int,
spacing:Float,
color:UInt,
align:String
}
class PlayerViewStyle {

    public static var GRID_STEP:Int = 20;




    public static var CORNER_RADIUS:Float = 50;
    public static var UNIT_HEIGHT:Float = 140;
    public static var UNIT_WIDTH:Float = 500;


    public static var STYLE_SCORE:LabelStyle = {
    var val:LabelStyle = {
    size : 92,
    spacing : 0,
    color:0xffffff,
    align:"right"};
    val;
    };

    public static var STYLE_NAME:LabelStyle = {
    var val:LabelStyle = {
    size : 32,
    spacing : 0,
    color:0xffffff,
    align:"left"};
    val;
    };

    public static var STYLE_SCORE_INPUT_DIGIT:LabelStyle = {
    var val:LabelStyle = {
    size : 82,
    spacing : 0,
    color:0x999999,
    align:"left"};
    val;
    };

    public static var STYLE_SCORE_INPUT_VALUE:LabelStyle = {
    var val:LabelStyle = {
    size : 82,
    spacing : 0,
    color:0xffffff,
    align:"center"};
    val;
    };

    public static var STYLE_NAME_EDITOR:LabelStyle = {
    var val:LabelStyle = Reflect.copy(STYLE_NAME);
    val.color = 0;
    val;
    };

}