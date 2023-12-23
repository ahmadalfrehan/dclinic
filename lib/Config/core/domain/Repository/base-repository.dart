import 'package:dio/dio.dart' as d;
import 'package:flutter/cupertino.dart';



abstract class BaseRepository {
  @protected
  Future<T> performPutRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    d.FormData? data, {
    String token = '',
  });

  @protected
  Future<T> performPatchRequestJSON<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic> data, {
    String token = '',
  });

  Future<T> performPostRequest<T>(
    String endpoint,
    Map<String, dynamic> data,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
  });

  Future<bool> performDeleteRequest(
    String endpoint, {
    String token = '',
  });

  Future<T> performPostRequestWithFormData<T>(
    String endpoint,
    d.FormData data,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
  });

  @protected
  Future<List<T>> performGetListRequest<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson,
      {String token = '',
      String? listName,
      Map<String, dynamic>? params,
      int? number});

  @protected
  Future<T> performGetRequest<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    String token = '',
    Map<String, dynamic>? params,
  });

  @protected
  Future<T> performSimpleGetRequest<T>(
    String endpoint, {
    T Function(Map<String, dynamic>)? fromJson,
    String token = '',
    Map<String, dynamic>? params,
  });
}
