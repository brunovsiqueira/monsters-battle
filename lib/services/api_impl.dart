import 'package:dio/dio.dart';

import 'api.dart';
import 'package:collection/collection.dart';

class APIImpl implements API {
  final Dio dio;

  final Map<String, Future<String?> Function()> headersBuilders;

  APIImpl({
    required this.headersBuilders,
    required this.dio,
  });

  Future<Map<String, dynamic>> getHeaders() async {
    Map<String, dynamic> headers = {};

    for (var entry in headersBuilders.entries) {
      var value = await entry.value();

      if (value != null) {
        headers[entry.key] = value;
      }
    }

    return headers;
  }

  @override
  Future<Response<dynamic>> httpPost(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    //TODO: add network connection check to all methods

    final response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: mergeMaps(headers, additionalHeaders),
      ),
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpPut(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    final response = await dio.put(
      url,
      data: data,
      options: Options(headers: mergeMaps(headers, additionalHeaders)),
    );

    return response;
  }

  @override
  Future<Response<dynamic>> httpPatch(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    final response = await dio.patch(
      url,
      data: data,
      options: Options(
        headers: mergeMaps(headers, additionalHeaders),
      ),
    );

    return response;
  }

  @override
  Future<Response<T>> httpGet<T>(
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
    ResponseType? responseType,
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    final response = await dio.get<T>(
      url,
      options: Options(
        headers: mergeMaps(headers, additionalHeaders),
        responseType: responseType,
      ),
    );

    return response;
  }

  @override
  Future<Response<T>> httpGetWithParams<T>(
    String url,
    Map<String, dynamic> params, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
    ResponseType? responseType,
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    final response = await dio.get<T>(
      url,
      options: Options(
        headers: mergeMaps(headers, additionalHeaders),
        responseType: responseType,
      ),
      queryParameters: params,
    );

    return response;
  }

  @override
  Future<Response<T>> httpDelete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  }) async {
    assert(
      overrideHeaders == null || additionalHeaders.entries.isEmpty,
      'cannot have both overrideHeaders and additionalHeaders',
    );

    Map<String, dynamic> headers = overrideHeaders ?? await getHeaders();

    final response = await dio.delete<T>(
      url,
      data: data,
      options: Options(headers: mergeMaps(headers, additionalHeaders)),
    );

    return response;
  }
}
