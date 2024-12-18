import 'dart:convert';

import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/dataModel/petCardData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends ChangeNotifier{
  List<PetCard> _petCardFavourites = [];
  List<PetCard> get petCardFavourite => _petCardFavourites; // for temporary display on homepage, can be removed

  List<PetDetailDataModel> _petFavourite = [];
  List<PetDetailDataModel> get petFavourite => _petFavourite;

  //filter favorite pet based on category
  
  List<PetDetailDataModel> getFilteredFavourites (String category){
    if(category == 'All'){
      return _petFavourite;
    }else{
      return _petFavourite.where((pet) => pet.petType == category).toList();
    }
  }

  void addFavorite(PetDetailDataModel pet) async {
    _petFavourite.add(pet);
    saveFavourite();
    notifyListeners();
  }

  void removeFavorite(PetDetailDataModel pet) async {
    _petFavourite.remove(pet);
    saveFavourite();
    notifyListeners();
    
  }

  Future<void> saveFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      _petFavourite.map((pet) => pet.toJson()).toList(),
    );
    await prefs.setString('petFavorites', encoded);

  }


 //for temporary display only
  void togglePetFavourite(PetCard petto){
    if(_petCardFavourites.contains(petto)){
      _petCardFavourites.remove(petto);
    }else{
      _petCardFavourites.add(petto);
    }
    
    notifyListeners();
  }

  bool isPetFavourite(PetCard petto){
    return _petCardFavourites.contains(petto);
  }


  //main here
  void toggleAllPetFavourite(PetDetailDataModel pet){
    if(_petFavourite.contains(pet)){
      _petFavourite.remove(pet);
    }else{
      _petFavourite.add(pet);
    }
    saveFavourite();
    notifyListeners();
  }

  bool isPetAdoptionFavourite(PetDetailDataModel pet){
    saveFavourite();
    return _petFavourite.contains(pet);
  }


  static FavouriteController of(BuildContext context, {bool listen = false}){
    return Provider.of<FavouriteController>(context, listen: false);
  }

}