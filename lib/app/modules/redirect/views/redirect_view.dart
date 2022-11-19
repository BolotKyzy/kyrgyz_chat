import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/redirect_controller.dart';

class RedirectView extends GetView<RedirectController> {
  const RedirectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RedirectView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RedirectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
