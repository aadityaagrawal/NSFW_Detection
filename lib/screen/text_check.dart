import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

class WordChecker extends StatefulWidget {
  const WordChecker({super.key});

  @override
  State<WordChecker> createState() => _WordCheckerState();
}

class _WordCheckerState extends State<WordChecker> {
  bool _containsBadWords = false;

  void _onTextChanged(String value) {
    final profanityFilter = ProfanityFilter();
    final containsBadWords = profanityFilter.hasProfanity(value);

    setState(() {
      _containsBadWords = containsBadWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profanity Filter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profanity Filter App'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: _onTextChanged,
                decoration: InputDecoration(
                  labelText: 'Type your text here',
                  errorText: _containsBadWords ? 'Contains bad words' : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
