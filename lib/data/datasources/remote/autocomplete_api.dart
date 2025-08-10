import 'package:dio/dio.dart';
import '../../models/autocomplete/autocomplete_response_dto.dart';

class AutocompleteApi {
  final Dio _dio;

  AutocompleteApi(this._dio);

  Future<AutocompleteResponseDto> fetch({
    required String query,
  }) async {
    final res = await _dio.get(
      '/api/search',
      queryParameters: {'name': query},
    );
    return AutocompleteResponseDto.fromJson(res.data as Map<String, dynamic>);
  }
}
