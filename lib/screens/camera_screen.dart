import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/image_picker_service.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePickerService = ref.watch(imagePickerServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Column(
        children: [
          Center(
            child: imagePickerService.imagePath != null
                ? Image(
                    image: FileImage(imagePickerService.imagePath!),
                  )
                : Icon(Icons.image_search),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 255, 168, 7),
                ),
                onPressed: () {
                  imagePickerService.takeCamera();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.photo,
                  color: Color.fromARGB(255, 255, 168, 7),
                ),
                onPressed: () {
                  imagePickerService.takeGallery();
                },
              ),
              SizedBox(
                width: 300.0,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
