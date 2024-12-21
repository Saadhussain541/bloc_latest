import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickState extends Equatable
{
  final XFile? file;
  const ImagePickState({this.file});

  ImagePickState copyWith({XFile? file}){
    return ImagePickState(file: file??this.file);
  }


  @override
  List<Object?> get props=>[file];
}
