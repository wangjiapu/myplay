public class FlutterToAndroidPlugins(FlutterActivity flutterActivity) : MethodChannel.MethodCallHandler {

    fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        // DealMethodCall.onMethodCall(activity, methodCall, result)
    }

    fun registerWith(activity: FlutterActivity) {
        val te = FlutterToAndroidPlugins(activity)
        val instance = FlutterToAndroidPlugins(activity)
        //flutter调用原生
        val channel = MethodChannel(activity.registrarFor(DealMethodCall.channels_flutter_to_native)
                .messenger(), DealMethodCall.channels_flutter_to_native)
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance)
    }
}

