import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/View/DashBoard/Favourite/add_favourite.dart';
import 'package:todo_app/View/DashBoard/Favourite/favourite_controller.dart';

import 'favourite_added.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final db = FirebaseFirestore.instance.collection('favourite').snapshots();
  final addFav = FirebaseFirestore.instance.collection('addFavourite');
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddFavourite()));
            },
            child: Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder(
        stream: db,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Consumer<FavouriteController>(
                builder: (context,value,child){
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                        var data = snapshot.data?.docs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: ClipRRect(
                                  child: data!['photoURL']?.toString() == "" ? Image.asset('images/download.png') : Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data['photoURL']),
                                    loadingBuilder: (context,child,loadingProgress){
                                      if(loadingProgress == null) return child;
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${data['Name']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                    InkWell(
                                      onTap: (){
                                        addFav.doc('${index.toInt()}').set({
                                          'bool' : true,
                                          'Image' : data['photoURL'],
                                          'Name' : data['Name'],
                                        });
                                        if(value.selectedItem.contains(index)){
                                          value.RemoveItem(index);
                                        }else{
                                          value.AddItem(index);
                                        }
                                      },
                                      child: Icon(
                                        value.selectedItem.contains(index) ?
                                        Icons.favorite :
                                        Icons.favorite_outline_outlined,
                                        color: value.selectedItem.contains(index) ?
                                        Colors.red :
                                        Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                  );
                }
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else{
            return Center(child: Text('Loading....'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteAdded()));
        },
          label: Text('Add Favourite'),
      ),
    );
  }
}
