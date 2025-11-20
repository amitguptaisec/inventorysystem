import 'api_const.dart';
import 'apiclient.dart';
import 'dio_client.dart';

enum ApiClientType { dio, http }

class ApiBuilder {
  ApiClient apiClient({
    ApiClientType? apiClientType = ApiClientType.dio,
    String? baseUrl = ApiConst.domain,
  }) {
    if (apiClientType == ApiClientType.dio) {
      return DioClient.defaultClient(baseUrl: baseUrl);
    }
    return DioClient.defaultClient(baseUrl: baseUrl);
  }
}
