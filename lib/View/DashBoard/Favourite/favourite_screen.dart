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
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context,index){
          return Consumer<FavouriteController>(
              builder: (context,provider,child){
                return ListTile(
                  title: Text('Item ${index}'),
                  trailing: InkWell(
                    onTap: (){
                      if(provider.selectedItem.contains(index)){
                        provider.RemoveItem(index);
                      }else{
                        provider.AddItem(index);
                      }
                    },
                    child: Icon(
                      provider.selectedItem.contains(index) ?
                      Icons.favorite :
                      Icons.favorite_outline_outlined,
                      color: provider.selectedItem.contains(index) ? Colors.red : Colors.black,
                    ),
                  ),
                );
              },
          );
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
