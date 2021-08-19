import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovelyrk/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Signin')),
        body: Center(
          child: Obx(() {
            if (controller.googleAccount.value == null)
              return buildLoginButton();
            else
              return buildProfileView();
          }),
          // child: buildLoginButton()
        ));
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(controller.googleAccount.value?.photoUrl ?? "")
                  .image,
          radius: 100,
        ),
        Text(controller.googleAccount.value?.displayName ?? "",
            style: Get.textTheme.headline4),
        Text(controller.googleAccount.value?.email ?? "",
            style: Get.textTheme.bodyText1),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Loogut"),
            onPressed: () {
              controller.logout();
            }),
        SizedBox(height: 16)
      ],
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
        onPressed: () {
          controller.login();
        },
        icon: Image.asset(
          'assets/google.png',
          height: 30,
          width: 30,
        ),
        label: Text('Sign in with Google'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black);
  }
}
