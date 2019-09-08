package jonasbark.de.stripepaymentexample

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        //StripeDialog.newInstance("Timmey", "pk_test_6t39nf6YPtFGRdZ5gHmxvMd6").show(supportFragmentManager, "")
    }
}
