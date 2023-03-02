import 'package:equatable/equatable.dart';

class NetworkConnection extends Equatable {
  bool isConnected;
  bool isNavigated;
  NetworkConnection({
    required this.isConnected,
    required this.isNavigated,
  });

  NetworkConnection copyWith({
    bool? isConnected,
    bool? isNavigated,
  }) {
    return NetworkConnection(
      isConnected: isConnected ?? this.isConnected,
      isNavigated: isNavigated ?? this.isNavigated,
    );
  }

  @override
  List<Object?> get props => [isConnected, isNavigated];
}
