import 'package:flutter/material.dart';
import 'package:flutter_testing/pages/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<HomeViewModel>(context, listen: false).getFoods();
      },
    );
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<HomeViewModel>(context, listen: false).getFoods();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finite State Machine'),
      ),
      body: body(modelView),
    );
  }

  Widget body(HomeViewModel modelView) {
    final isLoading = modelView.state == HomeViewState.loading;
    final isError = modelView.state == HomeViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Gagal menambil data'),
      );
    }

    return listView(modelView);
  }

  Widget listView(HomeViewModel modelView) {
    return ListView.builder(
      itemCount: modelView.foods.length,
      itemBuilder: (context, index) {
        final foods = modelView.foods[index];
        return ListTile(
          title: Text(foods.id!.toString()),
          subtitle: Text(foods.name!),
        );
      },
    );
  }
}
