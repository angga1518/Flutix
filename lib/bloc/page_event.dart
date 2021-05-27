part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToMainPage extends PageEvent {}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;
  GoToRegistrationPage(this.registrationData);
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;
  GoToPreferencePage(this.registrationData);
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;
  GoToAccountConfirmationPage(this.registrationData);
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;
  GoToMovieDetailPage(this.movie);
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;
  GoToSelectSchedulePage(this.movieDetail);
}

class GoToSelectSeatPage extends PageEvent {
  final Ticket ticket;
  GoToSelectSeatPage(this.ticket);
}

class GoToCheckoutPage extends PageEvent {
  final Ticket ticket;
  GoToCheckoutPage(this.ticket);
}

class GoToSuccessPage extends PageEvent {
  final Ticket ticket;
  final FlutixTransaction transaction;

  GoToSuccessPage(this.ticket, this.transaction);
}

class GoToTicketDetailPage extends PageEvent {
  final Ticket ticket;

  GoToTicketDetailPage(this.ticket);
}

class GoToProfilePage extends PageEvent {}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;

  GoToTopUpPage(this.pageEvent);
}
