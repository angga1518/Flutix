part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToSelectSchedulePage(widget.ticket.movieDetail));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: accentColor1),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            SafeArea(
              child: ListView(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 24, top: 20, bottom: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: GestureDetector(
                                  onTap: () {
                                    pageBloc.add(GoToSelectSchedulePage(
                                        widget.ticket.movieDetail));
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
                            margin: EdgeInsets.only(right: 24),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    widget.ticket.movieDetail.title,
                                    style: blackTextFont.copyWith(fontSize: 20),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(image_base_url +
                                              'w154' +
                                              widget.ticket.movieDetail
                                                  .posterPath),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 277,
                        height: 84,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/screen.png"))),
                      ),
                      generateSeats(),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: selectedSeats.length > 0
                                ? mainColor
                                : Color(0xFFE4E4E4),
                            child: Icon(
                              Icons.arrow_forward,
                              color: selectedSeats.length > 0
                                  ? Colors.white
                                  : Color(0xFFBEBEBE),
                            ),
                            onPressed: selectedSeats.length > 0
                                ? () {
                                    pageBloc.add(GoToCheckoutPage(widget.ticket
                                        .copyWith(seats: selectedSeats)));
                                  }
                                : null),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];
    for (var i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(numberOfSeats[i], (index) {
          String seatNumber = "${String.fromCharCode(i + 65)}${index + 1}";
          return Padding(
            padding: EdgeInsets.only(
                right: index < numberOfSeats[i] - 1 ? 16 : 0, bottom: 16),
            child: SelectableBox(
              seatNumber,
              width: 40,
              height: 40,
              textStyle: whiteNumberFont.copyWith(color: Colors.black),
              isSelected: selectedSeats.contains(seatNumber),
              isEnabled: index != 0,
              onTap: () {
                setState(() {
                  if (selectedSeats.contains(seatNumber)) {
                    selectedSeats.remove(seatNumber);
                  } else {
                    selectedSeats.add(seatNumber);
                  }
                });
              },
            ),
          );
        }),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}
