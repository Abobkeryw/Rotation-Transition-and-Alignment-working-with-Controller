import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<AlignmentGeometry> alignmentController;
  late Animation<double> rotateController;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    alignmentController = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(controller);

    rotateController = Tween<double>(begin: 0.0, end: 2.0).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlignTransition(
            alignment: alignmentController,
            child: RotationTransition(
              turns: rotateController,
              child: Container(width: 100, height: 100, color: Colors.blue
              , child: Icon(
                Icons.android,
                color: Colors.white,
                size: 50,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
