part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  RegistrationData registrationData;
  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () {
        widget.registrationData.password = "";
        pageBloc.add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 36, bottom: 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: GestureDetector(
                      onTap: () {
                        widget.registrationData.password = "";
                        pageBloc
                            .add(GoToRegistrationPage(widget.registrationData));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text("Select Your\nFavorite Genre", style: blackTextFont.copyWith(),),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
  List<Widget> generateGenreWidgets(BuildContext context){
    double width = 
  }
}
