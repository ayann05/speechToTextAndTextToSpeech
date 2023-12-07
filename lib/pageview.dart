import 'package:flutter/material.dart';
import 'package:ttsandstt/custom/selectionbutton.dart';
import 'package:ttsandstt/posts/post1.dart';
import 'package:ttsandstt/posts/post2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ttsandstt/selectionPart.dart';

class pageView extends StatefulWidget {
  const pageView({super.key});

  @override
  State<pageView> createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 600,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: const [
                  MyPost2(),
                  MyPost1(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 2,
            effect: SwapEffect(
              activeDotColor: Colors.deepOrange,
              dotColor: Colors.deepOrange.shade100,
              dotHeight: 20,
              dotWidth: 20,
            ),
          ),
          ElevatedButton(
            style: selectionBtn,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const selection()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
