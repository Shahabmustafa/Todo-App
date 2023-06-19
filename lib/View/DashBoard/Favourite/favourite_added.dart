import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'favourite_controller.dart';


class FavouriteAdded extends StatefulWidget {
  const FavouriteAdded({Key? key}) : super(key: key);

  @override
  State<FavouriteAdded> createState() => _FavouriteAddedState();
}

class _FavouriteAddedState extends State<FavouriteAdded> {
  final addFav = FirebaseFirestore.instance.collection('addFavourite').snapshots();
  final del = FirebaseFirestore.instance.collection('addFavourite');


  @override
  Widget build(BuildContext context) {
    final favouriteAdded = Provider.of<FavouriteController>(context);
    return Scaffold(
      body: StreamBuilder(
        stream: addFav,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Text('Null');
          }
          else if(snapshot.connectionState == ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }else{
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
                                  child: Image.network(
                                      '${data?['Image']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${data?['Name']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                    InkWell(
                                      onTap: (){
                                        if(value.selectedItem.contains(index)){
                                          value.RemoveItem(index);
                                          del.doc("${index}").delete();
                                        }else{
                                        }
                                      },
                                      child: Icon(
                                        data!['bool'] == true ?
                                        Icons.favorite :
                                        Icons.favorite_outline_outlined,
                                        color: data['bool'] == true ?
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
        },
      ),
    );
  }
}
