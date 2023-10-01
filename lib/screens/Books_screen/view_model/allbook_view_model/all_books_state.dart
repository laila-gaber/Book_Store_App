part of 'all_books_cubit.dart';

@immutable
abstract class AllBooksState {}

class AllBooksInitial extends AllBooksState {}
class AllBooksLoading extends AllBooksState {}
class AllBooksSucces extends AllBooksState {}
class AllBooksFailure extends AllBooksState {}
