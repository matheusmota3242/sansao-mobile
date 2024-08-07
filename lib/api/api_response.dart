class ApiResponse<T> {
  T? body;
  bool hasError = false;
  String? error;
}
