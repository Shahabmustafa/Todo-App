

import 'package:flutter/cupertino.dart';

class FavouriteController extends ChangeNotifier{

  final List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  AddItem(int value){
    selectedItem.add(value);
    notifyListeners();
  }
  RemoveItem(int value){
    selectedItem.remove(value);
    notifyListeners();
  }
}