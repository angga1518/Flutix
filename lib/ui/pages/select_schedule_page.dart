part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;
  SelectSchedulePage(this.movieDetail);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
        onWillPop: () async {
          pageBloc.add(GoToMovieDetailPage(widget.movieDetail));
          return;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: accentColor1,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              SafeArea(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 24, top: 20, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: GestureDetector(
                            onTap: () {
                              pageBloc
                                  .add(GoToMovieDetailPage(widget.movieDetail));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Text(
                        "Choose Date",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24, top: 16),
                      height: 90,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          itemBuilder: (_, index) {
                            return Container(
                                margin: EdgeInsets.only(
                                    left: (index == 0) ? defaultMargin : 0,
                                    right: (index < dates.length - 1)
                                        ? 16
                                        : defaultMargin),
                                child: DateCard(
                                  dates[index],
                                  isSelected: selectedDate == dates[index],
                                  onTap: () {
                                    setState(() {
                                      selectedDate = dates[index];
                                    });
                                  },
                                ));
                          }),
                    ),
                    generateTimeTable(),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, userState) {
                          return FloatingActionButton(
                              elevation: 0,
                              backgroundColor:
                                  isValid ? mainColor : Color(0xFFBEBEBE),
                              child: Icon(Icons.arrow_forward),
                              onPressed: (isValid)
                                  ? () {
                                      pageBloc.add(GoToSelectSeatPage(Ticket(
                                          widget.movieDetail,
                                          selectedTheater,
                                          DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime),
                                          randomAlphaNumeric(12).toUpperCase(),
                                          null,
                                          (userState as UserLoaded)
                                              .pengguna
                                              .name,
                                          null)));
                                    }
                                  : null);
                        },
                      ),
                    ),
                    SizedBox(height: 41),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];
    for (Theater theater in dummyTheaters) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child:
              Text(theater.name, style: blackTextFont.copyWith(fontSize: 20))));
      widgets.add(Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedule.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: (index == 0) ? defaultMargin : 0,
                    right: (index < schedule.length - 1) ? 16 : defaultMargin),
                child: SelectableBox(
                  "${schedule[index]}:00",
                  width: 90,
                  height: 50,
                  isSelected: selectedTheater == theater &&
                      selectedTime == schedule[index],
                  isEnabled: schedule[index] > DateTime.now().hour ||
                      selectedDate.day != DateTime.now().day,
                  onTap: () {
                    setState(() {
                      selectedTheater = theater;
                      selectedTime = schedule[index];
                      isValid = true;
                    });
                  },
                ),
              );
            }),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
