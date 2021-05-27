part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {}

class OnLoginPage extends PageState {}

class OnSplashPage extends PageState {}

class OnMainPage extends PageState {}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;
  OnRegistrationPage(this.registrationData);
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;
  OnPreferencePage(this.registrationData);
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;
  OnAccountConfirmationPage(this.registrationData);
}

class OnMoviePage extends PageState {
  final Movie movie;
  OnMoviePage(this.movie);
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;
  OnSelectSchedulePage(this.movieDetail);
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;
  OnSelectSeatPage(this.ticket);
}

class OnCheckoutPage extends PageState {
  final Ticket ticket;
  OnCheckoutPage(this.ticket);
}

class OnSuccessPage extends PageState {
  final Ticket ticket;
  final FlutixTransaction transaction;

  OnSuccessPage(this.ticket, this.transaction);
}

class OnTicketDetailPage extends PageState {
  final Ticket ticket;

  OnTicketDetailPage(this.ticket);
}

class OnProfilePage extends PageState {}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;

  OnTopUpPage(this.pageEvent);
}
