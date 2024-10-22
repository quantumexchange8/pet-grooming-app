import 'package:adoptify/dataModel/petCardData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteController extends ChangeNotifier{
  List<PetCard> _petCardFavourites = [];
  List<PetCard> get petCardFavourite => _petCardFavourites;

  void togglePetFavourite(PetCard pet){
    if(_petCardFavourites.contains(pet)){
      _petCardFavourites.remove(pet);
    }else{
      _petCardFavourites.add(pet);
    }
    notifyListeners();
  }

  bool isPetFavourite(PetCard pet){
    return _petCardFavourites.contains(pet);
  }

  static FavouriteController of(BuildContext context, {bool listen = false}){
    return Provider.of<FavouriteController>(context, listen: false);
  }

}