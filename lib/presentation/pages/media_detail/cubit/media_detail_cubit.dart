import 'package:api_base/data/models/media/media.dart';
import 'package:api_base/presentation/utilities/enums/enums.dart';
import 'package:api_base/presentation/utilities/errors/app_error.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_detail_cubit.freezed.dart';
part 'media_detail_state.dart';

class MediaDetailCubit extends Cubit<MediaDetailState> {
  MediaDetailCubit() : super(const MediaDetailState());
}
