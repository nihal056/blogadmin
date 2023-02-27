
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';



class detailedpost extends StatefulWidget {
  detailedpost(this.postTitle, this.PostDesctription, this.PostImage, this.likes, this.postid);
  final String postTitle;
  final String PostDesctription;
  final String PostImage;
  final List likes;
  final String postid;


  @override
  State<detailedpost> createState() => _detailedpostState();
}
bool liked = false;

var likeColor = Colors.grey;

class _detailedpostState extends State<detailedpost> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').where('id',isEqualTo: widget.postid).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text('');
          }
          var data = snapshot.data?.docs;
          List likes = data?[0]['likes'];

          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Hero(
                            tag: "blogImage",
                            child: Image.network(
                              widget.PostImage,
                              height: 300.0,
                              width: size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 64.0,
                              bottom: 0.0,
                              left: 0.0,
                              right: 24.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(48.0)),
                                    child: Icon(Icons.arrow_back,
                                        size: 20, color: likeColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: size.width / 2,
                                  child: Text(
                                    widget.postTitle,
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),

                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Colors.white.withOpacity(0.08),
                              height: 32.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Hero(
                                  tag: "BlogUserProfile",
                                  child: Icon(Icons.account_circle,
                                      size: 20, color: likeColor),
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Expanded(
                                  child: Text(
                                    "Muhammed Nihal",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Mulish-SemiBold.ttf",
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: Colors.white.withOpacity(0.08),
                              height: 32.0,
                            ),
                            SizedBox(
                              height: 220,
                              child: Text(
                                widget.PostDesctription,
                                style: TextStyle(fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red)
                      ),


                    onPressed: (){
                      showDialog(context: context,
                          builder: (buildContext){
                            return AlertDialog(
                              title: Text('Delete'),
                              content: Text('Do you want to delete post?'),
                              actions: [
                                TextButton(onPressed: ()=>Navigator.pop(context), child: Text('Cancel')),
                                TextButton(onPressed: (){
                                  FirebaseFirestore.instance.collection('posts').doc(widget.postid).delete();
                                  Navigator.pop(context);
                                }, child: Text('ok')),
                              ],
                            );
                          });
                    },
                    child: Text("Delete"),

                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}