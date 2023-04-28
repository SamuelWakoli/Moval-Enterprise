import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImg extends StatefulWidget {
  const EditProfileImg({Key? key}) : super(key: key);

  @override
  State<EditProfileImg> createState() => _EditProfileImgState();
}

class _EditProfileImgState extends State<EditProfileImg> {
  bool showSaveBtn = false, loading = false;
  String userprofileUrl =
      FirebaseAuth.instance.currentUser!.photoURL.toString();

  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();

  File? image;

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 28.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 200,
                width: 200,
                child: (image != null)
                    ? Image.file(
                        image!,
                        fit: BoxFit.fill,
                      )
                    : CachedNetworkImage(
                        imageUrl: userprofileUrl,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            const SizedBox(height: 28.0),
            const Text(
              "Get image from:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 14.0),
            OutlinedButton(
                onPressed: () {
                  pickImageCamera();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Camera",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 30),
            OutlinedButton(
                onPressed: () {
                  pickImageGallery();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            showSaveBtn
                ? OutlinedButton(
                    onPressed: () async {
                      if (image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select an image to be saved"),
                          ),
                        );
                      } else {
                        String photoURL = "";

                        setState(() {
                          loading = true;
                        });

                        await FirebaseStorage.instance
                            .ref("users/$userEmail")
                            .child("ProfilePhoto.png")
                            .putFile(image!)
                            .then((snapshot) async {
                          photoURL = await snapshot.ref.getDownloadURL();
                        }).whenComplete(() async {
                          if (photoURL != "") {
                            await FirebaseAuth.instance.currentUser!
                                .updatePhotoURL(photoURL)
                                .whenComplete(() {
                              setState(() {
                                loading = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Profile picture saved successfully"),
                                ),
                              );
                              Navigator.of(context).pop();
                            });
                          } else {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please ensure you have a well set internet connection and try again"),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: loading
                        ? Center(
                            child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ))
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22,
                                  ),
                                )
                              ],
                            ),
                          ))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
