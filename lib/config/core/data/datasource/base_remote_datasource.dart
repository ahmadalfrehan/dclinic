import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../Debug/out.dart';
import '../../../error/error_handler.dart';
import '../../../error/exception.dart';
import '../../domain/Repository/base-repository.dart';

class GetOptions {
  static getOptions(String token) {

  }
}

class BaseRemoteDataSourceImpl extends BaseRepository {
  final Dio dio;



  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<bool> performDeleteRequest(String endpoint,
      {String token = ''}) async {
    try {
      final response = await dio.delete(endpoint,
          options: await GetOptions.getOptions(token));
      log(response);
      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        return true;
      } else {
        log('error');
        return false;
      }
    } catch (error) {
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, "notFound");
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }

  @override
  Future<List<T>> performGetListRequest<T>(String endpoint,
      T Function(Map<String, dynamic> p1) fromJson,
      {String token = '',
        String? listName,
        Map<String, dynamic>? params,
        int? number}) async {
    try {
      log(GetOptions.getOptions(token));
      final response = await dio.get(endpoint,
          options: await GetOptions.getOptions(token), queryParameters: params);
      log(response);

      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        final List<T> list = [];
        final List data;
        if (listName != null) {
          data = json.decode(response.data)["data"][listName] as List;
        } else {
          if (number == 2) {
            data = json.decode(response.data)["data"][0] as List;
          } else {
            data = json.decode(response.data)["data"] as List;
          }
        }
        for (var element in data) {
          if (element == null) {
            continue;
          }
          list.add(fromJson(element));
        }
        return list;
      } else {
        log('error');
        throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
      }
    } catch (error) {
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        log(error.response?.statusCode);
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, 'not found');
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }

  @override
  Future<T> performGetRequest<T>(String endpoint,
      T Function(Map<String, dynamic> p1) fromJson, {
        String token = '',
        Map<String, dynamic>? params,
      }) async {
    try {
      final response = await dio.get(endpoint,
          options: await GetOptions.getOptions(token), queryParameters: params);
      log(response);
      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        Map<dynamic, dynamic> data1 =
        Map<dynamic, dynamic>.from(json.decode(response.data));
        final baseRes = fromJson(data1["data"]);
        log(baseRes);
        if (baseRes != null) {
          return baseRes;
        } else {
          log('error');
          throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
        }
      }
      log('error');
      throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
    } catch (error) {
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, "notFound");
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }

  @override
  Future<T> performPatchRequest<T>(String endpoint,
      T Function(Map<String, dynamic> p1) fromJson, FormData? data,
      {String token = ''}) {
    // TODO: implement performPatchRequest
    throw UnimplementedError();
  }

  @override
  Future<T> performPatchRequestJSON<T>(String endpoint,
      T Function(Map<String, dynamic> p1) fromJson, Map<String, dynamic> data,
      {String token = ''}) {
    // TODO: implement performPatchRequestJSON
    throw UnimplementedError();
  }

  @override
  Future<T> performPostRequest<T>(String endpoint, Map<String, dynamic> data,
      T Function(Map<String, dynamic> p1) fromJson,
      {String token = '', bool? lsLog, bool ? isEmptyAllow}) async {
    try {
      final response = await dio.post(endpoint,
          data: data, options: await GetOptions.getOptions(token));
      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        T baseRes;
        if (lsLog == true) {
          Map<dynamic, dynamic> userdata =
          Map<dynamic, dynamic>.from(json.decode(response.data));
          baseRes = fromJson(userdata['data']);
          if (baseRes != null) {
            return baseRes;
          } else {
            log('error');
            throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
          }
        } else {
          baseRes = fromJson(json.decode(response.data));
          log('baseRes');
          log(baseRes.toString());
          if (baseRes != null) {
            return baseRes;
          }
          else if (isEmptyAllow == true) {
            T v = true as T;
            return v;
          }
          else {
            log('error');
            throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
          }
        }
      }
      log('error');
      throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
    } catch (error) {
      log('error');
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, "notFound");
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }

  ///this is performPostRequestWithFormData Implementation
  @override
  Future<T> performPostRequestWithFormData<T>(String endpoint, FormData data,
      T Function(Map<String, dynamic> p1) fromJson,
      {String token = '', bool? lsLog}) async {
    {
      try {
        final response = await dio.post(endpoint,
            data: data, options: await GetOptions.getOptions(token));
        log(response);
        if (ErrorHandler.handleRemoteError(
            response.statusCode!.toInt(), response.data)) {
          T baseRes;
          if (lsLog == true) {
            Map<dynamic, dynamic> userdata =
            Map<dynamic, dynamic>.from(json.decode(response.data));
            log(userdata);
            log(userdata['data']);
            baseRes = fromJson(userdata['data']);
            log(baseRes);
            if (baseRes != null) {
              return baseRes;
            } else {
              log('error');
              throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
            }
          } else {
            final baseRes = fromJson(json.decode(response.data));
            log(baseRes);
            if (baseRes != null) {
              return baseRes;
            } else {
              log('error');
              throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
            }
          }
        }
        log('error');
        throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
      } catch (error) {
        log(error);
        if (error is RemoteException) rethrow;
        if (error is DioError) {
          ErrorHandler.handleRemoteError(
              error.response?.statusCode ?? 404, "notFound");
          rethrow;
        } else {
          throw RemoteException(ErrorCode2.SERVER_ERROR, '');
        }
      }
    }
  }

  @override
  Future<T> performPutRequest<T>(String endpoint,
      T Function(Map<String, dynamic> p1) fromJson, data,
      {String token = ''}) async {
    try {
      final response = await dio.put(endpoint,
          data: data, options: await GetOptions.getOptions(token));
      log(response);
      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        final baseRes = fromJson(json.decode(response.data['message']));
        log(baseRes);
        if (baseRes != null) {
          return baseRes;
        } else {
          log('error');
          throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
        }
      }
      log('error');
      throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
    } catch (error) {
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, "notFound");
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }

  @override
  Future<T> performSimpleGetRequest<T>(String endpoint,
      {T Function(Map<String, dynamic> p1)? fromJson,
        String token = '',
        Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint,
          options: await GetOptions.getOptions(token), queryParameters: params);
      log(response);
      if (ErrorHandler.handleRemoteError(
          response.statusCode!.toInt(), response.data)) {
        Map<dynamic, dynamic> userData =
        Map<dynamic, dynamic>.from(json.decode(response.data));
        final baseRes = userData['data'];
        log(baseRes);
        if (baseRes != null) {
          return baseRes;
        } else {
          log('error');
          throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
        }
      }
      log('error');
      throw RemoteException(ErrorCode2.SERVER_ERROR, 'message');
    } catch (error) {
      log(error);
      if (error is RemoteException) rethrow;
      if (error is DioError) {
        ErrorHandler.handleRemoteError(
            error.response?.statusCode ?? 404, "notFound");
        rethrow;
      } else {
        throw RemoteException(ErrorCode2.SERVER_ERROR, '');
      }
    }
  }
}
