package commands;
import model.PlayerModel;
class DumpStateCommand extends mmvc.impl.Command {

    @inject public var playerModel:PlayerModel;

    override public function execute():Void {
#if mobile
        var state = playerModel.getStateMap();
        var s = haxe.Serializer.run(state);
        var dirPath = SystemPath.documentsDirectory + FilePaths.APP_DIR;
        if (!FileSystem.exists(dirPath)) {
            FileSystem.createDirectory(dirPath);
        }
        sys.io.File.saveContent(dirPath + FilePaths.SESSION_FILE_NAME, s);
#end
    }
}