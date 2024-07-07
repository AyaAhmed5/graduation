import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logaya/authorization.dart';
import 'package:logaya/qr.dart';
import 'face_cubit.dart';
import 'face_state.dart';

class FaceDetectionScreen extends StatelessWidget {
  final String? username;

  const FaceDetectionScreen({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaceDetectionCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Face Recognition'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return autho();
                  },
                ),
              );
            },
          ),
        ),
        body: BlocConsumer<FaceDetectionCubit, FaceDetectionState>(
          listener: (context, state) {
            if (state is FaceDetectionSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRScanPage()),
              );
            } else if (state is FaceDetectionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            var cubit = FaceDetectionCubit.get(context);
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey,
                      child: Center(
                        child: cubit.image == null
                            ? const Icon(
                          Icons.add_a_photo,
                          size: 60,
                        )
                            : Image.file(cubit.image!),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: const Color.fromARGB(255, 7, 61, 105),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.pickImage(ImageSource.camera);
                        },
                        child: const Text(
                          'Take a photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: const Color.fromARGB(255, 7, 61, 105),
                      child: MaterialButton(
                        onPressed: cubit.recognizeFace,
                        child: const Text(
                          'Recognize Face',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (state is FaceDetectionSuccess)
                      Text(
                        'Recognized Name: ${state.recognizedName}',
                        style: const TextStyle(fontSize: 18),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
