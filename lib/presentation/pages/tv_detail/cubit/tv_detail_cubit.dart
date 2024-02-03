import 'package:api_base/data/models/tv_series/tv_series_response.dart';
import 'package:api_base/presentation/utilities/enums/app_status.dart';
import 'package:api_base/presentation/utilities/errors/app_error.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_detail_cubit.freezed.dart';
part 'tv_detail_state.dart';

class TvDetailCubit extends Cubit<TvDetailState> {
  TvDetailCubit() : super(const TvDetailState());
}
