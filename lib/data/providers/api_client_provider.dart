import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/api_client.dart';
import 'app_flavor_provider.dart';

part 'api_client_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) => ApiClient(ref.read(dioProvider),
    baseUrl: ref.read(appFlavorProvider).apiConfig.apiUrl);

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  return dio;
}
