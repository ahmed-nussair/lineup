part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class NavigateToMainPage extends HomePageEvent {}

class NavigateToFavorites extends HomePageEvent {}

class NavigateToOrders extends HomePageEvent {}

class NavigateToProfile extends HomePageEvent {}

class NavigateToFriends extends HomePageEvent {}

class NavigateToHelpSupport extends HomePageEvent {}

class NavigateToSettings extends HomePageEvent {}

class NavigateToTermsConditions extends HomePageEvent {}
