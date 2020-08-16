import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is NavigateToMainPage) {
      yield MainPageState();
    } else if (event is NavigateToFavorites) {
      yield FavoritesState();
    } else if (event is NavigateToOrders) {
      yield OrdersState();
    } else if (event is NavigateToProfile) {
      yield ProfileState();
    } else if (event is NavigateToFriends) {
      yield FriendsState();
    } else if (event is NavigateToSettings) {
      yield SettingsState();
    } else if (event is NavigateToHelpSupport) {
      yield HelpSupportState();
    } else if (event is NavigateToTermsConditions) {
      yield TermsConditionsState();
    } else {
      yield HomePageInitial();
    }
  }

  @override
  void onEvent(HomePageEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
  }
}
