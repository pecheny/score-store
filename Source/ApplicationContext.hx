import signals.CloseModalWindowSignal;
import signals.ShowModalWindowSignal;
import commands.StartNewGameCommand;
import mediators.ScrollerBackgroundViewMediator;
import view.ScrollerBackgroundView;
import mediators.ScrollContainerMediator;
import view.ScrollContainer;
import signals.RemoveChildSignal;
import signals.AddChildSignal;
import commands.ShowModalWindowCommand;
import commands.CloseModalWindowCommand;
import mediators.PlayersChooserViewMediator;
import view.PlayersChooserView;
import mediators.PlayerSwitcherViewMediator;
import view.PlayerSwitcherView;
import mediators.ModalBackgroundViewMediator;
import view.ModalBackgroundView;
import commands.CenterViewVerticallyCommand;
import signals.CenterViewVerticallySignal;
import view.ScoreInputView;
import mediators.ScoreInputViewMediator;
import mediators.PlayerEditorViewMediator;
import view.PlayerEditorView;
import signals.UpdateLayoutSignal;
import mediators.ButtonMediator;
import view.Button;
import commands.RefreshButtonsCommand;
import signals.RefreshButtonsSignal;
import signals.NewGameSignal;
import signals.ExitSignal;
import commands.EmptyCommand;
import model.ButtonsModel;
import model.ButtonBarContainerModel;
import commands.LayoutViewsCommand;
import commands.ScaleStageCommand;
import signals.StageResizedSignal;
import factories.LabelFactory;
import mediators.PlayerViewMediator;
import view.PlayerView;
import mediators.ApplicationViewMediator;
import factories.PlayerViewFactory;
import commands.ChangeScoreCommand;
import commands.DisablePlayerCommand;
import model.PlayerViewsModel;
import model.PlayerModel;
import commands.EnablePlayerCommand;
import view.ApplicationView;
import commands.StartupCommand;
import signals.StartupSignal;
import signals.ChangeScoreSignal;
import signals.DisablePlayerSignal;
import signals.EnablePlayerSignal;
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
        injector.mapSingleton(PlayersChooserView);
        injector.mapSingleton(AddChildSignal);
        injector.mapSingleton(RemoveChildSignal);
        commandMap.mapSignalClass(ExitSignal, EmptyCommand);
        commandMap.mapSignalClass(RefreshButtonsSignal, RefreshButtonsCommand);
        commandMap.mapSignalClass(NewGameSignal, StartNewGameCommand);
        commandMap.mapSignalClass(StageResizedSignal, ScaleStageCommand);
        commandMap.mapSignalClass(StageResizedSignal, LayoutViewsCommand);
        commandMap.mapSignalClass(UpdateLayoutSignal, LayoutViewsCommand);
        commandMap.mapSignalClass(StartupSignal, StartupCommand);
        commandMap.mapSignalClass(EnablePlayerSignal, EnablePlayerCommand);
        commandMap.mapSignalClass(DisablePlayerSignal, DisablePlayerCommand);
        commandMap.mapSignalClass(ChangeScoreSignal, ChangeScoreCommand);
        commandMap.mapSignalClass(ShowModalWindowSignal, ShowModalWindowCommand);
        commandMap.mapSignalClass(CloseModalWindowSignal, CloseModalWindowCommand);
        commandMap.mapSignalClass(CenterViewVerticallySignal, CenterViewVerticallyCommand);
        mediatorMap.mapView(Button, ButtonMediator);
        mediatorMap.mapView(PlayerView, PlayerViewMediator);
        mediatorMap.mapView(PlayerEditorView, PlayerEditorViewMediator);
        mediatorMap.mapView(ScoreInputView, ScoreInputViewMediator);
        mediatorMap.mapView(PlayerSwitcherView, PlayerSwitcherViewMediator);
        mediatorMap.mapView(PlayersChooserView, PlayersChooserViewMediator);
        mediatorMap.mapView(ModalBackgroundView, ModalBackgroundViewMediator);
        mediatorMap.mapView(ScrollContainer, ScrollContainerMediator);
        mediatorMap.mapView(ScrollerBackgroundView, ScrollerBackgroundViewMediator);
        mediatorMap.mapView(ApplicationView, ApplicationViewMediator);

        var startupSignal:StartupSignal = cast injector.getInstance(StartupSignal);
        startupSignal.dispatch();
    }


    override public function shutdown() {

    }
}