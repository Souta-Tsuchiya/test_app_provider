import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_app_pro/model/shared_prefs_repo.dart';
import 'package:test_app_pro/view_model/home_view_model.dart';
import 'package:test_app_pro/view_model/sub_view_model.dart';

List<SingleChildWidget> globalProvides = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<SharedPrefs>(create: (_) => SharedPrefs()),
];
List<SingleChildWidget> dependentModels = [];
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(sharedPrefs: context.read<SharedPrefs>())),
  ChangeNotifierProvider<SubViewModel>(
      create: (context) => SubViewModel(sharedPrefs: context.read<SharedPrefs>())),
];
