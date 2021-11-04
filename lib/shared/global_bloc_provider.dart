import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/trainings/search_trainings/search_all/bloc/search_training_parameters_bloc.dart';

/// The [GlobalBlocProvider] is built above the root [MaterialApp] to provide
/// every descendant with globally available blocs.
///
/// These blocs will only be created once.
class GlobalBlocProvider extends StatelessWidget {
  const GlobalBlocProvider({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<Bloc<dynamic, dynamic>>>[
        // authentication
        BlocProvider<AuthenticationBloc>(
            create: (_) =>
                Injector.resolve<AuthenticationBloc>()..add(AppLoaded())),

        // Search params
        BlocProvider<SearchParametersBloc>(
            create: (_) => Injector.resolve<SearchParametersBloc>()),

        BlocProvider<SearchTrainingParametersBloc>(
            create: (_) => Injector.resolve<SearchTrainingParametersBloc>()),
      ],
      child: child,
    );
  }
}
