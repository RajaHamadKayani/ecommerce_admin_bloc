import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> getImage() async {
    final XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }
}
