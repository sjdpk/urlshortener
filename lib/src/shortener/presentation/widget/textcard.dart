import 'package:flutter/material.dart';

Container textCard({required String title, required String data}) {
  return Container(
    padding: const EdgeInsets.all(16),
    // Textspan
    child: RichText(
      text: TextSpan(
        text: '$title: ',
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(
            text: data,
            style: const TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
