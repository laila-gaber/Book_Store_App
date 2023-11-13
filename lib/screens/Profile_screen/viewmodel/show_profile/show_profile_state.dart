part of 'show_profile_cubit.dart';

@immutable
abstract class ShowProfileState {}

class ShowProfileInitial extends ShowProfileState {}
class ShowProfileLoading extends ShowProfileState {}
class ShowProfileSucces extends ShowProfileState {}
class ShowProfileFailure extends ShowProfileState {}
class LogoutLoading extends ShowProfileState{}
class LogoutSuccess extends ShowProfileState{}
class LogoutFailure extends ShowProfileState{}