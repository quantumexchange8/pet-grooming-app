import 'package:adoptify/Pages/aboutMessages/chatOwnerPage.dart';
import 'package:adoptify/Pages/aboutPetPages/petDetailPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/dataModel/chatsDataModel.dart';
import 'package:adoptify/dataModel/ownerDetailDataModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:iconly/iconly.dart';

class OwnerDetailPage extends StatefulWidget {
  final OwnerDetailDataModel petOwnerDetail;
  const OwnerDetailPage({super.key, required this.petOwnerDetail});

  @override
  State<OwnerDetailPage> createState() => _OwnerDetailPageState();
}

class _OwnerDetailPageState extends State<OwnerDetailPage> {

  
  List<String> listPageForPetAndPolicy(BuildContext context){
    int petCount = widget.petOwnerDetail.petListBasedOnOwner.length;
    return [ '${context.tr("Pet")} ($petCount)', context.tr("Adoption Policy")];
    
  }

  int selectedIndex = 0;

  PetDetailDataModel? getPetDetailsByName(String petName){
    return PetDetailDataModel.petDetailList.firstWhere(
      (pet)=> pet.petName == petName,
      orElse:() => PetDetailDataModel(
        petName: '', 
        petImage: '', 
        petType: '', 
        distanceFromPet: '', 
        petBreed: '', 
        petOrganization: '', 
        petDescription: '', 
        petOrganizationAddress: '', 
        petOrganizationImage: '', 
        petAdoptInfo: '', 
        petAge: '', 
        petGender: '', 
        petSize: '', 
        petDescription2: '', 
        petAdoptInfo2: ''
      ),
    );
  }

  void _showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {

    final owner = widget.petOwnerDetail;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: IconButton(
            icon: const Icon(IconlyLight.arrow_left), 
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        title: Text(owner.ownerName, style: heading4Bold),
        centerTitle: true,
        actions: [ 
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30),
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    //owner or organization simple description
                
                    Container(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      width: double.infinity, height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Image.asset('assets/logo/no_image.png', width: 80, height:80),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(owner.ownerName, style: heading6Bold),
                                  const SizedBox(height: 15),
                                  _petOwnerInfoWidget(IconlyBold.location, owner.ownerPlaceAddress),
                                  
                                  const SizedBox(height: 10),
                                  _petOwnerInfoWidget(IconlyBold.calling, owner.ownerPhoneNo),
                                  
                                  const SizedBox(height: 10),
                                  _petOwnerInfoWidget(IconlyBold.message, owner.ownerEmail),
                                  
                                  const SizedBox(height: 10),
                                  _petOwnerInfoWidget(IconlyBold.discovery, owner.ownerWebsite),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                
                    //contact info
                    Container(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      width: double.infinity, height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _contactInfoOfPetOwner(const Color(0xFF4AAF57), (){}, IconlyBold.calling, 'Phone'),
                            _contactInfoOfPetOwner(const Color(0xFF1A96F0), (){}, IconlyBold.message, 'Email'),
                            _contactInfoOfPetOwner(const Color(0xFFF54336), (){}, IconlyBold.discovery, 'Website'),
                            _contactInfoOfPetOwner(primaryOrange.shade900, (){}, IconlyBold.send, 'Navigate'),                   
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //pet and adoption policy
                    FlutterToggleTab(
                      width: 92,
                      borderRadius: 5,
                      labels: listPageForPetAndPolicy(context), 
                      selectedBackgroundColors: [primaryOrange.shade800],
                      selectedTextStyle: bodyLBold.copyWith(color: Colors.white),
                      unSelectedBackgroundColors: [Theme.of(context).colorScheme.secondary],
                      unSelectedTextStyle: bodyLBold.copyWith(color: Theme.of(context).colorScheme.primary),
                      selectedLabelIndex: (index){
                        setState(() {
                          selectedIndex = index;
                        });
                      }, 
                      selectedIndex: selectedIndex,
                    ),

                    //Display the content
                    const SizedBox(height: 15),
                    selectedIndex == 0? _petListContent(owner.petListBasedOnOwner): _petAdoptionPolicy(owner),
                
                  ],
                ),
              ),
            ),
          ),

          //button
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomAppBar(
              //color: Colors.white,
              child: Row(
                children: [   
                  const SizedBox(width: 15),

                  Expanded(
                    child: OrangeButton(
                      onPressed: (){

                        final matchingChat = temporaryChatEg.firstWhere(
                          (data) => data.petOrganiationName == widget.petOwnerDetail.ownerName,
                          orElse: ()=> ChatList(
                            petOrganiationName: 'Not Available', 
                            petOrganizationPicUrl: 'assets/logo/no_image.png', 
                            messageList: [],
                          ),
                        );


                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => ChatOwnerPage(chat: matchingChat),
                          ),
                        );
                      }, 
                      text: 'Send Message',
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

  Widget _petOwnerInfoWidget(IconData iconUsed, String labelUsed){
    return RichText(
      text: TextSpan( 
        children: [
          WidgetSpan(
            child: Icon(iconUsed, size: 15, color: primaryOrange.shade800),
          ),
          const WidgetSpan(child: SizedBox(width: 5)),
          TextSpan(text:labelUsed, style: bodyMRegular.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
        ],
      ),                      
    );
  }

  Widget _contactInfoOfPetOwner(Color colorContact, VoidCallback onPressed, IconData iconContact, String labelContact){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: colorContact,
          ),
          child: IconButton(onPressed: onPressed, icon: Icon(iconContact, color: Colors.white)),
        ),
        const SizedBox(height: 5),
        Text(context.tr(labelContact), style: bodyMMedium),
      ],
    );
  }

  Widget _petListContent(List<PetDetailDataModel> pets){
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
      ), 
      itemCount: pets.length,
      itemBuilder: (context, index){
        final pet = pets[index];
        //final isFavourite = context.watch<FavouriteController>().isAnimalFavourite(animal);
    
          return InkWell(
            onTap: (){
              final petDetail = getPetDetailsByName(pet.petName);
              if(petDetail !=null){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=> PetDetailPage(petDetails:petDetail),
                  ),
                );
              }else{
                _showMessage('Failed to list down the pets under this organization.');
              }
            },
             child: Container(
                width: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Pet Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            pet.petImage,
                            width: double.infinity,
                            height: 170.0,
                            fit: BoxFit.cover,
                          ),
                        ),
             
                        // Favourite Icon Positioned in the top right
                       /*  Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryOrange.shade800,
                            ),
                            child: FittedBox(
                              child: IconButton(
                                icon: Icon(
                                  isFavourite? IconlyBold.heart: IconlyLight.heart,                        
                                  color: Colors.white, 
                                ),
                                iconSize: 35.0,
                                onPressed: () {
                                  context.read<FavouriteController>().toggleAllAnimalFavourite(animal);
                                },
                              ),
                            ),
                          ),
                        ), */ 
                      ],
                    ),
             
                    // Pet Information (Name, Location, Breed)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pet.petName, style: bodyLSemibold),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                IconlyBold.location,
                                size: 10,
                                color: primaryOrange.shade800,
                              ),
                              const SizedBox(width: 4),
                              Text(pet.distanceFromPet, style: bodyXSRegular),
                              const SizedBox(width: 8),
                              Text('·', style: bodyXSRegular),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(pet.petBreed, style: bodyXSRegular,overflow: TextOverflow.ellipsis, maxLines: 1)
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
           );
    
    
    
      }
    );
  }

  Widget _petAdoptionPolicy(OwnerDetailDataModel owner){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(owner.ownerName, style: heading5Bold),
        const SizedBox(height: 10),
        Text(owner.ownerIntro, style: bodyXLMedium),
        const SizedBox(height: 10),
        Text(context.tr('1. Adoption Application:'), style: heading5Bold),
        const SizedBox(height: 10),
        Text(owner.adoptionApplication, style: bodyXLMedium),
        const SizedBox(height: 10),
        Text(context.tr('2. Meet and Greet:'), style: heading5Bold),
        const SizedBox(height: 10),
        Text(owner.policy2, style: bodyXLMedium),
        const SizedBox(height: 10),
        Text(context.tr('3. Home Visit:'), style: heading5Bold),
        const SizedBox(height: 10),
        Text(owner.policy3, style: bodyXLMedium),
        const SizedBox(height: 10),
        Text(context.tr('4. Adoption Fee:'), style: heading5Bold),
        const SizedBox(height: 10),
        Text(owner.adoptionFee, style: bodyXLMedium),
        const SizedBox(height: 10),
      ],
    );
  }


}