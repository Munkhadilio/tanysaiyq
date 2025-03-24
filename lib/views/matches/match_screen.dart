import 'dart:math';
import 'package:flutter/material.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heartAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _heartAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
      appBar: AppBar(centerTitle: true),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ..._buildFloatingHearts(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  ScaleTransition(
                    scale: _heartAnimation,
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent,
                      size: 72,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildRotatedCard('assets/images/girl1.jpg', -10),
                      const SizedBox(width: 16),
                      _buildRotatedCard('assets/images/girl2.jpg', 10),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "It's a Match!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Muhammad Ibn Al Ab dal\nand another person matched!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  _buildButton(
                    onPressed: () => print("Посмотреть ее/его профиль"),
                    text: 'Ее/его профиль',
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    onPressed: () => print("Написать"),
                    text: 'Написать',
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required String text,
  }) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.grey.shade400,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildRotatedCard(String imagePath, double angle) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Material(
        elevation: 6,
        shadowColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFloatingHearts() {
    final random = Random();
    return List.generate(10, (index) {
      final left = random.nextDouble() * MediaQuery.of(context).size.width;
      final top = random.nextDouble() * MediaQuery.of(context).size.height;

      return Positioned(
        left: left,
        top: top,
        child: Icon(
          Icons.favorite,
          color: Colors.pinkAccent.withOpacity(0.2),
          size: random.nextDouble() * 30 + 10,
        ),
      );
    });
  }
}
