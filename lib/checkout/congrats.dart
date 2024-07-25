import 'dart:math';
import 'package:flutter/material.dart';


class CongratulationPage extends StatefulWidget {
  const CongratulationPage({super.key});

  @override
  _CongratulationPageState createState() => _CongratulationPageState();
}

class _CongratulationPageState extends State<CongratulationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Slower animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: FireworksPainter(_controller.value),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Congrats!',
                  style: TextStyle( fontSize: 48, fontWeight: FontWeight.bold,color: Colors.yellow ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text('Your order has been placed successfully!',
                  style: TextStyle( fontSize: 24, color: Colors.white, ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.yellow, backgroundColor: Colors.white24,
                        textStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                    SizedBox(width: 30,),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.yellow, backgroundColor: Colors.white24,
                        textStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(' Invoice-'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class FireworksAnimation extends StatefulWidget {
  @override
  _FireworksAnimationState createState() => _FireworksAnimationState();
}

class _FireworksAnimationState extends State<FireworksAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: FireworksPainter(_controller.value),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}

class FireworksPainter extends CustomPainter {
  final double animationValue;
  final Random random = Random();

  FireworksPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill;

    // Determine the center of the canvas
    final center = Offset(size.width / 2, size.height / 2);

    // The start position is at the bottom center of the canvas
    final startPosition = Offset(size.width / 2, size.height);

    // Animate the firework upward to the center
    double fireworkY = size.height - (size.height * animationValue);
    Offset fireworkPosition = Offset(size.width / 2, fireworkY);

    // Draw the initial firework trail only if it hasn't reached the center
    if (fireworkY > size.height / 2) {
      paint.color = Colors.yellow;
      canvas.drawCircle(fireworkPosition, 3.0, paint);
    }

    if (animationValue > 0.5) {
      for (int i = 0; i < 5; i++) {
        _drawFirework(canvas, center, paint, animationValue);
      }
    }
  }

  void _drawFirework(Canvas canvas, Offset center, Paint paint, double animationValue) {
    double radius = (animationValue - 0.5) * 2 * 250; // Adjusted for better timing

    for (int i = 0; i < 80; i++) { // More particles for a richer effect
      double dx = cos(2 * pi * i / 30) * radius;
      double dy = sin(2 * pi * i / 30) * radius;

      double particleSize = random.nextDouble() * 4 + 1; // Random particle sizes
      paint.shader = RadialGradient(
        colors: [
          Color.fromRGBO(
            (random.nextDouble() * 255).toInt(),
            (random.nextDouble() * 255).toInt(),
            (random.nextDouble() * 255).toInt(),
            1,
          ),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(center.dx + dx, center.dy + dy), radius: particleSize));

      canvas.drawCircle(Offset(center.dx + dx, center.dy + dy), particleSize, paint);

      // Draw trails for particles
      for (int j = 1; j < 5; j++) {
        double trailFactor = j / 5;
        canvas.drawCircle(Offset(center.dx + dx * trailFactor, center.dy + dy * trailFactor), particleSize * trailFactor, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}