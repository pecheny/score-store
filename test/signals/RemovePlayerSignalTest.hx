package signals;

import model.vo.PlayerId;
import massive.munit.Assert;

class RemovePlayerSignalTest {
    var signal:RemovePlayerSignal;

    @Before
    public function setup():Void {
        signal = new RemovePlayerSignal();
    }

    @Test
    public function signal_should_call_callback():Void {
    var callsCounter:Int = 0;
        var callback:PlayerId -> Void  = function(playerId:PlayerId) {
            callsCounter++;
        }
        signal.add(callback);
        signal.dispatch(PlayerId.fromInt(1));
        Assert.areEqual(callsCounter, 1);
    }

    @Test
       public function signal_should_pass_playerId():Void {
       var passedId:PlayerId;
           var callback:PlayerId -> Void  = function(playerId:PlayerId) {
               passedId = playerId;
           }
           signal.add(callback);
           signal.dispatch(PlayerId.fromInt(5));
           Assert.areEqual(passedId, PlayerId.fromInt(5));
       }
}