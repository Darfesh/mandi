import 'package:mandi/core/models/app_error.dart';
import 'package:openpanel_flutter/openpanel_flutter.dart';

class AnalyticsService {
  bool _initialized = false;

  bool get isInitialized => _initialized;

  void initialize() {
    _initialized = true;
  }

  void identifyUser({
    required String userId,
    String? email,
    String? name,
  }) {
    if (!_initialized) return;
    Openpanel.instance.setProfileId(userId);
    Openpanel.instance.setGlobalProperties({
      if (email != null) 'email': email,
      if (name != null) 'name': name,
    });
  }

  void trackEvent(String name, {Map<String, dynamic> properties = const {}}) {
    if (!_initialized) return;
    Openpanel.instance.event(name: name, properties: properties);
  }

  void trackException(
    AppError error,
  ) {
    if (!_initialized) return;
    Openpanel.instance.event(name: 'exception', properties: {
      'type': error.type.name,
      'message': error.message,
      if (error.technicalDetails != null) 'details': error.technicalDetails,
      if (error.statusCode != null) 'status_code': error.statusCode,
      if (error.userId != null) 'user_id': error.userId,
    });
  }

  void trackPageView(String pageName, {Map<String, dynamic> properties = const {}}) {
    if (!_initialized) return;
    Openpanel.instance.event(name: 'pageview', properties: {
      'page': pageName,
      ...properties,
    });
  }

  void clear() {
    if (!_initialized) return;
    Openpanel.instance.clear();
  }
}
