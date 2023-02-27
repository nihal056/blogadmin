import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.pop(context);}
      ),
        title: Text("Reports"),
        backgroundColor: Colors.black38,


      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').where('reported',isEqualTo: true).snapshots(),
          builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data?.docs;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context,index){
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all()
                ),

                child: Column(
                  children: [
                    Image.network(data?[index]['image'],height: 250,),
                    Text(data?[index]['title']),
                    Text(data?[index]['description']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){
                          FirebaseFirestore.instance.collection('posts').doc(data?[index]['id']).update(
                              {
                                'reported':false
                              });
                        }, child: Text('keep')),
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
                                       FirebaseFirestore.instance.collection('posts').doc(data?[index]['id']).delete();
                                        Navigator.pop(context);
                                        }, child: Text('ok')),
                                    ],
                                  );
                                });
                          },
                          child: Text("Delete"),

                        ),
                      ],
                    )
                  ],
                ),
              );


            });
          },
      ),
    );
  }
}
