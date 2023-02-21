import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_pro/view/home_screen.dart';
import 'package:test_app_pro/view_model/sub_view_model.dart';

class SubScreen extends StatelessWidget {
  const SubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubScreen"),
      ),
      floatingActionButton:
          FloatingActionButton(child: Text("Home"), onPressed: () => moveHomeScreen(context)),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<SubViewModel, int>(
              selector: (context, viewModel) => viewModel.count,
              builder: (context, count, child) {
                return Text(
                  count.toString(),
                  style: TextStyle(fontSize: 50.0),
                );
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
      )),
    );
  }

  moveHomeScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  addOne(BuildContext context) {
    final subViewModel = context.read<SubViewModel>();
    subViewModel.addOne();
  }

  clear(BuildContext context) {
    final subViewModel = context.read<SubViewModel>();
    subViewModel.clear();
  }
}
