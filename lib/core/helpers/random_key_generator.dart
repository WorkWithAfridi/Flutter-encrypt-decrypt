import 'package:encrypt/encrypt.dart' as encrypt;

// Method to generate a random key
String generateRandomKey() {
  encrypt.Key? key = encrypt.Key.fromSecureRandom(32);
  return key.base64;
}
