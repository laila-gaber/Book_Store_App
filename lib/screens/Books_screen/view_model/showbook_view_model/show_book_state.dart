part of 'show_book_cubit.dart';

@immutable
abstract class ShowBookState {}

class ShowBookInitial extends ShowBookState {}
class ShowBookLoading extends ShowBookState {}
class ShowBookSucces extends ShowBookState {}
class ShowBookFailure extends ShowBookState {}
