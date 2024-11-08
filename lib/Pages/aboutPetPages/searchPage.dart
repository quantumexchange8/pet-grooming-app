import 'package:adoptify/Pages/aboutPetPages/searchResultPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:iconly/iconly.dart';
import 'package:location/location.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedLocation = '';
  String selectedPetType = '';
  String selectedGender = '';
  String selectedSize = '';
  String selectedAge = '';

  @override
  void initState(){
    super.initState();
    _accessLocation();
  }

  Future<void> _accessLocation() async {
    Location location = /* new */ Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if(!serviceEnabled){
      serviceEnabled = await location.requestService();
        if(!serviceEnabled){
          return;
        }
    }
    permissionGranted = await location.hasPermission();
    if(permissionGranted == PermissionStatus.denied){
      permissionGranted = await location.requestPermission();
      if(permissionGranted != PermissionStatus.granted){
        return;
      }
    }
    locationData = await location.getLocation();

    //this is latitude and longitude
    setState(() { 
      selectedLocation = '${locationData.latitude},${locationData.longitude}';
    });

    //need to convert the latitude and longitude to the city and country name, need to use Google Maps Api
    //final String apiKey = 'Google Api Key';
    //final String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude}, ${locationData.longitude}&key=$apiKey'; // example
    //the api code below here

    //use other package (geocoding) to translate latitude and longitude
    try{
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!
      );
      geo.Placemark place = placemarks[0];

      setState(() {
        selectedLocation = '${place.locality}, ${place.country}';
      });
      
    }catch(e){
      _showMessage('Failed to get the location (city and country).');
    }
  }

  void _showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: bodySBold),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Pet Search', style: heading4Bold),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //location
                    Text('Location', style: heading5Bold),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(IconlyLight.location, size:20, color: Colors.black),
                          const SizedBox(width: 10),
                          Text(selectedLocation, style: bodyXLSemibold.copyWith(color: Colors.black)),
                        ],
                      ),
                    ),



                    const SizedBox(height: 20),
                    //pet types
                    Text('Pet Types', style: heading5Bold),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        selectedSearchPet('assets/buttonPic/dog.png','Dogs', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/cat.png','Cats', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/rabbit.png','Rabbits', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/bird.png','Birds', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/snake.png','Reptiles', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/fish.png','Fish', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/monkey.png','Primates', selectedPetType, (value) => selectedPetType = value),
                        selectedSearchPet('assets/buttonPic/other.png','Other', selectedPetType, (value) => selectedPetType = value),
                      ],
                    ),
                    const SizedBox(height: 20),
              
                    //gender(optional)
                    Row(
                      children: [
                        Text('Gender', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Any', selectedGender, (value) => selectedGender = value),
                        searchOptionalChoice('Male', selectedGender, (value) => selectedGender = value),
                        searchOptionalChoice('Female', selectedGender, (value) => selectedGender = value),
                      ],
                    ),
                    const SizedBox(height: 20),
              
              
                    //size(optional)
                    Row(
                      children: [
                        Text('Size', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Small', selectedSize, (value) => selectedSize = value),
                        searchOptionalChoice('Medium', selectedSize, (value) => selectedSize = value),
                        searchOptionalChoice('Large', selectedSize, (value) => selectedSize = value),
                      ],
                    ),
                    const SizedBox(height: 20),
              
              
                    //age(optional)
                     Row(
                      children: [
                        Text('Age', style: heading5Bold),
                        const SizedBox(width: 5),
                        Text('(Optional)', style: bodyLRegular.copyWith(color: grey.shade600)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12, children: [
                        searchOptionalChoice('Baby', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Young', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Adult', selectedAge, (value) => selectedAge = value),
                        searchOptionalChoice('Senior', selectedAge, (value) => selectedAge = value),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              //color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SearchResult(selectedPetType: selectedPetType)),
                        );
                      }, 
                      text: 'Search',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget selectedSearchPet (String url, String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(url, width: 15,height: 15),
          const SizedBox(width: 3),
          Text(label),
        ],
      ), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Colors.black),
      backgroundColor: Colors.white,
      selectedColor: primaryOrange.shade800,
      onSelected: (bool isSelected){
        setState(() {
          onSelected(isSelected? label:'');
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
    );
  }

  Widget searchOptionalChoice (String label, String selectedValue, Function(String) onSelected){
    return ChoiceChip(
      showCheckmark: false,
      label: Text(label), 
      selected: selectedValue == label,
      labelStyle: bodyLSemibold.copyWith(
        color: selectedValue == label? Colors.white: Colors.black),
      backgroundColor: Colors.white,
      selectedColor: primaryOrange.shade800,
      onSelected: (bool isSelected){
        setState(() {
          onSelected(isSelected? label:'');
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
    );
  }


}