part of 'newarrival_cubit.dart';

@immutable
abstract class NewArrivalState {}

class NewArrivalInitial extends NewArrivalState {}
class NewArrivalLoading extends NewArrivalState {}
class NewArrivalSucces extends NewArrivalState {}
class NewArrivalFailure extends NewArrivalState {}
