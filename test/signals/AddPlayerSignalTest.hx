package signals;

import massive.munit.Assert;

class AddPlayerSignalTest {
    var signal:AddPlayerSignal;

    @Before
    public function setup():Void {
        signal = new AddPlayerSignal();
    }

    @Test
    public function signal_should_call_callback():Void {
    var callsCounter:Int = 0;
        var callback:Void -> Void  = function() {
            callsCounter++;
        }
        signal.add(callback);
        signal.dispatch();
        Assert.areEqual(callsCounter, 1);
    }
}