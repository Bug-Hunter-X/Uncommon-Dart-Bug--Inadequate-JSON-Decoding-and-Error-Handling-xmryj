```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        // Robust JSON decoding using jsonDecode and type checking
        final jsonData = jsonDecode(response.body);
        if (jsonData is Map<String, dynamic>) {
          return jsonData;
        } else {
          throw Exception('Invalid JSON format: Expected a map.');
        }
      } catch (e) {
        print('JSON decoding error: $e');
        return null; // Or handle the error as needed
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null; // Or handle the error as needed
  }
}
```