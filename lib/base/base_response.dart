class BaseResponse<T> {
  BaseResponse({required this.errorCode, required this.message, this.data});

  int errorCode = -1;
  String message;
  T? data;

}
