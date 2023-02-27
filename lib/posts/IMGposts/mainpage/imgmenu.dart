
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sub/imgALL.dart';
import 'sub/imgEDU.dart';
import 'sub/imgEXM.dart';
import 'sub/imgHLTH.dart';
import 'sub/imgSPORT.dart';
import 'sub/imgUNI.dart';
class PstMnu extends StatefulWidget {
  const PstMnu({Key? key}) : super(key: key);

  @override
  State<PstMnu> createState() => _PstMnuState();
}

class _PstMnuState extends State<PstMnu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
    onPressed: () {Navigator.pop(context);}
    ),
          backgroundColor: Colors.blueGrey,
        ),
      backgroundColor: Colors.grey,
      body: Container(

        padding: EdgeInsets.all(20.0),
        child: GridView.count(crossAxisCount: 2,
          children: [
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgALL()));
                },

                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.format_align_left_sharp,size: 100,),
                      Text("All",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgUni()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.house,size: 100,),
                      Text("University",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgEdu()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school,size: 100,),
                      Text("Education",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgSport()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sports_handball_outlined,size: 100,),
                      Text("Sports",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgExm()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.article_outlined,size: 100,),
                      Text("Exam",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(2.0),
              child: InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ImgHlth()));
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.health_and_safety_outlined,size: 100,),
                      Text("Health",style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            )
          ],),

      ),


    );
  }
}
