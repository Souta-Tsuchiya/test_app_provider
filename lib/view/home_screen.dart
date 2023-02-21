import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_pro/view/sub_screen.dart';
import 'package:test_app_pro/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      floatingActionButton:
          FloatingActionButton(child: Text("ToSub"), onPressed: () => moveSubScreen(context)),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<HomeViewModel, int>(
                selector: (context, viewModel) => viewModel.count,
                builder: (context, count, child) {
                  return Text(count.toString(), style: TextStyle(fontSize: 50.0),);
                },
              ),
              ElevatedButton(
                child: Text("＋1"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () => addOne(context),
              ),
              ElevatedButton(
                  onPressed: () => clear(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(
                    "クリアー",
                    style: TextStyle(fontSize: 20.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  moveSubScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SubScreen()));
  }

  addOne(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.addOne();
  }

  clear(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.clear();
  }
}
