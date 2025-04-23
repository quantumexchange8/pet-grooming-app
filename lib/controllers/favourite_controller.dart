import 'dart:convert';

import 'package:adoptify/dataModel/animal_detail_data_model.dart';
import 'package:adoptify/dataModel/pet_card_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends ChangeNotifier{
  List<PetCard> petCardFavourites = [];
  List<PetCard> get petCardFavourite => petCardFavourites; // for temporary display on homepage, can be removed

  List<PetDetailDataModel> petFavourites = [];
  List<PetDetailDataModel> get petFavourite => petFavourites;

  //filter favorite pet based on category
  
  List<PetDetailDataModel> getFilteredFavourites (String category){
    if(category == 'All'){
      return petFavourites;
    }else{
      return petFavourites.where((pet) => pet.petType == category).toList();
    }
  }

  void addFavorite(PetDetailDataModel pet) async {
    petFavourites.add(pet);
    saveFavourite();
    notifyListeners();
  }

  void removeFavorite(PetDetailDataModel pet) async {
    petFavourites.remove(pet);
    saveFavourite();
    notifyListeners();
    
  }

  Future<void> saveFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      petFavourites.map((pet) => pet.toJson()).toList(),
    );
    await prefs.setString('petFavorites', encoded);

  }


 //for temporary display only
  void togglePetFavourite(PetCard petto){
    if(petCardFavourites.contains(petto)){
      petCardFavourites.remove(petto);
    }else{
      petCardFavourites.add(petto);
    }
    
    notifyListeners();
  }

  bool isPetFavourite(PetCard petto){
    return petCardFavourites.contains(petto);
  }


  //main here
  void toggleAllPetFavourite(PetDetailDataModel pet){
    if(petFavourites.contains(pet)){
      petFavourites.remove(pet);
    }else{
      petFavourites.add(pet);
    }
    saveFavourite();
    notifyListeners();
  }

  bool isPetAdoptionFavourite(PetDetailDataModel pet){
    saveFavourite();
    return petFavourites.contains(pet);
  }


  static FavouriteController of(BuildContext context, {bool listen = false}){
    return Provider.of<FavouriteController>(context, listen: false);
  }

}