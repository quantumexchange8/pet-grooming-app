import 'package:adoptify/Pages/adoptPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class PetDetailPage extends StatefulWidget {
  final PetDetailDataModel petDetails;
  const PetDetailPage({super.key, required this.petDetails});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {

  @override
  void initState(){
    super.initState();
    //petDetailsData = getPetDetailsByName(widget.animal.animalName);
  }

  @override
  Widget build(BuildContext context) {
    
    final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(widget.petDetails);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Pet Details', style: heading4Bold),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.share_outlined, size: 25)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.more_vert, size: 30)
          ),

        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //pet picture
                    Image.asset(widget.petDetails.petImage, width: 200, height: 200),
              
                    const SizedBox(height: 10),

                    //pet name (pet breed)
                    RichText(
                      text: TextSpan(
                        text: widget.petDetails.petName,style: heading4Bold.copyWith(color: Theme.of(context).primaryColor), 
                        children: <TextSpan>[
                          TextSpan(text: '   (${widget.petDetails.petBreed})', style: bodyLMedium.copyWith(color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    ),
                    

                    const SizedBox(height: 15),
                    //distance
                    Row(
                      children: [
                        Icon(IconlyBold.location,size: 20.0, color: primaryOrange.shade800),
                        const SizedBox(width: 5),
                        Text(widget.petDetails.distanceFromPet, style: bodyLMedium),
                      ],
                    ),

                    //gender,age,size
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFFE3323).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text('Gender', style: bodySRegular),
                              const SizedBox(height: 10),
                              Text(widget.petDetails.petGender, style: bodyLSemibold),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0x14235DFF).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text('Age', style: bodySRegular),
                              const SizedBox(height: 10),
                              Text(widget.petDetails.petAge, style: bodyLSemibold),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0x1400A86B).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text('Size', style: bodySRegular),
                              const SizedBox(height: 10),
                              Text(widget.petDetails.petSize, style: bodyLSemibold),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    //pet owner or organization
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset('assets/logo/no_image.png', width: 50, height: 50),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.petDetails.petOrganization, style: heading6Bold),
                                Text(widget.petDetails.petOrganizationAddress, style: bodyMMedium),
                              ],
                            ),
                          ],
                        ),
                        Icon(IconlyBold.send, color: primaryOrange.shade800),
                      ],
                    ),


                    const SizedBox(height: 20),
                    //about the pet
                    Text('About ${widget.petDetails.petName}', style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petDescription, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text('Personality Traits', style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petDescription2, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text('Ideal Home', style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petAdoptInfo, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text('Adoption Information', style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petAdoptInfo2, style: bodyXLRegular),
                    
                
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
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFDF6EE),
                    ),
                    child: FittedBox(
                      child: IconButton(
                        icon: Icon(
                          isFavourite? IconlyBold.heart: IconlyLight.heart,                        
                          color: primaryOrange.shade800, 
                        ),
                        iconSize: 30.0,
                        onPressed: () {
                          context.read<FavouriteController>().toggleAllPetFavourite(widget.petDetails);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => AdoptPage(),
                          ),
                        );
                      }, 
                      text: 'Adopt',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //align bottom center (favourite icon and button)
      

    );
  }
}