import 'package:blogapp1/users/profileshow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  @override
  State<users> createState() => _usersState();
}
setSearchParam(String caseNumber) {
  List<String> caseSearchList = <String>[];
  String temp = "";

  List<String> nameSplits = caseNumber.split(" ");
  for (int i = 0; i < nameSplits.length; i++) {
    String name = "";

    for (int k = i; k < nameSplits.length; k++) {
      name = name + nameSplits[k] + " ";
    }
    temp = "";

    for (int j = 0; j < name.length; j++) {
      temp = temp + name[j];
      caseSearchList.add(temp.toUpperCase());
    }
  }
  return caseSearchList;
}
class _usersState extends State<users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back),
      onPressed: () {Navigator.pop(context);}
      ),
        title: const Text('Users',style: (TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),),
        centerTitle: true,

      ),
      body:


      Column(
        children: [

          TextField(

            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                fillColor: Colors.transparent,
                filled: true,
                icon: Icon(Icons.search),


                hintText: 'Search the user',hintStyle: (const TextStyle(color: Colors.grey)),
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(10)
                )

            ),

          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                var data =snapshot.data!.docs;
                return ListView.builder(
                  // shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {

                      String name=data[index]['username'];
                      String email=data[index]['email'];
                      // var date =data[index]['created_date'];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                              Profileshow(id: data[index]['id'],
                                username:data[index]['username'] ,
                              about: data[index]['about'], email: data[index]['email'], createdTime: data[index]['createdTime'], image: data[index]['profile'],
                              
                              )
                          ));
                        },
                        child: ListTile(
                            leading:Container(
                              height:40 ,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: NetworkImage(data[index]['profile']),fit: BoxFit.cover)
                              ),
                            ),
                             title: Text(name),
                          subtitle: Text(email),
                          trailing: Icon(Icons.chevron_right),



                            ),
                      );


                    });
              }
            ),
          ),
        ],
      ),

    );
  }
}
