import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:adoptify/dataModel/faqDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
 

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String selectedFAQues = '';  
    List<FAQdataModel> egFAQ = FAQdataModel.exampleOfFAQ;
    

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text('FAQ', style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.onTertiary,
              ),
              width: double.infinity,
              height: 55,
              child: TextField(
                autofocus: false,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: bodyLRegular.copyWith(color: grey.shade400),
                  prefixIcon: const Icon(IconlyLight.search, size: 20),
                  prefixIconColor: grey.shade400,
                  border: InputBorder.none
                ),
              ),
            ),

            const SizedBox(height: 15),
            //row of buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: [
                  
                  selectionFAQ(selectedFAQues, 'General', 
                    (value){
                      setState(() {
                        selectedFAQues = value;
                        
                      });
                    }),
              
                  selectionFAQ(selectedFAQues, 'Account', 
                    (value){
                      setState(() {
                        selectedFAQues = value;
                        
                      });
                    }),
              
                  selectionFAQ(selectedFAQues, 'Services', 
                    (value){
                      setState(() {
                        selectedFAQues = value;
                      });
                    }),
              
                  selectionFAQ(selectedFAQues, 'Adoption', 
                    (value){
                      setState(() {
                        selectedFAQues = value;
                      });
                    }),
                ],
              ),
            ),

            const SizedBox(height: 25),
            //expansion view
            Expanded(
              child: ListView.builder(          
                itemCount: egFAQ.length,
                itemBuilder:(context, index){
                  final q = egFAQ[index];

                  return expansionTileFAQ(q.faqTitle, q.faqExplanation);
                }

              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget selectionFAQ(String selectedQues, String label, Function(String) onSelected){
    return ChoiceChip(
      label: Text(label),
      labelStyle: bodyLSemibold.copyWith(
        color: selectedQues == label? Colors.white : Theme.of(context).colorScheme.primary,
      ), 
      selected: selectedQues == label,
      selectedColor: primaryOrange.shade800,
      backgroundColor: Theme.of(context).colorScheme.background,
      onSelected: (bool isSelected) {
        setState(() {
          //onSelected(isSelected? label:'');   
          selectedQues = isSelected? label : '';
          
        });
      },
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: grey.shade300),
      ),
      
    );
  }

  Widget expansionTileFAQ(String title, String explanation){
    
    return Column(
      children: [
        ExpansionTile(
          title: Text(title, style: heading6Bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          collapsedBackgroundColor: Theme.of(context).colorScheme.onTertiary,
          backgroundColor: Theme.of(context).colorScheme.onTertiary,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(
                thickness: 1,
                color: grey.shade300,
              ),
            ),
            ListTile(
              title: Text(explanation, style: bodyLMedium),
            ),
          ],
          
        ),
        const SizedBox(height: 15),
      ],
    );
  }


}