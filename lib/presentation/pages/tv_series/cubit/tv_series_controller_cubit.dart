import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_series_controller_cubit.freezed.dart';
part 'tv_series_controller_state.dart';

class TvSeriesControllerCubit extends Cubit<TvSeriesControllerState> {
  TvSeriesControllerCubit() : super(const TvSeriesControllerState());
}
