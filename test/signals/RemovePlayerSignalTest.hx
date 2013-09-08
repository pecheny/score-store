package signals;

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
        var callback:Int -> Void  = function(playerId:Int) {
            callsCounter++;
        }
        signal.add(callback);
        signal.dispatch(1);
        Assert.areEqual(callsCounter, 1);
    }

    @Test
       public function signal_should_pass_playerId():Void {
       var passedId:Int = 0;
           var callback:Int -> Void  = function(playerId:Int) {
               passedId = playerId;
           }
           signal.add(callback);
           signal.dispatch(5);
           Assert.areEqual(passedId, 5);
       }
}