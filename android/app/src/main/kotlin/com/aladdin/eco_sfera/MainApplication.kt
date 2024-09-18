import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
//        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("e8aa5b2d-956d-4a52-97ec-b4cf0782e527") // Your generated API key
    }
}