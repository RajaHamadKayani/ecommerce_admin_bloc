import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:http/http.dart' as http;
class UploadImageToCloudinary {
  static Future<String> uploadImageToCloudinary(File imageFile) async {
    final cloudName = 'dqs1y6urv'; // Replace with your Cloudinary Cloud Name
    final apiKey = '463369248646777'; // Replace with your Cloudinary API Key
    final preset = 'ecommerce_preset'; // Replace with your Cloudinary Upload Preset

   
  final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
  final request = http.MultipartRequest('POST', url)
    ..fields['upload_preset'] = preset
    ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  final response = await request.send();
  if (response.statusCode == 200) {
   FlushbarHelper.createSuccess(message: "Image Uploaded to cloudinary successfully");
    final res = await http.Response.fromStream(response);
    final data = jsonDecode(res.body);
    return data['secure_url']; // Image URL from Cloudinary
  } else {
    FlushbarHelper.createError(message: 'Failed to upload image to Cloudinary');
    throw Exception('Failed to upload image to Cloudinary');
  }
  }
}