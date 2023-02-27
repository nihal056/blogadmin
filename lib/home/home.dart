// import 'package:blogapp1/home/profile.dart';
// import 'package:flutter/material.dart';
//
// import 'home1.dart';
//
// class adhome extends StatefulWidget {
//   const adhome({Key? key}) : super(key: key);
//
//   @override
//   State<adhome> createState() => _adhomeState();
// }
//
// class _adhomeState extends State<adhome> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   static List<Widget> _widgetOptions = <Widget>[home1(), Profile()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: Text('B BLOG'),
//         centerTitle: true,
//         actions: [
//           TextButton(
//               onPressed: () {
//                 showDialog(context: context,
//                     builder: (buildContext){
//                       return AlertDialog(
//                         title: Text('Logout'),
//                         content: Text('Do you want to Logout?'),
//                         actions: [
//                           TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel')),
//                           TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>adhome())), child: Text('ok')),
//                         ],
//                       );
//                     });
//               },
//               child: Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.white),
//               )),
//
//         ],
//       ),
//       drawer: new Drawer(
//         child: ListView(
//            children: [
//              UserAccountsDrawerHeader(accountName: new Text("MOHAMMED NIHAL",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//                  accountEmail: new Text("nihal@gmail.com"),
//              currentAccountPicture: CircleAvatar(
//                backgroundImage: AssetImage("assets/images/d.jpg"),
//              ),
//              decoration: BoxDecoration(color: Colors.black87),),
//
//
//              ListTile(
//                leading: Icon(Icons.person),
//              )
//            ],
//         ),
//       ),
//       body: _widgetOptions.elementAt(_selectedIndex),
//
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blueGrey.withOpacity(0.9),
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//           ],
//           // type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           iconSize: 40,
//           onTap: _onItemTapped,
//           elevation: 5),
//
//     );
//   }
// }
