import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final File? image;
  final VoidCallback onImagePick;

  ProfileImage({required this.image, required this.onImagePick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImagePick,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: image != null
            ? FileImage(image!) // Ensure it's using FileImage when updated
            : const NetworkImage('https://picsum.photos/250?image=9') as ImageProvider,
        child: image == null ? const Icon(Icons.camera_alt, size: 50, color: Colors.white) : null,
      ),
    );
  }
}
