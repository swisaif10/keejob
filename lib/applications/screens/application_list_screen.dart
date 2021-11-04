import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/applications/bloc/application_bloc.dart';
import 'package:keejob_mobile/applications/bloc/application_event.dart';
import 'package:keejob_mobile/applications/bloc/application_state.dart';
import 'package:keejob_mobile/applications/models/application.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/widgets/job_list_item.dart';
import 'package:keejob_mobile/theme/theme.dart';

class ApplicationsListScreen extends StatelessWidget {
  static const routeName = '/job-application/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes Candidatures',
          style: appBarTitleStyle,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (_) =>
            Injector.resolve<ApplicationListBloc>()..add(GetApplicationList()),
        child: BlocBuilder<ApplicationListBloc, ApplicationListState>(
          builder: (context, state) {
            return state.when(
                initial: () => Center(child: CircularProgressIndicator()),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (applications) => _buildList(context, applications));
          },
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<Application>? applications) {
    if (applications == null) {
      return Center(
        child: Text('Aucune annonce trouvée.',
            style: TextStyle(fontWeight: FontWeight.bold)),
      );
    }
    return ListView.separated(
      itemCount: applications.length,
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return JobListItem(applications[index].job , applications[index].applicationDate);
      },
    );
  }
}
