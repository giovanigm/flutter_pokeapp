import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

abstract class CubitPage<CUBIT extends Cubit> extends StatefulWidget {
  Widget build(BuildContext context);

  void onInit(BuildContext context, CUBIT cubit) {}

  void onDispose(BuildContext context, CUBIT cubit) {}

  @override
  _CubitPageState<CUBIT> createState() => _CubitPageState();
}

class _CubitPageState<CUBIT extends Cubit> extends State<CubitPage> {
  final CUBIT _cubit = getIt.get<CUBIT>();

  @override
  void initState() {
    widget.onInit(context, _cubit);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose(context, _cubit);
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider<CUBIT>(
      create: (context) => _cubit,
      child: Builder(
        builder: (context) => widget.build(context),
      ),
    );
  }
}
