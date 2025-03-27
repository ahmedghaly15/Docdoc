import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// Custom logger instance with pretty output.
final Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // Hide method calls in logs
    colors: true, // Enable colors
    printEmojis: true, // Enable emojis
  ),
);

/// Observes Riverpod providers and logs their lifecycle.
class AppProviderObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger.i('✅ Provider Added: ${_getProviderName(provider)} → $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logger.w('❌ Provider Disposed: ${_getProviderName(provider)}');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.d(
      '🔄 Provider Updated: ${_getProviderName(provider)} → $newValue (was $previousValue)',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _logger.e(
      '❗ Provider Error: ${_getProviderName(provider)} → $error',
      stackTrace: stackTrace,
    );
  }

  /// Gets a human-readable provider name.
  String _getProviderName(ProviderBase<Object?> provider) {
    return provider.name ?? provider.runtimeType.toString();
  }
}
