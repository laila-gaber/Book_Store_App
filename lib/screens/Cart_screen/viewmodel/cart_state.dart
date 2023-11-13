part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class AddCartLoading extends CartState {}
class AddCartSuccess extends CartState {}
class AddCartFailure extends CartState {}
class ShowCartLoading extends CartState {}
class ShowCartSuccess extends CartState {}
class ShowCartFailure extends CartState {}
class UpdateCartLoading extends CartState {}
class UpdateCartSuccess extends CartState {}
class UpdateCartFailure extends CartState {}
class RemoveCartLoading extends CartState {}
class RemoveCartSuccess extends CartState {}
class RemoveCartFailure extends CartState {}
class ClearCartSuccess extends CartState {}