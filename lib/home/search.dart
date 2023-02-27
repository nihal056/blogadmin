import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  static List<MovieModel> main_movie_list = [
    MovieModel("ramees ",2023,9.0,
        "https://images.hindustantimes.com/img/2023/01/25/1600x900/pathaan_movie_review_1674631292696_1674631292838_1674631292838.jpeg"),
    MovieModel("nihal ",2021,8.1,
        "https://assets.thehansindia.com/h-upload/2020/12/26/1020887-master.webp"),
    MovieModel("mashook reloaded ",2018,8.5,
        "https://i.ytimg.com/vi/_qOl_7qfPOM/maxresdefault.jpg"),
    MovieModel("gaseer",2017,7.0,
        "https://images.jdmagicbox.com/comp/jd_social/news/2018aug11/image-314263-qx6l41i8ev.jpg"),
  ];

  List<MovieModel> display_list = List.from(main_movie_list);

  void updateList(String value){
    //this is the function
    //write our search function
    setState(() {
      display_list = main_movie_list
          .where((element) =>
          element. user_name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("search for a blog",
                  style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight:
                  FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) => updateList(value),
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),

                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.purple.shade50
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(

                  child: ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context,index)=>
                        ListTile(
                          contentPadding:
                          EdgeInsets.all(8.0),
                          title:
                          Text( display_list[index]. user_name!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),),
                          subtitle: Text
                            ('${display_list[index].movie_releae_year!}',
                            style: TextStyle(
                                color: Colors.white60),),
                          trailing: Text("${display_list[index].likes}",
                            style: TextStyle(color: Colors.amber),),
                          leading: Image.network(display_list[index].movie_poster_url!),
                        ),
                  ),
                )
              ]
          )
      ),
    );
  }
}


class MovieModel{
  String? user_name;
  int? movie_releae_year;
  String? movie_poster_url;
  double? likes;

  MovieModel(this. user_name,this.movie_releae_year,this.likes,this.movie_poster_url){

  }
}