import 'package:flutter_dotenv/flutter_dotenv.dart';



class Environment {

  static String apiUrl = 'https://rca.azurewebsites.net/api/v1' ?? 'No está configurado el API_URL';

}
