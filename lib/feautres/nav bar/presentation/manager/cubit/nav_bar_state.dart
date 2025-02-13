part of 'nav_bar_cubit.dart';

sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class IndexChange extends NavBarState {}

final class GetDataLoading extends NavBarState {}

final class GetDataSuccess extends NavBarState {}

final class GetDataError extends NavBarState {}
