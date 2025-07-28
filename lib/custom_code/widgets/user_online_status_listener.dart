// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOnlineStatusListener extends StatefulWidget {
  const UserOnlineStatusListener({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _UserOnlineStatusListenerState createState() =>
      _UserOnlineStatusListenerState();
}

class _UserOnlineStatusListenerState extends State<UserOnlineStatusListener>
    with WidgetsBindingObserver {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DocumentReference? userRef;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updateUserStatus(true); // Set user online when widget initializes
  }

  void _updateUserStatus(bool isOnline) async {
    final user = _auth.currentUser;
    if (user != null) {
      userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

      await userRef!.set({'isOnline': isOnline}, SetOptions(merge: true));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _updateUserStatus(true); // Online when app is in foreground
    } else {
      _updateUserStatus(false); // Offline when app is closed or backgrounded
    }
  }

  @override
  void dispose() {
    _updateUserStatus(false); // Ensure user goes offline when widget is removed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 0,
      height: widget.height ?? 0,
    );
  }
}
