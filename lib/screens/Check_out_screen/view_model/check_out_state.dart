part of 'check_out_cubit.dart';

@immutable
abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}
class CheckOutLoading extends CheckOutState {}
class CheckOutSuccess extends CheckOutState {}
class CheckOutFailure extends CheckOutState {}
class OrderLoading extends CheckOutState {}
class OrderSuccess extends CheckOutState {}
class OrderFailure extends CheckOutState {}