import 'package:adoptify/dataModel/animalDataModel.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/dataModel/birdDataModel.dart';
import 'package:adoptify/dataModel/catDataModel.dart';
import 'package:adoptify/dataModel/dogDataModel.dart';
import 'package:adoptify/dataModel/fishDataModel.dart';
import 'package:adoptify/dataModel/otherDataModel.dart';
import 'package:adoptify/dataModel/petCardData.dart';
import 'package:adoptify/dataModel/primatesDataModel.dart';
import 'package:adoptify/dataModel/rabbitDataModel.dart';
import 'package:adoptify/dataModel/reptilesDataModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteController extends ChangeNotifier{
  List<PetCard> _petCardFavourites = [];
  List<PetCard> get petCardFavourite => _petCardFavourites;

  List<BirdDataModel> _birdFavourite = [];
  List<BirdDataModel> get birdFavourite => _birdFavourite;

  List<DogDataModel> _dogFavourite = [];
  List<DogDataModel> get dogFavourite => _dogFavourite;

  List<CatDataModel> _catFavourite = [];
  List<CatDataModel> get catFavourite => _catFavourite;

  List<RabbitDataModel> _rabbitFavourite = [];
  List<RabbitDataModel> get rabbitFavourite => _rabbitFavourite;

  List<FishDataModel> _fishFavourite = [];
  List<FishDataModel> get fishFavourite => _fishFavourite;

  List<ReptileDataModel> _reptileFavourite = [];
  List<ReptileDataModel> get reptileFavourite => _reptileFavourite;

  List<PrimateDataModel> _primateFavourite = [];
  List<PrimateDataModel> get primateFavourite => _primateFavourite;

  List<OtherDataModel> _otherFavourite = [];
  List<OtherDataModel> get otherFavourite => _otherFavourite;

  List<AnimalDataModel> _animalFavourite = [];
  List<AnimalDataModel> get animalFavourite => _animalFavourite;

  List<PetDetailDataModel> _petFavourite = [];
  List<PetDetailDataModel> get petFavourite => _petFavourite;
 
  void togglePetFavourite(PetCard pet){
    if(_petCardFavourites.contains(pet)){
      _petCardFavourites.remove(pet);
    }else{
      _petCardFavourites.add(pet);
    }
    notifyListeners();
  }

  void toggleBirdFavourite(BirdDataModel bird){
    if(_birdFavourite.contains(bird)){
      _birdFavourite.remove(bird);
    }else{
      _birdFavourite.add(bird);
    }
    notifyListeners();
  }

  void toggleDogFavourite(DogDataModel dog){
    if(_dogFavourite.contains(dog)){
      _dogFavourite.remove(dog);
    }else{
      _dogFavourite.add(dog);
    }
    notifyListeners();
  }

  void toggleCatFavourite(CatDataModel cat){
    if(_catFavourite.contains(cat)){
      _catFavourite.remove(cat);
    }else{
      _catFavourite.add(cat);
    }
    notifyListeners();
  }

  void toggleRabbitFavourite(RabbitDataModel rabbit){
    if(_rabbitFavourite.contains(rabbit)){
      _rabbitFavourite.remove(rabbit);
    }else{
      _rabbitFavourite.add(rabbit);
    }
    notifyListeners();
  }

  void toggleReptileFavourite(ReptileDataModel reptile){
    if(_reptileFavourite.contains(reptile)){
      _reptileFavourite.remove(reptile);
    }else{
      _reptileFavourite.add(reptile);
    }
    notifyListeners();
  }

  void toggleFishFavourite(FishDataModel fish){
    if(_fishFavourite.contains(fish)){
      _fishFavourite.remove(fish);
    }else{
      _fishFavourite.add(fish);
    }
    notifyListeners();
  }

  void togglePrimateFavourite(PrimateDataModel primate){
    if(_primateFavourite.contains(primate)){
      _primateFavourite.remove(primate);
    }else{
      _primateFavourite.add(primate);
    }
    notifyListeners();
  }

  void toggleOtherFavourite(OtherDataModel other){
    if(_otherFavourite.contains(other)){
      _otherFavourite.remove(other);
    }else{
      _otherFavourite.add(other);
    }
    notifyListeners();
  }

  void toggleAllAnimalFavourite(AnimalDataModel animal){
    if(_animalFavourite.contains(animal)){
      _animalFavourite.remove(animal);
    }else{
      _animalFavourite.add(animal);
    }
    notifyListeners();
  }

  void toggleAllPetFavourite(PetDetailDataModel pet){
    if(_petFavourite.contains(pet)){
      _petFavourite.remove(pet);
    }else{
      _petFavourite.add(pet);
    }
    notifyListeners();
  }

  bool isPetFavourite(PetCard pet){
    return _petCardFavourites.contains(pet);
  }
  bool isBirdFavourite(BirdDataModel bird){
    return _birdFavourite.contains(bird);
  }
  bool isDogFavourite(DogDataModel dog){
    return _dogFavourite.contains(dog);
  }
  bool isCatFavourite(CatDataModel cat){
    return _catFavourite.contains(cat);
  }
  bool isRabbitFavourite(RabbitDataModel rabbit){
    return _rabbitFavourite.contains(rabbit);
  }
  bool isReptileFavourite(ReptileDataModel reptile){
    return _reptileFavourite.contains(reptile);
  }
  bool isFishFavourite(FishDataModel fish){
    return _fishFavourite.contains(fish);
  }
  bool isPrimateFavourite(PrimateDataModel primate){
    return _primateFavourite.contains(primate);
  }
  bool isOtherFavourite(OtherDataModel other){
    return _otherFavourite.contains(other);
  }
  bool isAnimalFavourite(AnimalDataModel animal){
    return _animalFavourite.contains(animal);
  }

  bool isPetAdoptionFavourite(PetDetailDataModel pet){
    return _petFavourite.contains(pet);
  }


  static FavouriteController of(BuildContext context, {bool listen = false}){
    return Provider.of<FavouriteController>(context, listen: false);
  }

}