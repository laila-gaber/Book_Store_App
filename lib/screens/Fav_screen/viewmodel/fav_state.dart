part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}
class ShowFavLoading extends FavState {}
class ShowFavSuccess extends FavState {}
class ShowFavFailure extends FavState {}
class AddFavLoading extends FavState {}
class AddFavSuccess extends FavState {}
class AddFavFailure extends FavState {}
class RemoveFavLoading extends FavState {}
class RemoveFavSuccess extends FavState {}
class RemoveFavFailure extends FavState {}
