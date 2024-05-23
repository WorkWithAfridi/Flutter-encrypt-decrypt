import 'package:flutter/material.dart';
import 'package:flutter_encrypt_decrypt/core/helpers/random_key_generator.dart';
import 'package:flutter_encrypt_decrypt/views/encrypt/encrypt_view.dart';
import 'package:flutter_encrypt_decrypt/views/home/encrypt_decrypt_view.dart';

import 'core/services/encryption_service.dart';
import 'views/decrypt/decrypt_view.dart';

void main() {
  // Initialize the EncryptionService with a random key
  final encryptionService = EncryptionService();
  encryptionService.init(generateRandomKey());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Encryption Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EncryptDecryptView(),
      routes: {
        '/encrypt': (context) => const EncryptView(),
        '/decrypt': (context) => const DecryptView(),
      },
    );
  }
}
