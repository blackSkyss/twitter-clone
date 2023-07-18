// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationRepositoryHash() =>
    r'cc6914769d98f8dd082f68ad9869bae210bb56fa';

/// See also [notificationRepository].
@ProviderFor(notificationRepository)
final notificationRepositoryProvider =
    Provider<NotificationRepository>.internal(
  notificationRepository,
  name: r'notificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationRepositoryRef = ProviderRef<NotificationRepository>;
String _$getLastestNotificationHash() =>
    r'9dd8ea9483f177aecf2ac6d4a4df150982410b0e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetLastestNotificationRef
    = AutoDisposeStreamProviderRef<List<Notification>>;

/// See also [getLastestNotification].
@ProviderFor(getLastestNotification)
const getLastestNotificationProvider = GetLastestNotificationFamily();

/// See also [getLastestNotification].
class GetLastestNotificationFamily
    extends Family<AsyncValue<List<Notification>>> {
  /// See also [getLastestNotification].
  const GetLastestNotificationFamily();

  /// See also [getLastestNotification].
  GetLastestNotificationProvider call(
    String uid,
  ) {
    return GetLastestNotificationProvider(
      uid,
    );
  }

  @override
  GetLastestNotificationProvider getProviderOverride(
    covariant GetLastestNotificationProvider provider,
  ) {
    return call(
      provider.uid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getLastestNotificationProvider';
}

/// See also [getLastestNotification].
class GetLastestNotificationProvider
    extends AutoDisposeStreamProvider<List<Notification>> {
  /// See also [getLastestNotification].
  GetLastestNotificationProvider(
    this.uid,
  ) : super.internal(
          (ref) => getLastestNotification(
            ref,
            uid,
          ),
          from: getLastestNotificationProvider,
          name: r'getLastestNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLastestNotificationHash,
          dependencies: GetLastestNotificationFamily._dependencies,
          allTransitiveDependencies:
              GetLastestNotificationFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is GetLastestNotificationProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
