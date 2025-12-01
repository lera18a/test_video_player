part of 'data_bloc.dart';

sealed class DataState {}

class DataLoadingVideo extends DataState {}

class DataLoadedVideo extends DataState {
  final ModelVideo modelVideo;

  DataLoadedVideo({required this.modelVideo});
}
