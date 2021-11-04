import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/profession.dart';

part 'search_profession_state.freezed.dart';

@freezed
abstract class SearchProfessionListState with _$SearchProfessionListState {
  const factory SearchProfessionListState.initial() = Initial;
  const factory SearchProfessionListState.success(List<Profession> search) =
      Success;
}
