import 'package:flutter/material.dart';

class QrIndicator extends StatefulWidget {
  const QrIndicator({super.key});

  @override
  State<QrIndicator> createState() => _QrIndicatorState();
}

class _QrIndicatorState extends State<QrIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double maxWidth = 200;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double progress = 1 - _controller.value;
              return Align(
                alignment: Alignment.center,
                child: Container(
                  width: maxWidth * progress,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
