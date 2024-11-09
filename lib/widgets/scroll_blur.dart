import 'dart:ui';
import 'package:flutter/material.dart';

class ScrollBlurScreen extends StatefulWidget {
  const ScrollBlurScreen({super.key});

  @override
  State<ScrollBlurScreen> createState() => _ScrollBlurScreenState();
}

class _ScrollBlurScreenState extends State<ScrollBlurScreen> {
  final ScrollController _scrollController = ScrollController();
  double _textFormFieldOpacity = 1.0;
  bool _showLogo = false;
  double _logoPosition = -100;

  @override
  void initState() {
    super.initState();
    // Add a listener to the ScrollController
    _scrollController.addListener(() {
      setState(() {
        // Change opacity and logo position based on scroll position
        if (_scrollController.offset > 50) {
          _textFormFieldOpacity = 0.0; // Fade out the TextFormField
          _showLogo = true; // Show the logo
          _logoPosition = 20; // Move the logo to center
        } else {
          _textFormFieldOpacity = 1.0; // Fade in the TextFormField
          _showLogo = false; // Hide the logo
          _logoPosition = -100; // Reset the logo position off-screen
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<String> cardImages = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];
  final List<String> cardTitles = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          GridView.builder(
            controller: _scrollController,
            // Attach the ScrollController
            itemCount: cardImages.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 230),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        cardImages[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )),
                      child: Row(
                        children: [
                          Text(
                            cardTitles[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // Blurred App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0, // Height of the blurred app bar
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.3), // Slightly darker transparent color
                  ),
                ),
              ),
            ),
          ),
          // Search TextField with animation on scroll
          Positioned(
            top: 120,
            // Adjust to create more space between the blurred app bar and ListView
            left: 16,
            right: 16,
            child: AnimatedOpacity(
              opacity:
              _textFormFieldOpacity, // Use the opacity value based on scroll position
              duration: const Duration(
                  milliseconds: 300), // Duration of the fade animation
              child: SizedBox(
                height: 65, // Height of the TextFormField
                child: TextFormField(
                  style: const TextStyle(fontSize: 20), // Text size
                  decoration: InputDecoration(
                    hintText: 'Search ',
                    // Placeholder text
                    hintStyle:
                    const TextStyle(fontSize: 16, color: Colors.white),
                    // Hint text style
                    filled: true,
                    fillColor: Colors.grey,
                    // Background color with transparency
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove the border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove the border
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16), // Adjust padding
                  ),
                ),
              ),
            ),
          ),
          // Flutter logo animation
          // AnimatedPositioned(
          //   left: _logoPosition, // Position of the logo based on scroll
          //   top: 50, // Adjust logo vertical position
          //   duration: const Duration(
          //       milliseconds: 800), // Duration of the position animation
          //   child: AnimatedOpacity(
          //     opacity: _showLogo ? 1.0 : 0.0, // Fade in the logo if showing
          //     duration: const Duration(milliseconds: 800),
          //     child: Container(
          //       width: 60, // Width of the logo
          //       height: 60, // Height of the logo
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.cyan.withOpacity(0.2),
          //       ),
          //       child: Center(
          //         child: Text(
          //           'X',
          //           style: TextStyle(
          //             fontSize: 30,
          //             color: Colors.grey.shade300,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}