package constants;
import model.vo.PlayerId;
class PlayerColor {
    public static inline var PLALYER_1:String = "Blue";
    public static inline var PLALYER_2:String = "Yellow";
    public static inline var PLALYER_3:String = "Red";
    public static inline var PLALYER_4:String = "Green";
    public static inline var PLALYER_5:String = "Pink";
    public static inline var PLALYER_6:String = "Grey";
    public static inline var PLALYER_7:String = "Violet";
    public static inline var PLALYER_8:String = "White";

    public static function getPlayerColor(id:PlayerId):String {
        switch(id.toInt()) {
            case 1:
                return PLALYER_1;
            case 2:
                return PLALYER_2;
            case 3:
                return PLALYER_3;
            case 4:
                return PLALYER_4;
            case 5:
                return PLALYER_5;
            case 6:
                return PLALYER_6;
            case 7:
                return PLALYER_7;
            case 8:
                return PLALYER_8;
        }
        throw "Unknown player id: " + id.toInt();
    }
}