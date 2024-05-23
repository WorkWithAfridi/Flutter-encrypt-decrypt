import 'package:flutter/material.dart';

import '../../core/services/encryption_service.dart';

class DecryptView extends StatefulWidget {
  const DecryptView({super.key});

  @override
  _DecryptViewState createState() => _DecryptViewState();
}

class _DecryptViewState extends State<DecryptView> {
  final TextEditingController _controller = TextEditingController();
  String _decryptedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decrypt Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text to decrypt',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _decryptedText = EncryptionService().decryptData(_controller.text);
                });
              },
              child: const Text('Decrypt'),
            ),
            const SizedBox(height: 16),
            if (_decryptedText.isNotEmpty)
              SelectableText(
                _decryptedText,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
