
import 'package:equatable/equatable.dart';

abstract class RecruiterEvent extends Equatable {
  const RecruiterEvent();

  @override
  List<Object> get props => [];
}

class GetRecruiter extends RecruiterEvent {
  final int recruiterId;
  GetRecruiter(this.recruiterId);
}
