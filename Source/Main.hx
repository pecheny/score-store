import flash.Lib;
class Main {

    public static function main() {
        var view = new view.ApplicationView(Lib.current);
        var context = new ApplicationContext(view);
    }
}