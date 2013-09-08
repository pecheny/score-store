package signals;

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
        var callback:Int -> Int -> Void  = function(playerId:Int, deltaScore:Int) {
            callsCounter++;
        }
        signal.add(callback);
        signal.dispatch(1, 1);
        Assert.areEqual(callsCounter, 1);
    }

    @Test
       public function signal_should_pass_playerId_and_deltaScore():Void {
       var passedId:Int = 0;
       var passedDelta:Int = 0;
           var callback:Int -> Int -> Void  = function(playerId:Int, deltaScore:Int) {
               passedId = playerId;
               passedDelta = deltaScore;
           }
           signal.add(callback);
           signal.dispatch(2, 5);
           Assert.areEqual(passedId, 2);
           Assert.areEqual(passedDelta, 5);
       }
}