
import 'package:adoptify/Pages/aboutMessages/chatOwnerPage.dart';
import 'package:adoptify/Pages/aboutOrganizationPages/ownerDetailPage.dart';
import 'package:adoptify/const/buttonStyle.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/controllers/favouriteController.dart';
import 'package:adoptify/dataModel/animalDetailDataModel.dart';
import 'package:adoptify/dataModel/chatsDataModel.dart';
import 'package:adoptify/dataModel/ownerDetailDataModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';


class PetDetailPage extends StatefulWidget {
  final PetDetailDataModel petDetails;
  const PetDetailPage({super.key, required this.petDetails});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
 
  void _showMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  OwnerDetailDataModel? getOwnerDetailsByOrganization(String organizationName) {
    
    return ownerDetailList.firstWhere(
      (owner) => owner.ownerName == organizationName,
      orElse: () => OwnerDetailDataModel(
        ownerName: '', 
        ownerPlaceAddress: '', 
        ownerPhoneNo: '', 
        ownerEmail: '', 
        ownerWebsite: '', 
        petListBasedOnOwner: [], 
        ownerIntro: '', 
        adoptionApplication: '', 
        policy2: '', 
        policy3: '', 
        adoptionFee: ''
      ),
    );
  }

  /* Future<void> _sharePetInfo() async {
    try{
      String assetPath = widget.petDetails.petImage;
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/');

      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();
      await tempFile.writeAsBytes(bytes);
      
      XFile xFile = XFile(tempFile.path);

      await Share.shareXFiles(
        [xFile],
        text: 'Check out this pet for adoption: ${widget.petDetails.petName}'
      );
    } catch (e){
      _showMessage('Failed to share content');
    }
  } */

  @override
  Widget build(BuildContext context) {

    final isFavourite = context.watch<FavouriteController>().isPetAdoptionFavourite(widget.petDetails);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left), 
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(context.tr('Pet Details'), style: heading4Bold),
        centerTitle: true,
        actions: [
        
          IconButton( 
            onPressed: (){
              // the sharing info is supposed be like sharing a link like shopee or lazada product and click and navigate to the exact pet
              Share.share('🐾 ${context.tr('Check out this adorable pet')}, ${widget.petDetails.petName} (${widget.petDetails.petBreed}/${widget.petDetails.petType}) ${context.tr('for adoption')}.');
            },
            
            icon: const Icon(Icons.share_outlined, size: 25),
            
          ), 

          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_vert, size: 30)
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
                    
                    // Pet picture
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), // problem cannot show the rounded edge
                      ),
                      child: Image.asset(
                        widget.petDetails.petImage,
                        width: double.infinity, // Full width of the screen
                        height: 300, // Adjust height as needed for a larger display
                        fit: BoxFit.cover, // Ensures the image fills the space
                      ),
                    ),

              
                    const SizedBox(height: 10),

                    //pet name (pet breed)
                    RichText(
                      text: TextSpan(
                        text: widget.petDetails.petName,style: heading4Bold.copyWith(color: Theme.of(context).colorScheme.primary), 
                        children: <TextSpan>[
                          TextSpan(text: '   (${widget.petDetails.petBreed})', style: bodyLMedium.copyWith(color: Theme.of(context).colorScheme.primary)),
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
                            color: const Color(0xFFFE3323).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(context.tr('Gender'), style: bodySRegular),
                              const SizedBox(height: 10),
                              Text(widget.petDetails.petGender, style: bodyLSemibold),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0x14235DFF).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(context.tr('Age'), style: bodySRegular),
                              const SizedBox(height: 10),
                              Text(widget.petDetails.petAge, style: bodyLSemibold),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0x1400A86B).withOpacity(0.08),
                          ),
                          width: 115, height: 70, 
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(context.tr('Size'), style: bodySRegular),
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
                        GestureDetector(
                          onTap: () { 
                            final petOwnerDetail = getOwnerDetailsByOrganization(widget.petDetails.petOrganization);
                             if (petOwnerDetail != null) {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => OwnerDetailPage(petOwnerDetail: petOwnerDetail),
                              ),
                            );
                          } else {
                            _showMessage('Organization details not found.');
                          }
                          },
                          child: Row(
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
                        ),
                        IconButton(
                          icon: Icon(IconlyBold.send, color: primaryOrange.shade800),
                          onPressed: (){

                          final matchingChat = temporaryChatEg.firstWhere(
                            (data) => data.petOrganiationName == widget.petDetails.petOrganization,
                            orElse: ()=> ChatList(
                              petOrganiationName: 'Not Available', 
                              petOrganizationPicUrl: 'assets/logo/no_image.png', 
                              messageList: [],
                            ),
                          );

                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=> ChatOwnerPage(chat: matchingChat),
                              ),
                            );
                          },
                        ),
                      ],
                    ),


                    const SizedBox(height: 20),
                    //about the pet
                    Text('${context.tr('About')} ${widget.petDetails.petName}', style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petDescription, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text(context.tr('Personality Traits'), style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petDescription2, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text(context.tr('Ideal Home'), style: heading5Bold),
                    const SizedBox(height: 15),
                    Text(widget.petDetails.petAdoptInfo, style: bodyXLRegular),
                    const SizedBox(height: 25),
                    Text(context.tr('Adoption Information'), style: heading5Bold),
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
                      color: Theme.of(context).colorScheme.tertiary,
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

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 45,  vertical: 115), // Positioning margin
                              content: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icon/click_icon.png', height: 35, width: 35),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    child: Text(isFavourite? context.tr('Removed from Favorites!'):context.tr('Added to Favorites!'), 
                                        style: heading5Bold.copyWith(color: Theme.of(context).colorScheme.primary), 
                                        textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          );
                         
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OrangeButton(
                      onPressed: (){

                        final matchingChat = temporaryChatEg.firstWhere(
                          (data) => data.petOrganiationName == widget.petDetails.petOrganization,
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