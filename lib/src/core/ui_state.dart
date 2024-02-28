sealed class UiState<T> {
  final T? data;

  UiState([this.data]);

}

class InitialState<T> extends UiState<T> {}

class LoadingState<T> extends UiState<T> {}

class SuccessState<T> extends UiState<T> {
  SuccessState(T super.data);
}

class ErrorState<T> extends UiState<T> {
  final String? message;

  ErrorState(this.message, [super.data]);
}
