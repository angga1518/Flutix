part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime",
  ];
  final List<String> languages = [
    "Bahasa",
    "English",
    "Japanese",
    "Korean",
  ];
  RegistrationData registrationData;
  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenre = [];
  String selectedLanguage = "";
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Select Your\nFavorite Genre",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Movie Language\nYou Prefer?",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLanguageWidgets(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (selectedGenre.length != 4) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Please select 4 genres",
                            )..show(context);
                          } else if (selectedLanguage == "") {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Please select a language",
                            )..show(context);
                          } else {
                            widget.registrationData.selectedGenres =
                                selectedGenre;
                            widget.registrationData.selectedLanguage =
                                selectedLanguage;
                            pageBloc.add(GoToAccountConfirmationPage(
                                widget.registrationData));
                          }
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  List<Widget> generateLanguageWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    List<Widget> listLanguage = [];
    for (String language in widget.languages) {
      listLanguage.add(SelectableBox(
        language,
        width: width,
        isSelected: selectedLanguage == language,
        onTap: () {
          onSelectLanguage(language);
        },
      ));
    }
    return listLanguage;
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    List<Widget> listGenreWidget = [];
    for (String genre in widget.genres) {
      listGenreWidget.add(SelectableBox(
        genre,
        width: width,
        isSelected: selectedGenre.contains(genre),
        onTap: () {
          onSelectGenre(genre);
        },
      ));
    }
    return listGenreWidget;
  }

  void onSelectGenre(String genre) {
    if (selectedGenre.contains(genre)) {
      setState(() {
        selectedGenre.remove(genre);
      });
    } else {
      if (selectedGenre.length < 4) {
        setState(() {
          selectedGenre.add(genre);
        });
      }
    }
  }

  void onSelectLanguage(String language) {
    if (selectedLanguage == language) {
      setState(() {
        selectedLanguage = "";
      });
    } else {
      if (selectedLanguage == "") {
        setState(() {
          selectedLanguage = language;
        });
      }
    }
  }
}
