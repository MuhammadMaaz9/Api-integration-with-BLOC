import 'package:apibloc/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future getdata() async {
    var url = Uri.parse(
        'https://fluttertest.q3logics.com/api/getCities?device_id=aa1b0a9bab56fab2&token=a04c7e22085ecb0838fe4cc9b985b9a4&lang_id=1&country_id=189');
    var response = await http.get(url);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('response : ${response.body}');
      return welcomeFromJson(response.body);
    }
  }
}