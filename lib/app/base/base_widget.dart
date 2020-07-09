import 'package:flutter/material.dart';
import 'package:pokeapp/app/base/base_view_model.dart';
import 'package:pokeapp/injection.dart';

abstract class BaseWidget<VIEWMODEL extends BaseViewModel, STATE>
    extends StatefulWidget {
  Widget build(BuildContext context, STATE state);

  final VIEWMODEL viewModel = getIt.get<VIEWMODEL>();

  void onInit() {}

  void onDispose() {}

  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  void initState() {
    widget.viewModel.addListener(() {
      setState(() {});
    });

    widget.onInit();

    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    widget.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, widget.viewModel.state);
  }
}
