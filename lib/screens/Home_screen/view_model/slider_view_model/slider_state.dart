part of 'slider_cubit.dart';

@immutable
abstract class SlidercubitState {}

class SlidercubitInitial extends SlidercubitState {}
class SlidercubitLoading extends SlidercubitState {}
class SlidercubitSucces extends SlidercubitState {}
class SlidercubitFailure extends SlidercubitState {}
