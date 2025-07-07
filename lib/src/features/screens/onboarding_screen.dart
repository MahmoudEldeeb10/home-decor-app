import 'package:flutter/material.dart';

import 'package:home_decor/src/features/screens/login_screen.dart';
import 'package:home_decor/src/features/widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/onboarding1.jpg',
      'title': 'Confortable Space',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'buttonText': 'Next',
    },
    {
      'image': 'assets/images/onboarding2.jpg',
      'title': 'Modern Design',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'buttonText': 'Next',
    },
    {
      'image': 'assets/images/onboarding3.jpg',
      'title': 'Styled Living',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'buttonText': 'Next',
    },
    {
      'image': 'assets/images/onboarding4.jpg',
      'title': 'Relaxing Furniture',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'buttonText': 'Get Start',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _onboardingData.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          final data = _onboardingData[index];
          return OnboardingPageContent(
            imagePath: data['image']!,
            title: data['title']!,
            description: data['description']!,
            buttonText: data['buttonText']!,
            onButtonPressed: _goToNextPage,
            onSkipPressed: _finishOnboarding,
            currentPage: _currentPage,
            totalPages: _onboardingData.length,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
