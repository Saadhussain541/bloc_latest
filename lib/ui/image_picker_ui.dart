import 'dart:io';

import 'package:bloc1/bloc/imagePickerExample/image_picker_bloc.dart';
import 'package:bloc1/bloc/imagePickerExample/image_picker_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/imagePickerExample/image_picker_state.dart';
class ImagePickerUi extends StatefulWidget {
  const ImagePickerUi({super.key});

  @override
  State<ImagePickerUi> createState() => _ImagePickerUiState();
}

class _ImagePickerUiState extends State<ImagePickerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Example'),
      ),

      body: Center(
        child: Column(
          children: [
            BlocBuilder<ImagePickerBloc,ImagePickState>(builder: (context, state) {
              if(state.file==null)
                {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          context.read<ImagePickerBloc>().add(ImageCameraCapture());
                        },
                        child: Center(
                          child: Icon(Icons.camera),
                        ),
                      ),
                    ],
                  );
                }
              else
                {
                  return Image.file(File(state.file!.path.toString()));
                }

            },),

          ],
        ),
      ),
    );
  }
}
