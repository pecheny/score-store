package commands;
import signals.AddChildSignal;
import constants.LayerName;
import signals.AddPlayerSignal;
import view.ModalBackgroundView;
import view.ApplicationView;
import view.ScoreInputView;
import model.vo.PlayerId;
class EnterScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;
    @inject public var playerId:PlayerId;
    @inject public var modalBackgroundView:ModalBackgroundView;
    @inject public var addChildSignal:AddChildSignal;


    override public function execute():Void {
        scoreInputView.id = playerId;
        addChildSignal.dispatch(LayerName.TOP, modalBackgroundView);
        addChildSignal.dispatch(LayerName.TOP, scoreInputView);
    }

}