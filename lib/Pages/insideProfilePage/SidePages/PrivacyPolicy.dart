import 'package:adoptify/const/constant.dart';
import 'package:adoptify/const/urbanist_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('Privacy Policy'), style: heading4Bold),
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
                  radius: const Radius.circular(5),
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(context.tr('Effective Date: December 19, 2024'), style: heading5Bold),
                            ),
                        
                          _listOfPolicy(
                            '1. Information Collection:', 
                            'Adoptify collects user-provided information during account creation and adoption applications.'),
                    
                          _listOfPolicy(
                            '2. Information Usage:', 
                            'User data is used for adoption processes, notifications, and improving Adoptify services.'),
                    
                          _listOfPolicy(
                            '3. Information Sharing:', 
                            'Limited information is shared with shelters during adoption applications.'),
                    
                          _listOfPolicy(
                            '4. Security Measures:', 
                            'Adoptify employs security measures to protect user data.'),
                    
                          _listOfPolicy(
                            '5. Cookies:', 
                            'Adoptify uses cookies for a better user experience. Users can manage cookie preferences.'),
                    
                          _listOfPolicy(
                            '6. Third-Party Links:', 
                            'Adoptify may contain links to third-party websites or services. These links are provided for user convenience, but Adoptify does not control or endorse these external sites. We recommend reviewing the privacy policies of any third-party websites you visit, as we are not responsible for their practices or content.'),
                          
                          _listOfPolicy(
                            '7. Data Retention:', 
                            'Adoptify retains user data for as long as necessary to provide services, comply with legal obligations, resolve disputes, and enforce agreements. After this period, the data will be securely deleted or anonymized.'),
                    
                          _listOfPolicy(
                            '8. User Rights:', 
                            'Users have the right to access, correct, delete or restrict the processing of their personal information. To exercise these rights, users can contact Adoptify via the provided support channels.'),
                    
                          _listOfPolicy(
                            '9. Changes to This Privacy Policy:', 
                            'Adoptify reserves the right to update or modify this Privacy Policy at any time. Users will be notified of significant changes via email or app notifications. The revised policy will indicate the date of the last update.'),
                    
                          _listOfPolicy(
                            '10. Contact Us:', 
                            'If you have any questions or concerns regarding this Privacy Policy or your data, please contact us at: \n Email: support@adoptify.com \n Phone: +1 (555) 123-4567'),
                    
                          _listOfPolicy(
                            '11. Children\'s Privacy:', 
                            'Adoptify does not knowingly collect personal information from children under 13 years of age. If we become aware that we have inadevertently collected such data, it will be promptly deleted.'),
                         
                    
                    
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

 Widget _listOfPolicy(String title, String description){
  return ListTile(
    title: Text(context.tr(title), style: heading5Bold),
    subtitle: Text(context.tr(description), style: bodyXLMedium),
  );
 }

}