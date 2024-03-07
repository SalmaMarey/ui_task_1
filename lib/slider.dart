import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:ui_challenge_1/fourth_screen.dart';
import 'package:ui_challenge_1/second_screen.dart';
import 'package:ui_challenge_1/third_screen.dart';

import 'fisrt_screen.dart';

class SliderConnectedPage extends StatefulWidget {
  const SliderConnectedPage({Key? key}) : super(key: key);

  @override
  State<SliderConnectedPage> createState() => _SliderConnectedPageState();
}

class _SliderConnectedPageState extends State<SliderConnectedPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void nextPage() {
    if (_currentPage < 3) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromARGB(255, 186, 136, 132),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: previousPage,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 50, left: 50, top: 20),
                      child: FlutterSlider(
                        values: [_currentPage.toDouble()],
                        max: 3,
                        min: 0,
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          _pageController.jumpToPage(lowerValue.round());
                        },
                        handlerWidth: 5,
                        handlerHeight: 20,
                        handler: FlutterSliderHandler(
                          decoration: const BoxDecoration(),
                          child: Container(),
                        ),
                        trackBar: FlutterSliderTrackBar(
                          inactiveTrackBar:
                              const BoxDecoration(color: Colors.grey),
                          activeTrackBar: BoxDecoration(
                            color: _currentPage == 0 ? Colors.grey : Colors.red,
                          ),
                        ),
                        handlerAnimation: const FlutterSliderHandlerAnimation(
                          curve: Curves.elasticOut,
                          reverseCurve: Curves.elasticIn,
                          duration: Duration(milliseconds: 700),
                        ),
                        tooltip: FlutterSliderTooltip(
                          format: (value) {
                            return value.toString();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FirstScreen(
                    onNextPage: nextPage,
                  ),
                  SecondScreen(
                    onNextPage: nextPage,
                  ),
                  ThirdScreen(
                    onNextPage: nextPage,
                  ),
                  const FourthScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
