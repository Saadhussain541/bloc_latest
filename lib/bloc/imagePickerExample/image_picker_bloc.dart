import 'package:bloc/bloc.dart';
import 'package:bloc1/bloc/imagePickerExample/image_picker_state.dart';
import 'package:bloc1/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_event.dart';
class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickState>
{
  ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils):super(const ImagePickState())
  {
    on<ImageCameraCapture>(cameraCapture);

  }

  void cameraCapture(ImagePickerEvent event,Emitter<ImagePickState> emit) async
  {
    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));

  }

  void galleryPick(ImagePickerEvent event,Emitter<ImagePickState> emit) async
  {
    XFile? file=await imagePickerUtils.galleryPicker();
    emit(state.copyWith(file: file));
  }



}