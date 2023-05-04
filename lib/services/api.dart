import 'package:dio/dio.dart';

abstract class API {
  Future<Response<T>> httpGet<T>(
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
    ResponseType? responseType,
  });

  Future<Response<dynamic>> httpPost(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  });

  Future<Response<dynamic>> httpPut(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  });

  Future<Response<dynamic>> httpPatch(
    dynamic data,
    String url, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  });

  Future<Response<T>> httpGetWithParams<T>(
    String url,
    Map<String, dynamic> params, {
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
    ResponseType? responseType,
  });

  Future<Response<T>> httpDelete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? overrideHeaders,
    Map<String, dynamic> additionalHeaders = const {},
  });
}
