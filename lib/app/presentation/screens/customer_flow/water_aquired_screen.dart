import 'package:aquayar/app/presentation/widgets/customer_flow/alert.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:simple_gradient_text/simple_gradient_text.dart';

class WaterAcquiredScreen extends StatefulWidget {
  const WaterAcquiredScreen({super.key});

  @override
  _WaterAcquiredScreenState createState() => _WaterAcquiredScreenState();
}

class _WaterAcquiredScreenState extends State<WaterAcquiredScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 6500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: WavePainter(
                    animationValue: _animation.value,
                    waveColor: const Color(0xff0579CE),
                    waveHeight: 0.40,
                    waveAmplitude: 10.0,
                    waveFrequency: 2,
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                const TextWidget(
                  text: "Water Acquired!",
                  fontSize: 33,
                  color: AppColors.titleBlack,
                  fontWeight: FontWeight.bold,
                ),
                const TextWidget(
                  text: "Now enjoy your full tank of water. ",
                  fontSize: 13,
                  color: Color(0xff868FAE),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset("assets/images/check_tile.png"),
                const SizedBox(
                  height: 150,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.35)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const TextWidget(
                          text: "Rate the driver",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        const TextWidget(
                          text:
                              "We take your reviews and complaints very seriously.",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomAlert(
                                    content:
                                        'Customize your alert content here',
                                    alignment: Alignment.center,
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.25)),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      shadowColor: const Color(0xff61C7F9),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 115,
                            ),
                            GradientText("Proceed to Home",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                                colors: const [
                                  Color(0xff61C7F9),
                                  Color(0xff0579CE),
                                ]),
                            const Flexible(
                              child: SizedBox(
                                width: 160,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xff0579CE),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;
  final Color waveColor;
  final double waveHeight;
  final double waveAmplitude;
  final double waveFrequency;

  WavePainter({
    required this.animationValue,
    required this.waveColor,
    required this.waveHeight,
    required this.waveAmplitude,
    required this.waveFrequency,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = waveColor;

    final wavePath = Path();
    final waveWidth = size.width;

    wavePath.moveTo(0, size.height);

    for (double i = 0; i <= waveWidth; i++) {
      final x = i;
      final y = math.sin((i / waveWidth * 1 * math.pi) +
                  (animationValue * 2 * math.pi * waveFrequency)) *
              waveAmplitude +
          size.height * (1 - waveHeight);
      wavePath.lineTo(x, y);
    }

    wavePath.lineTo(size.width, size.height);
    wavePath.close();

    canvas.drawPath(wavePath, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return animationValue != oldDelegate.animationValue ||
        waveColor != oldDelegate.waveColor ||
        waveHeight != oldDelegate.waveHeight ||
        waveAmplitude != oldDelegate.waveAmplitude ||
        waveFrequency != oldDelegate.waveFrequency;
  }
}
