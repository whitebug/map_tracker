/// Provides the error [message] that occurs while navigating
class CoordinatorExceptions implements Exception {
  /// Exception explanation
  final String message;

  /// Create an instance [CoordinatorExceptions].
  CoordinatorExceptions(this.message);

  @override
  String toString() => 'CoordinatorExceptions(message: $message)';
}
