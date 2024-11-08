import 'package:adoptify/Pages/SignIn/signInPage.dart';
import 'package:adoptify/const/constant.dart';
import 'package:adoptify/widgets/curveBottomSheet.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  void _onPageChanged(int page){
    if(page >= _pages.length){
      _pageController.jumpToPage(_pages.length - 1);
    }else{
      setState(() {
        _activePage = page;
      });
    }
  }

  void nextPage() {
    if(_activePage < _pages.length - 1){
      _pageController.nextPage(
        duration: Duration(milliseconds: 300), 
        curve: Curves.easeInOut,
      );
    }else{
      Navigator.push(context, 
        MaterialPageRoute(
          builder: (context)=> SignIn(),
        ),
      );
    }
  }

  void previousPage(){
    if(_activePage > 0){
      _pageController.previousPage(
        duration: Duration(milliseconds: 300), 
        curve: Curves.easeInOut,
      );
    }
  }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (BuildContext context, int index){
              return _pages[index % _pages.length];
            },
            itemCount: _pages.length,
          ),
        ],
      ),
      
      
      
    );
  }

}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image1.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 1,
              titleText: 'Adoptify - Where Furry Tales Begin',
              descriptionText: 'Embark on a heartwarming journey to find your perfect companion. Swipe, match, and open your heart to a new furry friend.', 
              page: 'page1',
            ),
          ),
        ],
      ),
      
    );
  }
}


class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image2.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 2,
              titleText: 'Explore a World of Companionship',
              descriptionText: 'Discover a diverse array of adorable companions, find your favorites, and let the tail-wagging adventure begin.', 
              page: 'page2',
            ),
          ),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange.shade900,
              image: const DecorationImage(
                image: AssetImage('assets/image/walkthrough_image3.png'),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CurveBottomSheet(
              currentStep: 3,
              titleText: 'Connect with Caring Pet Owners Around You',
              descriptionText: 'Easily connect with pet owners, ask about animals, & make informed decisions. Adoptify is here to guide you every step of the way.', 
              page: 'page3',
            ),
          ),
        ],
      ),
    );
  }
}