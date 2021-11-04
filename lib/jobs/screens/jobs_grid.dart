import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/job_list_item.dart';
import '../bloc/jobs_list_bloc.dart';
import '../bloc/jobs_list_state.dart';

class JobsGrid extends StatefulWidget {
  static const routeName = '/job-grid';

  @override
  _JobsGridState createState() => _JobsGridState();
}

class _JobsGridState extends State<JobsGrid> {
  late final ScrollController _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  late JobsListBloc _jobsListBloc;

  late DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _jobsListBloc = BlocProvider.of<JobsListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _jobsListBloc..add(GetJobsList()),
        child:
            BlocBuilder<JobsListBloc, JobsListState>(builder: (context, state) {
          return state.when(
            initial: () {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (jobs, nextPageNumber) {
              if (jobs!.isEmpty) {
                return Center(
                  child: Text('Aucune annonce trouvée.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                );
              }
              return Container(
                  child: ListView.separated(
                itemCount: nextPageNumber == 0 ? jobs.length : jobs.length + 1,
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return index >= jobs.length
                      ? Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: SizedBox(
                              width: 33,
                              height: 33,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                              ),
                            ),
                          ),
                        )
                      : (jobs[index].format == 3 || jobs[index].format == 2)
                          ? Container(
                              padding: EdgeInsets.all(8),
                             // margin: EdgeInsets.only(left: 3, right: 3),
                              color: Colors.blue[50],
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    //    border: Border.all(
                                    //      width: 1, color: Colors.blue[100]!),
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(6.0)),
                                  ),
                                  child: JobListItem(jobs[index], date)),
                            )
                          : Container(
                              padding: EdgeInsets.all(8),
                              child: JobListItem(jobs[index], date));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 0.3, color: Colors.grey[500]),
              ));
            },
          );
        }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _jobsListBloc.add(GetJobsList());
    }
  }
}
