import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fitnesstracker/common/color_extension.dart';
// import 'package:fitnesstracker/common_widget/round_button.dart';
// import 'package:fitnesstracker/common_widget/textfield.dart';
import 'package:get_storage/get_storage.dart';


class AddAnggotaView extends StatefulWidget {
  const AddAnggotaView({super.key});
  

  @override
  State<AddAnggotaView> createState()  => _AddAnggotaViewState();
}



class _AddAnggotaViewState extends State<AddAnggotaView> {

  final TextEditingController nomorIndukController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();

  final apiUrl = 'https://mobileapis.manpits.xyz/api';
  final dio = Dio();
  final storage = GetStorage();

  void addMember(BuildContext context) async {
    try {
      final response = await dio.post(
        "$apiUrl/anggota",
        data: {
          "nomor_induk": nomorIndukController.text,
          "nama": namaController.text,
          "alamat": alamatController.text,
          "tgl_lahir": tglLahirController.text,
          "telepon": teleponController.text,
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${storage.read('token')}'},
        ),
      );
      print(response.data);
      if (response.data['success'] == true) {
        Navigator.pushReplacementNamed(context, '/mainTab');
      }
    } on DioException catch (error) {
      print('Error occurred: ${error.response}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Member',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: nomorIndukController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Nomor Induk',
                    labelStyle: TextStyle(
                      color: TColor.gray,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Nama',
                    labelStyle: TextStyle(
                      color: TColor.gray,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Alamat',
                    labelStyle: TextStyle(
                      color: TColor.gray,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: tglLahirController,
                  decoration: InputDecoration(
                    hintText: '2000-03-31',
                    labelText: 'Masukan Tanggal Lahir',
                    labelStyle: TextStyle(
                      color: TColor.gray,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: teleponController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Telepon',
                    labelStyle: TextStyle(
                      color: TColor.gray,
                      fontWeight: FontWeight.w300,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: TColor.gray),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    addMember(context);
                  },
                  style: ElevatedButton.styleFrom(
                    surfaceTintColor: TColor.secondaryColor2,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Add Member',
                    style: TextStyle(color: TColor.secondaryColor2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
