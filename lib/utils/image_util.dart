import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUtil {
  static final ImagePicker _picker = ImagePicker();

  static Future<String?> pickAndCropImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        return await _cropImage(pickedFile.path);
      }
    } catch (e) {
      await _handlePermissionError(context, source);
    }
    return null;
  }

  static Future<String?> _cropImage(String imagePath) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit Photo',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
          ),
          IOSUiSettings(title: 'Edit Photo'),
        ],
      );
      return croppedFile?.path;
    } catch (e) {
      debugPrint('Error cropping image: $e');
    }
    return null;
  }

  static Future<void> _handlePermissionError(
      BuildContext context, ImageSource source) async {
    var status = source == ImageSource.gallery
        ? await Permission.photos.status
        : await Permission.camera.status;

    if (status.isDenied) {
      _showPermissionDialog(
        context,
        source == ImageSource.gallery ? 'Gallery' : 'Camera',
      );
    }
  }

  static void _showPermissionDialog(BuildContext context, String source) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text("Permission Denied"),
        content: Text("Please allow access to the $source in settings."),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
