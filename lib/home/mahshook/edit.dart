
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../main.dart';

class editprofile extends StatefulWidget {
  const editprofile({Key? key, required this.username, required this.about, required this.image})
      : super(key: key);

  @override
  State<editprofile> createState() => _editprofileState();
  final String username;
  final String about;
  final String image;
}

class _editprofileState extends State<editprofile> {
  String imageUrl='';
  int count=0;
  File? _images;
  final storage=FirebaseStorage.instance;


  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future getImage(ImageSource source) async {

    final image = await ImagePicker().pickImage(source: source);
    _images=File(image!.path);

    DocumentSnapshot id = await FirebaseFirestore
        .instance
        .collection('settings')
        .doc("settings")
        .get();
    id.reference.update(
        {"userImage": FieldValue.increment(1)});
    var imageId = id['userImage'];

    // Upload to firebase

    var storageReference = await storage.ref().child("Profile/$imageId").putFile(_images!);
    var downloadUrl = await storageReference.ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
      FirebaseFirestore.instance.collection('users').doc(CurrentUserID).update(
          {
            'profile':downloadUrl
          });
    });
    if(mounted){
      setState(() {
        _images=File(image.path);
      });
    }
  }

//SaveFilePermanently

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename('asset');
    final image = File("${directory.path}/$name");

    return File(imagePath).copy(image.path);
  }

  // Category Section

  List<dynamic> category=[];

  String? categoryId;
  String? categoryData="";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    _usernameController.text = widget.username;
    _bioController.text = widget.about;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _images != null
                      ? CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(_images!),
                  )
                      : CircleAvatar(
                    radius: 80,
                    backgroundImage:
                    NetworkImage(widget.image),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (buildContext) {
                      return AlertDialog(
                        // backgroundColor: Colors.transparent,
                        content: Container(
                          // color: Colors.transparent,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.photo_album),
                                onPressed: () {
                                  getImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.camera),
                                onPressed: () {
                                  getImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                "Edit your profile photo",
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // Text("Edit your profile photo",style: TextStyle(color: Colors.blue),),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  TextField(
                    controller: _bioController,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      labelText: 'About',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RoundedLoadingButton(
                      controller: RoundedLoadingButtonController(),
                      onPressed: () {
                        Navigator.pop(context);
                        print(CurrentUserID);
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(CurrentUserID)
                            .update({
                          'username': _usernameController.text,
                          'about': _bioController.text,
                        });

                        setState(() {
                          CurrentUserName = _usernameController.text;
                        });

                        RoundedLoadingButtonController().reset();
                      },
                      child: Text('Save'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required IconData icon,
  required VoidCallback onclick,
}) {
  return Container(
    width: 100,
    child: ElevatedButton(
      onPressed: onclick,
      child: Column(
        children: [
          Icon(
            icon,
            size: 80,
          ),
        ],
      ),
    ),
  );
}