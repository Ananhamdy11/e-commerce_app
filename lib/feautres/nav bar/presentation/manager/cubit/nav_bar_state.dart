part of 'nav_bar_cubit.dart';

sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class IndexChange extends NavBarState {}

final class GetDataLoading extends NavBarState {}

final class GetDataSuccess extends NavBarState {}

final class GetDataError extends NavBarState {}


final class GetFavoriteLoading extends NavBarState {}
final class GetFavoriteSuccess extends NavBarState {}
final class GetFavoriteError extends NavBarState {}

final class RemoveFavoriteLoading extends NavBarState {}
final class RemoveFavoriteSuccess extends NavBarState {}
final class RemoveFavoriteError extends NavBarState {}

final class BuyProductLoading extends NavBarState {}
final class BuyProductSuccess extends NavBarState {}
final class BuyProductError extends NavBarState {}

final class GetBoughtProductLoading extends NavBarState {}
final class GetBoughtProductSuccess extends NavBarState {}
final class GetBoughtProductError extends NavBarState {}
