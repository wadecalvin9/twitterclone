import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Messaging': ParameterData.none(),
  'edit_profile': (data) async => ParameterData(
        allParams: {
          'showBack': getParameter<bool>(data, 'showBack'),
        },
      ),
  'Profile': ParameterData.none(),
  'chat': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'users_screen': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'settings': ParameterData.none(),
  'Myprofile': ParameterData.none(),
  'otherprofilePage': (data) async => ParameterData(
        allParams: {
          'userdata': getParameter<DocumentReference>(data, 'userdata'),
          'charref': getParameter<DocumentReference>(data, 'charref'),
        },
      ),
  'search': ParameterData.none(),
  'followerslitotheruser': (data) async => ParameterData(
        allParams: {
          'userref': getParameter<DocumentReference>(data, 'userref'),
        },
      ),
  'FollowingListotheruser': (data) async => ParameterData(
        allParams: {
          'userref': getParameter<DocumentReference>(data, 'userref'),
        },
      ),
  'FollowingListAuthUser': (data) async => ParameterData(
        allParams: {
          'userref': getParameter<DocumentReference>(data, 'userref'),
        },
      ),
  'followerlistFromauth': (data) async => ParameterData(
        allParams: {
          'userref': getParameter<DocumentReference>(data, 'userref'),
        },
      ),
  'feed': ParameterData.none(),
  'NewPost': ParameterData.none(),
  'chatCopy': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'Auth3': ParameterData.none(),
  'Flow': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
