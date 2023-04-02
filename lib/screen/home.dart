import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'image_checker.dart';
import 'text_check.dart';

class Choosing extends StatelessWidget {
  const Choosing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello!"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NudityDetection()),
                  );
                },
                child: const Text('Nudity Check'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WordChecker()),
                  );
                },
                child: const Text('Profanity Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
