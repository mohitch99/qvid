import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvid/models/user.dart';
import 'package:qvid/screens/authenticate.dart';
import 'package:qvid/screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<CustomUser>(context);
    final user = context.watch<CustomUser?>();
    // return Home();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
