import 'package:dio_rest_api/models/user_model.dart';
import 'package:dio_rest_api/pages/home/home_view_model.dart';
import 'package:dio_rest_api/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String resultDio = '';
  List<UserDio> user = [];

  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _jobController,
              decoration: const InputDecoration(
                labelText: 'Job',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Provider.of<HomeViewModel>(context, listen: false)
                        .getAllUsers();
                  },
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Provider.of<HomeViewModel>(context, listen: false)
                        .createUser(
                      _nameController.text,
                      _jobController.text,
                    );
                  },
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Provider.of<HomeViewModel>(context, listen: false)
                        .updateUser(
                      _nameController.text,
                      _jobController.text,
                    );
                  },
                  child: const Text('PUT'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Provider.of<HomeViewModel>(context, listen: false)
                        .deleteUser();
                  },
                  child: const Text('DELETE'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Result',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              modelView.result.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
