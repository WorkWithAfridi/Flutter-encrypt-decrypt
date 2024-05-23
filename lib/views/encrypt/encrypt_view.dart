import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/services/encryption_service.dart';

class EncryptView extends StatefulWidget {
  const EncryptView({super.key});

  @override
  _EncryptViewState createState() => _EncryptViewState();
}

class _EncryptViewState extends State<EncryptView> {
  final TextEditingController _controller = TextEditingController();
  String _encryptedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encrypt Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter text to encrypt',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _encryptedText = EncryptionService().encryptData(_controller.text);
                });
              },
              child: const Text('Encrypt'),
            ),
            const SizedBox(height: 16),
            if (_encryptedText.isNotEmpty) ...[
              SelectableText(
                _encryptedText,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _encryptedText));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard')),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
