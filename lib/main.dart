import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/screens/camera.dart';
import 'package:flutter_frontend/screens/home.dart';
import 'package:flutter_frontend/screens/inventory.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/login_screen.dart';

import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(ProviderScope(child: App(camera: firstCamera)));
}

class App extends ConsumerStatefulWidget  {
  // Create the initialization Future outside of `build`:
  const App({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  //@override
  //void initState() {
  //  // TODO: implement initState
  //  super.initState();
  //  ref.read(CameraProvider).state = widget.camera;
  //}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp(camera: widget.camera);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            textTheme: GoogleFonts.robotoTextTheme(
              Theme.of(context).textTheme,
            ),
            backgroundColor: Colors.white),
        //initialRoute: HomeScreen.id,
        //routes: {
        //  LoginScreen.id: (context) => LoginScreen(),
        //  HomeScreen.id: (context) => HomeScreen(),
        //  CameraScreen.id: (context) => CameraScreen(
        //        //camera: camera,
        //      ),
        //  InventoryScreen.id: (context) => InventoryScreen(),
        //}
        home: LoginScreen()
        );
  }
}
