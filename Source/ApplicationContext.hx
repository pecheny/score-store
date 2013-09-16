import commands.LayoutViewsCommand;
import commands.ScaleStageCommand;
import signals.StageResizedSignal;
import view.LabelFactory;
import commands.MouseHandleCommand;
import signals.PlayerButtonSignal;
import mediators.PlayerViewMediator;
import view.PlayerView;
import mediators.ApplicationViewMediator;
import view.PlayerViewFactory;
import commands.ChangeScoreCommand;
import commands.RemovePlayerCommand;
import model.PlayerViewsModel;
import model.PlayerModel;
import commands.AddPlayerCommand;
import view.ApplicationView;
import commands.StartupCommand;
import signals.StartupSignal;
import signals.ChangeScoreSignal;
import signals.RemovePlayerSignal;
import signals.AddPlayerSignal;
import mmvc.api.IViewContainer;
class ApplicationContext extends mmvc.impl.Context {
    public function new(?contextView:IViewContainer = null) {
        super(contextView);
    }

/**
	Overrides startup to configure all context commands, models and mediators
	@see mmvc.impl.Context
	*/

    override public function startup() {
        injector.mapValue(ApplicationView, contextView);
        injector.mapSingleton(PlayerModel);
        injector.mapSingleton(PlayerViewsModel);
        injector.mapSingleton(PlayerViewFactory);
        injector.mapSingleton(LabelFactory);
        commandMap.mapSignalClass(StageResizedSignal, ScaleStageCommand);
        commandMap.mapSignalClass(StageResizedSignal, LayoutViewsCommand);
        commandMap.mapSignalClass(StartupSignal, StartupCommand);
        commandMap.mapSignalClass(AddPlayerSignal, AddPlayerCommand);
        commandMap.mapSignalClass(RemovePlayerSignal, RemovePlayerCommand);
        commandMap.mapSignalClass(ChangeScoreSignal, ChangeScoreCommand);
        commandMap.mapSignalClass(PlayerButtonSignal, MouseHandleCommand);
        mediatorMap.mapView(PlayerView, PlayerViewMediator);
        mediatorMap.mapView(ApplicationView, ApplicationViewMediator);

        var startupSignal:StartupSignal = cast injector.getInstance(StartupSignal);
        startupSignal.dispatch();
    }


    override public function shutdown() {

    }
}