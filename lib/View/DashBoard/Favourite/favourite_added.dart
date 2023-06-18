import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_controller.dart';


class FavouriteAdded extends StatefulWidget {
  const FavouriteAdded({Key? key}) : super(key: key);

  @override
  State<FavouriteAdded> createState() => _FavouriteAddedState();
}

class _FavouriteAddedState extends State<FavouriteAdded> {
  @override
  Widget build(BuildContext context) {
    final favouriteAdded = Provider.of<FavouriteController>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: favouriteAdded.selectedItem.length,
        itemBuilder: (context,index){
          return Consumer<FavouriteController>(
            builder: (context,provider,child){
              return ListTile(
                title: Text('Item ${provider.selectedItem[index]}'),
                trailing: InkWell(
                  onTap: (){
                   provider.RemoveItem(provider.selectedItem[index]);
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
    );
  }
}
