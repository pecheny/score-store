package signals;

import model.vo.PlayerId;
import massive.munit.Assert;

class ChangeScoreSignalTest {
    var signal:ChangeScoreSignal;

    @Before
    public function setup():Void {
        signal = new ChangeScoreSignal();
    }

    @Test
    public function signal_should_call_callback():Void {
    var callsCounter:Int = 0;
        var callback:PlayerId -> Int -> Void  = function(playerId:PlayerId, deltaScore:Int) {
            callsCounter++;
        }
        signal.add(callback);
        signal.dispatch(PlayerId.fromInt(1), 1);
        Assert.areEqual(callsCounter, 1);
    }

    @Test
       public function signal_should_pass_playerId_and_deltaScore():Void {
       var passedId:PlayerId;
       var passedDelta:Int = 0;
           var callback:PlayerId -> Int -> Void  = function(playerId:PlayerId, deltaScore:Int) {
               passedId = playerId;
               passedDelta = deltaScore;
           }
           signal.add(callback);
           signal.dispatch(PlayerId.fromInt(2), 5);
           Assert.areEqual(passedId, PlayerId.fromInt(2));
           Assert.areEqual(passedDelta, 5);
       }
}