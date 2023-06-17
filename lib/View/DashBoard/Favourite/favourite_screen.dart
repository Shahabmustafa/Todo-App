import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/View/DashBoard/Favourite/add_favourite.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final db = FirebaseFirestore.instance.collection('favourite').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: db,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context,index){
                  return Container(
                    height: 70,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage('${snapshot.data?.docs[index]['photoURL']}'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${snapshot.data?.docs[index]['Name']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.favorite_outline_outlined),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFavourite()));
        },
          label: Text('Add Favourite'),
      ),
    );
  }
}
