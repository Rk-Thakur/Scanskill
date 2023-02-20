enum RequestStatus { initial, progress, fetchingMore, success, failure }

class StateModel {
  final RequestStatus requestStatus;
  final dynamic data;
  final String message;

  StateModel({required this.requestStatus, this.data, required this.message});
  StateModel copyWith({
    RequestStatus? requestStatus,
    dynamic? data,
    String? message,
  }) =>
      StateModel(
        requestStatus: requestStatus ?? this.requestStatus,
        data: data ?? this.data,
        message: message ?? this.message,
      );
}
