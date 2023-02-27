// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:path/path.dart';
// import '../home/home.dart';
//
// class editprofile extends StatefulWidget {
//   const editprofile({Key? key}) : super(key: key);
//
//   @override
//   State<editprofile> createState() => _editprofileState();
// }
//
// class _editprofileState extends State<editprofile> {
//   File? _image;
//
//   Future getImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//
//       final imagePermanant = await saveFilePermanently(image.path);
//       setState(() {
//         this._image = imagePermanant;
//       });
//     } on PlatformException catch (e) {
//       print("Failed to pick image: $e");
//     }
//   }
//
//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename('asset');
//     final image = File("${directory.path}/$name");
//
//     return File(imagePath).copy(image.path);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 showDialog(
//                     context: context,
//                     builder: (buildContext) {
//                       return AlertDialog(
//                         title: Text('Save'),
//                         content: Text('Do you want to Save?'),
//                         actions: [
//                           TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: Text('Cancel')),
//                           TextButton(
//                               onPressed: () => Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => adhome())),
//                               child: Text('ok')),
//                         ],
//                       );
//                     });
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(color: Colors.white),
//               )),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _image != null
//                       ? CircleAvatar(
//                           radius: 100,
//                           backgroundImage: FileImage(_image!),
//                         )
//                       : CircleAvatar(
//                           radius: 80,
//                           backgroundImage: AssetImage("assets/images/ab.jpg"),
//                         ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             InkWell(
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (buildContext) {
//                       return AlertDialog(
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               children: [
//                                 CustomButton(
//                                   icon: Icons.image_outlined,
//                                   onclick: () {
//                                     getImage(ImageSource.gallery);
//                                     Navigator.pop(context);
//                                   },
//
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 CustomButton(
//                                   icon: Icons.camera_alt_outlined,
//                                   onclick: () {
//                                     getImage(ImageSource.camera);
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 10),
//                height: 40,
//                 width: 160,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//                     Text("edit your profile photo"),
//                   ],
//                 ),
//
//               ),
//
//             ),
//
//
//             SizedBox(
//               height: 40,
//             ),
//
//             Container(
//               padding: const EdgeInsets.only(left: 20),
//               child: Column(
//                 children: [
//                   TextField(
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.transparent,
//                       filled: true,
//                       labelText: 'username',
//                       labelStyle: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   TextField(
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.transparent,
//                       filled: true,
//                       labelText: 'Name',
//                       labelStyle: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   TextField(
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.transparent,
//                       filled: true,
//                       labelText: 'Email',
//                       labelStyle: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   TextField(
//                     obscureText: true,
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       fillColor: Colors.transparent,
//                       filled: true,
//                       labelText: 'Password',
//                       labelStyle: const TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget CustomButton({
//   required IconData icon,
//   required VoidCallback onclick,
// }) {
//   return Container(
//     width: 100,
//     child: ElevatedButton(
//       onPressed: onclick,
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             size: 80,
//           ),
//         ],
//       ),
//     ),
//   );
// }
