import 'package:device_preview/device_preview.dart';
import 'package:device_preview/plugins.dart';
import 'package:flutter/material.dart';
import 'core/navigation/nav_host.dart';

void main() {
  runApp(
      DevicePreview(
          enabled: false,
          plugins: const [
            ScreenshotPlugin(),
            FileExplorerPlugin(),
            SharedPreferencesExplorerPlugin(),
          ],
          builder: (BuildContext context) =>  const MyApp(),
          )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        // home: PinterestGrid()
        // home: CompatibilityScreen()

      home: NavHost(
          // subRout: PeopleScreen()
      )
      //
      // home: NavHost(
      //     // subRout: HomeScreen())
      //     subRout: ProfileScreen())
      //   home: ProfileSettings(),
      //   home: TariffScreen(),


    );
  }
}

