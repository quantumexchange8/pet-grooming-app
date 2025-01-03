import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:get/get.dart';

class PetPhotoSlider extends GetxController{
  static PetPhotoSlider get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final totalPhotos = 0.obs; //make it dynamic

  void setTotalPhotos(PetDetailDataModel petDetail){
    totalPhotos.value = petDetail.getTotalPhotoCount(); //need to link to the data model
  }

  void updatePhotoIndicator(index){
    carouselCurrentIndex.value = index;
  }
}