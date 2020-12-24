part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            pageBloc.add(GoToLoginPage());
          },
          child: Text("Go to sign in page"),
        ),
      ),
    );
  }
}
