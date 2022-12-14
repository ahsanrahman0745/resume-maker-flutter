// import 'dart:html' as File;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import '../constants/style.dart';
import 'package:get/get.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  ResumeController resumeController=Get.find();

  File? image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() async {
        image = File(pickedImage.path);
        // final bytes = Io.File(imageBytes.path).readAsBytesSync();

        // String img64 = base64Encode(bytes);
        var bytes = await image?.readAsBytes();
        var base64img = base64Encode(bytes!);
        print("image=> ${image?.readAsBytes().toString()}");
        print("image=> ${base64img }");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              print("object1");
              await resumeController.imagePicker2();
              print("object end");
            },
            child: GetBuilder<ResumeController>(
              init: ResumeController(), // intialize with the Controller
              builder: (_){
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.8),
                        offset: Offset(-6.0, -6.0),
                        blurRadius: 16.0,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(6.0, 6.0),
                        blurRadius: 16.0,
                      ),
                    ],
                    color: lightColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 150,
                  height: 150,
                  child: resumeController.image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.memory(resumeController.uint8list, fit: BoxFit.cover,),
                    // child: Image.file(
                    //   resumeController.image!,
                    //   fit: BoxFit.cover,
                    // ),
                  )
                      : Icon(
                    color: secondary,
                    Icons.camera_alt,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
