import mediators.ModalBackgroundViewMediator;
import view.ModalBackgroundView;
import commands.CenterViewwVerticallyCommand;
import signals.CenterViewwVerticallySignal;
import signals.LeaveScoreInputModeSignal;
import commands.LeaveScoreInputModeCommand;
import commands.EnterScoreInputModeCommand;
import signals.EnterScoreInputModeSignal;
import view.ScoreInputView;
import mediators.ScoreInputViewMediator;
import mediators.PlayerEditorViewMediator;
import view.PlayerEditorView;
import commands.EnterGameModeCommand;
import signals.EnterGameModeSignal;
import commands.EnterEditModeCommand;
import signals.EnterEditModeSignal;
import signals.UpdateLayoutSignal;
import mediators.ButtonMediator;
import view.Button;
import commands.RefreshButtonsCommand;
import signals.RefreshButtonsSignal;
import signals.PlayersModifyComplete;
import signals.NewGameSignal;
import signals.ExitSignal;
import commands.EmptyCommand;
import model.ButtonsModel;
import model.ButtonBarContainerModel;
import commands.LayoutViewsCommand;
import commands.ScaleStageCommand;
import signals.StageResizedSignal;
import factories.LabelFactory;
import commands.MouseHandleCommand;
import signals.PlayerButtonSignal;
import mediators.PlayerViewMediator;
import view.PlayerView;
import mediators.ApplicationViewMediator;
import factories.PlayerViewFactory;
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

    override public function startup() {
        injector.mapValue(ApplicationView, contextView);
        injector.mapSingleton(PlayerModel);
        injector.mapSingleton(PlayerViewsModel);
        injector.mapSingleton(ButtonsModel);
        injector.mapSingleton(ButtonBarContainerModel);
        injector.mapSingleton(PlayerViewFactory);
        injector.mapSingleton(LabelFactory);
        injector.mapSingleton(ScoreInputView);
        injector.mapSingleton(ModalBackgroundView);
        commandMap.mapSignalClass(ExitSignal, EmptyCommand);
        commandMap.mapSignalClass(EnterEditModeSignal, EnterEditModeCommand);
        commandMap.mapSignalClass(EnterGameModeSignal, EnterGameModeCommand);
        commandMap.mapSignalClass(RefreshButtonsSignal, RefreshButtonsCommand);
        commandMap.mapSignalClass(NewGameSignal, EmptyCommand);
        commandMap.mapSignalClass(PlayersModifyComplete, EmptyCommand);
        commandMap.mapSignalClass(StageResizedSignal, ScaleStageCommand);
        commandMap.mapSignalClass(StageResizedSignal, LayoutViewsCommand);
        commandMap.mapSignalClass(UpdateLayoutSignal, LayoutViewsCommand);
        commandMap.mapSignalClass(StartupSignal, StartupCommand);
        commandMap.mapSignalClass(AddPlayerSignal, AddPlayerCommand);
        commandMap.mapSignalClass(RemovePlayerSignal, RemovePlayerCommand);
        commandMap.mapSignalClass(ChangeScoreSignal, ChangeScoreCommand);
        commandMap.mapSignalClass(PlayerButtonSignal, MouseHandleCommand);
        commandMap.mapSignalClass(EnterScoreInputModeSignal, EnterScoreInputModeCommand);
        commandMap.mapSignalClass(LeaveScoreInputModeSignal, LeaveScoreInputModeCommand);
        commandMap.mapSignalClass(CenterViewwVerticallySignal, CenterViewwVerticallyCommand);
        mediatorMap.mapView(Button, ButtonMediator);
        mediatorMap.mapView(PlayerView, PlayerViewMediator);
        mediatorMap.mapView(PlayerEditorView, PlayerEditorViewMediator);
        mediatorMap.mapView(ScoreInputView, ScoreInputViewMediator);
        mediatorMap.mapView(ModalBackgroundView, ModalBackgroundViewMediator);
        mediatorMap.mapView(ApplicationView, ApplicationViewMediator);

        var startupSignal:StartupSignal = cast injector.getInstance(StartupSignal);
        startupSignal.dispatch();
    }


    override public function shutdown() {

    }
}