import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final cameraProvider = FutureProvider<CameraDescription>((ref) async {
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  return cameras.first;
});

