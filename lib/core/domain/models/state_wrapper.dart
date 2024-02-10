import 'package:dakwrite/core/domain/models/error_dto.dart';

class StateWrapper<T> {
  final bool isLoading;
  final T? data;
  final ErrorDto? error;

  const StateWrapper({
    required this.isLoading,
    this.data,
    this.error,
  });

  @override
  String toString() {
    return 'StateWrapper{isLoading: $isLoading, data: $data, error: $error}';
  }

  StateWrapper<T> copyWith({
    bool? isLoading,
    T? data,
    ErrorDto? error,
  }) {
    return StateWrapper(
      isLoading: isLoading ?? this.isLoading,
      data: data,
      error: error,
    );
  }
}
