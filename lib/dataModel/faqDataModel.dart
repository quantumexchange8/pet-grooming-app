class FAQdataModel{
  final String faqTitle;
  final String faqExplanation;

  FAQdataModel({
    required this.faqTitle,
    required this.faqExplanation,
  });

  FAQdataModel copyWith({
    String? faqTitle,
    String? faqExplanation,
  }){
    return FAQdataModel(
      faqTitle: faqTitle?? this.faqTitle, 
      faqExplanation: faqExplanation?? this.faqExplanation,
    );
  }

  Map<String,dynamic> toJson() =>{
    'faqTitle': faqTitle,
    'faqExplanation': faqExplanation,
  };

  factory FAQdataModel.fromJson(Map<String, dynamic> json) => FAQdataModel(
    faqTitle: json['faqTitle'], 
    faqExplanation: json['faqExplanation'],
  );



  //example faq

  static List<FAQdataModel> exampleOfFAQ = [
    FAQdataModel(
      faqTitle: 'What is Adoptify?', 
      faqExplanation: 'Adoptify is a platform connecting adopters with pets in local shelters. Browse, apply, and find your perfect furry companion.',
    ),

    FAQdataModel(
      faqTitle: 'How does Adoptify work?', 
      faqExplanation: 'Adoptify allows you to browse pets available for adoption, filter by your preferences, and connect directly with local shelters or organizations for the adoption process.',
    ),

    FAQdataModel(
      faqTitle: 'Is Adoptify a free service?', 
      faqExplanation: 'Yes, Adoptify is completely free to user. However, some shelters or organizations may charge a nominal adoption fee to cover the care of the pets.',
    ),

    FAQdataModel(
      faqTitle: 'How do I apply for adoption?',
      faqExplanation: 'To apply for adoption, select a pet you are interested in and follow the application process on their profile. This typically includes filling out a form and providing required information to the shelter.',
    ),

    FAQdataModel(
      faqTitle: 'Can I adopt from any location?',
      faqExplanation: 'Yes, you can view pets from various locations. However, some shelters may have restrictions or preferences for adopters within thier area.',
    ),

    FAQdataModel(
      faqTitle: 'How do I contact a shelter?',
      faqExplanation: 'You can contact a shelter directly through the pet\'s profile. Each listing includes contact details or a message option to reach the shelter.',
    ),

    FAQdataModel(
      faqTitle: 'Can I list a pet for adoption?',
      faqExplanation: 'Yes, Adoptify allows individuals or organizations to list pets for adoption. You need to create an account, provide details about the pet, and submit the listing for approval.',
    ),



  ];


}


