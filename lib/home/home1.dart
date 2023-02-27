

import 'package:blogapp1/report/reports.dart';


import 'package:blogapp1/users/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../posts/IMGposts/mainpage/imgmenu.dart';


class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      title:Text("BLOG ADMIN"),
      backgroundColor: Colors.blueGrey,
      centerTitle: true,
    ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>users()));
                },

                child: Center(
                  child: Column(

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.supervised_user_circle_outlined,size: 150,),
                      Text("Users",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: (){
              FirebaseFirestore.instance.collection('test').add({'test':'test'});

              Navigator.push(context, MaterialPageRoute(builder: (context)=>report()));
            },

            child: Center(
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.report_gmailerrorred,size: 150,),
                  Text("report",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              FirebaseFirestore.instance.collection('test').add({'test':'test'});

              Navigator.push(context, MaterialPageRoute(builder: (context)=>PstMnu()));
            },

            child: Center(
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.article_outlined,size: 150,),
                  Text("posts",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),


        ],
      ),


    );
  }
}
