import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_frontend/components/constants.dart';
import 'package:flutter_frontend/screens/scanned_food.dart';
import 'loading_image_screen.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    //availableCameras().then((availableCameras) {
    //  //final cameras = availableCameras;
    //  //final camera = cameras.first;

    //});
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Center(child: CameraPreview(_controller));
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            _controller.setFlashMode(FlashMode.off);
            final image = await _controller.takePicture();

            var file = File(image.path);

            print(file.lengthSync());

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: kPrussian,
          title: Text('Display the Picture'),
          automaticallyImplyLeading: false),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.file(File(imagePath)),
              height: MediaQuery.of(context).size.height - 150,
              //width: 100,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Go back',
                        style: kMenuText,
                      )),
                  OutlinedButton(
                      onPressed: () async {
                        var dio = Dio();
                        var formData = FormData.fromMap({
                          'user': 'pinkguy@hotmail.com',
                          'receipt': await MultipartFile.fromFile(imagePath,
                              filename: 'upload.jpg'),
                        });
                        //var response = await dio.post('${endpoint}/api/v1/inventory/process-receipt', data: formData);

                        // call api stuff\
                        //final postUri = Uri.http(endpoint,
                        //    '/api/v1/inventory/process-receipt', user);

                        ////var postUri = Uri.parse("<APIUrl>");
                        //var request = http.MultipartRequest("POST", postUri);
                        //request.fields['user'] = 'pinkguy@hotmail.com';
                        //request.files.add(http.MultipartFile.fromBytes(
                        //    'receipt',
                        //    await File.fromUri(Uri.parse(imagePath))
                        //        .readAsBytes(),
                        //    contentType: MediaType('image', 'jpeg')));

                        print('sedning');
                        print(formData);

                        dio
                            .post(
                                'http://${endpoint}/api/v1/inventory/process-receipt',
                                data: formData,
                                options:
                                    Options(contentType: 'application/json'))
                            .then((response) {
                          if (response.statusCode == 200) {
                            print("Uploaded!");
                            print(response.data);

                            //try {
                            //  List<Map<dynamic, dynamic>> data = response.data;
                            //  print(data);
                            //} catch (e) {
                            //  return Center(child: Text('Error, there is no text', style: kTitleText));
                            //}

                            //  Navigator.push(
                            //      context,
                            //      MaterialPageRoute(
                            //          builder: (context) =>
                            //              ScannedFoodScreen(map: <Map>[
                            //                {'name': 'Apple', 'expiryduration': '7'}
                            //              ])));
                            //}
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ScannedFoodScreen(map: jsonDecode(response.data))));
                          }
                        });

                        //http.post(
                        //  uri,
                        //  body: jsonEncode(<String, String>{
                        //    'receipt': Image.file(File(imagePath)),
                        //  }),
                        //);

                        //Navigator.push(
                        //    context,
                        //    MaterialPageRoute(
                        //        builder: (context) => ScannedFoodScreen()));
                      },
                      child: Text(
                        'Export',
                        style: kMenuText,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
