import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvParams {
  EnvParams._();

  static String apiKey = dotenv.get('API_KEY');
  static String token = dotenv.get('TOKEN');
}
