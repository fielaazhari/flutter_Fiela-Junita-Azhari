import 'package:dio_rest_api/models/user.dart';
import 'package:dio_rest_api/service/services.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                    final response = await MyService().fetchUser();
                    resultDio = response.toString();

                    List<dynamic> data = response['data'];
                    user = data
                        .map(
                          (e) => UserDio.fromJson(e),
                        )
                        .toList();
                    setState(() {});
                  },
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await MyService().createUser(
                      name: _nameController.text,
                      job: _jobController.text,
                    );
                    resultDio = response.toString();
                    setState(() {});
                  },
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await MyService().updateUser(
                      name: _nameController.text,
                      job: _jobController.text,
                    );
                    resultDio = response.toString();
                    setState(() {});
                  },
                  child: const Text('PUT'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await MyService().deleteUser();
                    resultDio = response.toString();
                    setState(() {});
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
              resultDio.toString(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Result Data (Future Builder)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<UserDio>>(
              future: MyService().fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 500,
                      width: 500,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        snapshot.data![index].avatar),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'ID : ${snapshot.data![index].id}'),
                                        Text(
                                            'Email : ${snapshot.data![index].email}'),
                                        Text(
                                            'Name : ${snapshot.data![index].first_name} ${snapshot.data![index].last_name}'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return const Text('Tidak ada data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
