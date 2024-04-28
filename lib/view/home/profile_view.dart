import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fitnesstracker/common/color_extension.dart';
import 'package:fitnesstracker/common_widget/round_button.dart';
import 'package:fitnesstracker/common_widget/textfield.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  

  @override
  State<ProfileView> createState()  => _ProfileViewState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final apiUrl = 'https://mobileapis.manpits.xyz/api';
  final dio = Dio();
  final storage = GetStorage();
  TextEditingController? nameController;
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      Response response = await dio.get(
        "$apiUrl/user",
        options: Options(
          headers: {'Authorization': 'Bearer ${storage.read('token')}'},
        ),
      );

      print('Response: $response');

      if (response.data['success'] == true) {
        Map<String, dynamic> data = response.data;
        setState(() {
          nameController = TextEditingController(text: data['data']['user']['name']);
          emailController = TextEditingController(text: data['data']['user']['email']);
        });
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: nameController == null || emailController == null
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(TColor.primaryColor1),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(25, 33, 25, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: TColor.primaryColor1,
                          ),
                        ),
                      ),
                      RoundTextField(
                        hintText: 'Name',
                        icon: 'assets/img/profile_tab.png',
                        // controller: nameController,
                      ),
                      RoundTextField(
                        hintText: 'Email',
                        icon: 'assets/img/email.png',
                        // controller: emailController,
                      ),
                      SizedBox(height: 70),
                      RoundButton(
                        title: 'Log Out',
                        type: RoundButtonType.bgGradient,
                        onPressed: () {
                          logout(context);
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

void logout(context) async {
  final dio = Dio();
  final apiUrl = 'https://mobileapis.manpits.xyz/api';
  final storage = GetStorage();
  try {
    final response = await dio.get(
      "$apiUrl/logout",
      options: Options(
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      ),
    );
    print(response.data);
    storage.remove('token');
    print(storage.read('token'));

    if (response.data['success'] == true) {
      Navigator.pushNamed(
        context,
        '/login',
      );
    }
  } on DioException catch (e) {
        print(" Error ${e.response?.statusCode} - ${e.response?.data} ");
  }
}
