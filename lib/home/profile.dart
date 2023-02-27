// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../profile/editprofile.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Center(
//               child: Container(
//                 height: 200,
//                 width: 200,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/d.jpg'),
//                         fit: BoxFit.cover)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               "MOHAMMED NIHAL",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Text("niha54+64121l@gmail.com"),
//           MaterialButton(
//             color: Colors.transparent,
//             child: const Text(" Edit Profile ",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 10)),
//             onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => editprofile())),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             height: 40,
//             width: 350,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("  username:"),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 40,
//             width: 350,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("  Name:"),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 40,
//             width: 350,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("  Email:"),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
