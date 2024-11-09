
import 'package:dio/dio.dart';

@Deprecated('Use [ApiRes]')
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

extension DataStateWhen<T, G> on DataState<T> {
  G when<G>({
    required G Function(T? data) success,
    required G Function(DioException? exception) failure,
  }) {
    if (this is DataSuccess<T>) {
      return success(data);
    } else if (this is DataFailed<T>) {
      return failure(error);
    } else {
      throw Exception('Invalid state');
    }
  }
}