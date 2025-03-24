import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';

class ProfileImageGrid extends StatelessWidget {
  final List<String> userProfileImages;
  final VoidCallback onAddPhoto;
  final void Function(int index) onRemovePhoto;

  const ProfileImageGrid({
    super.key,
    required this.userProfileImages,
    required this.onAddPhoto,
    required this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        if (index < userProfileImages.length) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.file(
                      File(userProfileImages[index]),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    onRemovePhoto(index);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return GestureDetector(
            onTap: onAddPhoto,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDarkTheme ? Colors.white : Colors.transparent,
                    width: 1.0,
                  ),
                  color: isDarkTheme
                      ? Colors.black54
                      : CupertinoColors.systemGrey5),
              child: Center(
                child: Icon(
                  Icons.add_a_photo_rounded,
                  color: isDarkTheme ? Colors.white : Colors.grey,
                  size: 40,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
