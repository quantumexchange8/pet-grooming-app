import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textstyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('Terms of Service'), style: heading4Bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),

     
      body: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(primaryOrange.shade900),
          trackColor: MaterialStateProperty.all(grey.shade500),
          trackBorderColor: MaterialStateProperty.all(grey.shade800),
         
          //thickness: MaterialStateProperty.all(3)

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Scrollbar(
                  thumbVisibility: true,
                  radius: const Radius.circular(5),
                  
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(context.tr('Effective Date: December 20, 2024'), style: heading5Bold),
                            ),
                        
                          _listOfTerms(
                            '1. Acceptance of Terms:', 
                            'By using Adoptify, users accept and agree to these Terms of Service.'),
                    
                          _listOfTerms(
                            '2. Eligibility:', 
                            'Users must be at least 18 years old or have parental consent to use Adoptify.'),
                    
                          _listOfTerms(
                            '3. User Accounts:', 
                            'Users are responsible for maintaining the confidentiality of their account information.'),
                    
                          _listOfTerms(
                            '4. Adoption Process:', 
                            'Adoption application are subject to review and approval by shelters.'),
                    
                          _listOfTerms(
                            '5. User Conduct:', 
                            'Users agree not to engage in harmful activities, including unauthorized access or data manipulation.'),
                    
                          _listOfTerms(
                            '6. Intellectual Property:', 
                            'Adoptify retains ownership of its intellectual property, including but not limited to trademarks, logos, designs, and content. Users must not reproduce, distribute, modify, create derivative works, publicly display, or exploit any part of Adoptify\'s intellectual property without prior written consent. Any unauthorized use may result in legal action.'),
                          
                          _listOfTerms(
                            '7. Privacy Policy:', 
                            'Users agree to the collection and use of their information as outlined in Adoptify\'s Privacy Policy. This includes the use of cookies, analytics, and user-provided data to enhance the app experience.'),
                    
                          _listOfTerms(
                            '8. Limitation of Liability:', 
                            'Adoptify is not liable for any direct, indirect, incidental or consequential damages arising from the use of its services. This includes, but is not limited to, damages from miscommunication, loss of data, or third-party actions.'),
                    
                          _listOfTerms(
                            '9. Termination:', 
                            'Adoptify reserves the right to suspend or terminate user accounts at its sole disrection for any violation of the Terms of Service or any suspicious activity.'),
                    
                          _listOfTerms(
                            '10. Changes to Terms of Service:', 
                            'Adoptify reserves the right to update or modify these Terms of Service at any time. Users will be notified of any significant changes, and continued use of the app constitutes acceptance of the updated terms.'),
                    
                          _listOfTerms(
                            '11. Governing Law:', 
                            'These Terms of Service are governed by the laws of the application jurisdiction. Any disputes must be resolved through the courts in that jurisdiction.'),
                         
                          _listOfTerms(
                            '12. Contact Information:', 
                            'For inquiries or issues related to the Terms of Service, users can contact Adoptify\'s support team at support@adoptify.com.'),
                    
                    
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
        
            
          ],
        ),
      ),
    );
  }

  Widget _listOfTerms(String title, String description){
  return ListTile(
    title: Text(context.tr(title), style: heading5Bold),
    subtitle: Text(context.tr(description), style: bodyXLMedium),
  );
 }


}