import 'package:flutter/material.dart';
import 'package:onboarding_screens/intro_screens/intro_page_1.dart';
import 'package:onboarding_screens/intro_screens/intro_page_2.dart';
import 'package:onboarding_screens/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import package
import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Controller to keep track of which page we're on
  final PageController _controller = PageController();

  // Keep track of if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. THE SWIPEABLE PAGES
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                // Check if we are on page 2 (index 2 is the 3rd page: 0, 1, 2)
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // 2. THE NAVIGATION CONTROLS (Bottom of screen)
          Container(
            alignment: const Alignment(0, 0.75), // Position at bottom center
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                // SKIP BUTTON
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2); // Jump to end
                  },
                  child: const Text('Skip'),
                ),

                // DOT INDICATOR
                SmoothPageIndicator(
                  controller: _controller, 
                  count: 3,
                  effect: const WormEffect( // Choose your effect: Worm, Slide, Scale, etc.
                    activeDotColor: Colors.deepPurple,
                    dotColor: Colors.grey,
                  ),
                ),

                // NEXT or DONE BUTTON
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          // Navigate to Home Page
                           Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) {
                              return const HomePage();
                            }),
                          );
                        },
                        child: const Text('Done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500), 
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}