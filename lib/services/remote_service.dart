import 'package:api_project/models/performance.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Performance>?> getPerformance() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return performanceFromJson(json);
    }
  }
}
