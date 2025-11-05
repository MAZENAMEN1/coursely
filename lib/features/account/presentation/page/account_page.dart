import 'dart:io';

import 'package:coursely/core/constants/app_images.dart';
import 'package:coursely/core/utils/app_colors.dart';
import 'package:coursely/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/list_for_account.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? imagePicker;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyles.textStyle24.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(10),
              CircleAvatar(
                radius: 60,
                backgroundImage: image != null
                    ? FileImage(image!)
                    : AssetImage(AppImages.avatarImage),

                backgroundColor: AppColors.gryColor,
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () async {
                        imagePicker = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (imagePicker != null) {
                          await File(
                            imagePicker?.path ?? "",
                          ).readAsBytes();
                  
                          setState(() {
                            image = File(imagePicker?.path ?? "");
                          });
                        }
                      },
                      icon: Icon(Icons.camera_alt, size: 15,),
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ),
              ),

              Gap(20),
              ListForAccount(text: "Favourite", onTap: () {}),
              Gap(10),
              ListForAccount(text: "Edit Account", onTap: () {}),
              Gap(10),
              ListForAccount(text: "Settings and Privacy", onTap: () {}),
              Gap(10),
              ListForAccount(text: "Help", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
