import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvParams {
  EnvParams._();

  static String apiKey = dotenv.get('X_RapidAPI_Key');
  static String apiHost = dotenv.get('X_RapidAPI_Host');
}
