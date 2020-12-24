part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if(state is UserLoaded){
                  return Text(state.pengguna.name);
                }
                else{
                  return Text("Belum Masuk");
                }
              },
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {
                AuthServices.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
