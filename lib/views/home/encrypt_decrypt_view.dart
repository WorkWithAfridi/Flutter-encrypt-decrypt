import 'package:flutter/material.dart';
import 'package:flutter_encrypt_decrypt/core/services/encryption_service.dart';
import 'package:gap/gap.dart';

class EncryptDecryptView extends StatelessWidget {
  const EncryptDecryptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Encryption Demo'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "YOUR SECRET KEY IS: \n${EncryptionService().secretKeyInBase64}",
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/encrypt');
              },
              child: const Text('Encrypt Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/decrypt');
              },
              child: const Text('Decrypt Data'),
            ),
          ],
        ),
      ),
    );
  }
}
