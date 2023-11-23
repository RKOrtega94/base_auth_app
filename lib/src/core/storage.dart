import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Create storage
const storage = FlutterSecureStorage();

// Clear storage
clearStorage() async {
  await storage.deleteAll();
}

// Get value from storage
Future<String> getValue(String key) async {
  return await storage.read(key: key) ?? '';
}

// Set value in storage
setValue(String key, String value) async {
  await storage.write(key: key, value: value);
}

// Remove value from storage
removeValue(String key) async {
  await storage.delete(key: key);
}
