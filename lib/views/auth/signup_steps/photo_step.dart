import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanysaiyq/app/config/theme.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_button.dart';
import 'package:tanysaiyq/customWidgets/custom_dialogs.dart';
import 'package:tanysaiyq/generated/l10n.dart';
import 'package:tanysaiyq/views/profile/photo_grid.dart';
import 'package:tanysaiyq/utils/image_util.dart';

class AddPhotoStep extends StatefulWidget {
  final VoidCallback onNext;
  const AddPhotoStep({super.key, required this.onNext});

  @override
  State<AddPhotoStep> createState() => _AddPhotoStepState();
}

class _AddPhotoStepState extends State<AddPhotoStep> {
  List<String> userProfileImages = [];

  Future<void> _pickAndCropImage(
      BuildContext context, ImageSource source) async {
    String? imagePath = await ImageUtil.pickAndCropImage(
      context: context,
      source: source,
    );

    if (imagePath != null) {
      setState(() {
        userProfileImages.add(imagePath);
      });
    }
  }

  void _showImageSourceDialog(BuildContext context) {
    showCustomBottomSheet(
      context: context,
      title: S.of(context).addPhotoSelectPhotoTitle,
      isContentFlexible: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(S.of(context).addPhotoGalleryOption,
                style: Theme.of(context).textTheme.bodyMedium),
            onTap: () => () => _pickAndCropImage(context, ImageSource.gallery),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(S.of(context).addPhotoCameraOption,
                style: Theme.of(context).textTheme.bodyMedium),
            onTap: () => _pickAndCropImage(context, ImageSource.camera),
          ),
        ],
      ),
    );
  }

  void _removePhoto(int index) {
    setState(() {
      userProfileImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.globalHorizontal,
            vertical: AppStyles.globalVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildSubheader(context),
            const SizedBox(height: 16),
            ProfileImageGrid(
              userProfileImages: userProfileImages,
              onAddPhoto: () => _showImageSourceDialog(context),
              onRemovePhoto: _removePhoto,
            ),
            const Spacer(),
            CustomButton(
                text: S.of(context).continuee, onPressed: widget.onNext),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      S.of(context).addPhotoHeader,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _buildSubheader(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Text(
      S.of(context).addPhotoSubheader,
      style: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(color: isDarkTheme ? null : Colors.grey),
    );
  }
}
