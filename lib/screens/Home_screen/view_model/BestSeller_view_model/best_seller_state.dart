part of 'best_seller_cubit.dart';

@immutable
abstract class BestSellerState {}

class BestSellerInitial extends BestSellerState {}
class BestSellerLoading extends BestSellerState {}
class BestSellerSucces extends BestSellerState {}
class BestSellerFailure extends BestSellerState {}
