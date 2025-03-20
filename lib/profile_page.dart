import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController namaController = TextEditingController();
  final key = GlobalKey<FormState>();
  List<String> daftarNama = [];

  void addData(){
    setState(() {
      daftarNama.add(namaController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            Row(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/2.jpg'),
                ),
                Text('Bala Bala'),
              ],
            ),
            Form(
              key: key,
              child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: namaController,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return 'Nama masih kosong!';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                    label: Text('Nama Pendaftar'),
                    hintText: 'Masukkan nama lengkap pendaftar',
                  ),
                ),
                ),
                OutlinedButton(onPressed: (){
                  if(key.currentState!.validate()) {
                    addData();
                  }
                }, child: Text('Submit')),
              ],
            ),
            ),
            Expanded(child: 
            ListView.builder(
              itemCount: daftarNama.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [Text(daftarNama[index])]),
                );
              },
            ))
          ],
        ),
        ),
      ),
    );
  }
}