import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    'https://nsfw-images-detection-and-classification.p.rapidapi.com/adult-content';

final headers = {
  'content-type': 'application/json',
  'X-RapidAPI-Key': '01fa6ca6camsh851d76c05919905p183fbejsn5a304e0e4348',
  'X-RapidAPI-Host': 'nsfw-images-detection-and-classification.p.rapidapi.com'
};

class NudityDetection extends StatefulWidget {
  const NudityDetection({super.key});

  @override
  State<NudityDetection> createState() => _NudityDetectionState();
}

class _NudityDetectionState extends State<NudityDetection> {
  bool _isNudity = false;
  String imageUrl = "";

  void _detectNudity() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode({"url": imageUrl}),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        _isNudity = responseBody['unsafe'];
      });
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nudity Detection"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  imageUrl = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter image URL',
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _detectNudity,
                child: const Text('Check'),
              ),
              const SizedBox(height: 20.0),
              imageUrl.isEmpty
                  ? const Text('Enter an image URL')
                  : Image(
                      width: 200,
                      image: NetworkImage(imageUrl),
                    ),
              _isNudity
                  ? const Text("Nudity Detected!")
                  : const Text(
                      "No Nudity Detected.",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
