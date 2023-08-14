import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://pokeapi.co/api/v2/pokemon/';

  @Named('PrettyDioLogger')
  PrettyDioLogger prettyDioLogger() => PrettyDioLogger();

  @singleton
  Dio provideDio(@Named('BaseUrl') String baseUrl,
          @Named('PrettyDioLogger') PrettyDioLogger prettyDioLogger) =>
      Dio(BaseOptions(baseUrl: baseUrl));
}
