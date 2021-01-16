part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    if (user == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        pageBloc.add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        prevPageEvent = GoToMainPage();
        pageBloc.add(prevPageEvent);
        userBloc.add(LoadUser(user.uid));
      }
    }
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is OnSplashPage) {
          return SplashPage();
        } else if (state is OnLoginPage) {
          return SignInPage();
        } else if (state is OnRegistrationPage) {
          return SignUpPage(state.registrationData);
        } else if (state is OnPreferencePage) {
          return PreferencePage(state.registrationData);
        } else if (state is OnAccountConfirmationPage) {
          return AccountConfirmationPage(state.registrationData);
        } else {
          return MainPage();
        }
      },
    );
  }
}
