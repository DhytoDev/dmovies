sealed class UiState<T> {}

class InitialState<T> extends UiState<T> {}

class LoadingState<T> extends UiState<T> {}

class SuccessState<T> extends UiState<T> {
  final T data;

  SuccessState(this.data);

  SuccessState copyWith({T? data}) => SuccessState(data ?? this.data);
}

class ErrorState<T> implements UiState<T> {
  final String? message;

  ErrorState(this.message);
}
