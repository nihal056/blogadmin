import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../profile/editprofile.dart';


class Profileshow extends StatefulWidget {
  const Profileshow({Key? key, required this.username, required this.email, required this.about, required this.createdTime, required this.id, required this.image}) : super(key: key);

  final String username;
  // final String name;
  final String email;
  final String about;
  final String id;
  final String image;
  
  
  final Timestamp createdTime;



  @override
  State<Profileshow> createState() => _ProfileshowState();
}

class _ProfileshowState extends State<Profileshow> {
  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMicrosecondsSinceEpoch((widget.createdTime).microsecondsSinceEpoch);

    return Scaffold(
        appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
    onPressed: () {Navigator.pop(context);}
    ),
        ),
      body: SingleChildScrollView(
        child: Column(


          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover)
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right:20 ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("username"),
                      Text(widget.username),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("email"),
                      Text(widget.email),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("about"),
                      Text(widget.about),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ), Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("user id"),
                      Text(widget.id),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Created time"),
                      Text((date).toString()),
                    ],
                  )
                ],
              ),
            ),
        SizedBox(
          height: 60,
        ),

    InkWell(
        onTap: (){
        showDialog(context: context,
            builder: (buildContext){
              return AlertDialog(
                title: Text('Delete'),
                content: Text('Do you want to delete the user?'),
                actions: [
                  TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel')),
                  TextButton(onPressed: (){
                    FirebaseFirestore.instance.collection('users').doc(widget.id).delete();
                    Navigator.pop(context);
                  }, child: Text('ok')),
                ],
              );
            });
      },
      child: Container(
        height: 30,
        width: 70,
        color: Colors.black,
        child:
        Center(child: Text("Delete",style: TextStyle(color: Colors.red),),),
      )
    )
,


          ],
        ),
      ),




    );
  }
}
