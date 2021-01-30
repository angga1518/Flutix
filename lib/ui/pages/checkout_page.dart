part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;
  CheckoutPage(this.ticket);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    int total = widget.ticket.seats.length * 26500;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          pageBloc.add(GoToSelectSeatPage(widget.ticket));
          return;
        },
        child: Stack(
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
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 24, top: 32, bottom: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: GestureDetector(
                                  onTap: () {
                                    pageBloc
                                        .add(GoToSelectSeatPage(widget.ticket));
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
                              height: 56,
                              margin: EdgeInsets.only(top: 20),
                              child: Center(
                                child: Text(
                                  "Checkout\nMovie",
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 20, 24, 20),
                        height: 90,
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 90,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(image_base_url +
                                          'w342' +
                                          widget
                                              .ticket.movieDetail.posterPath))),
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                70 -
                                                20,
                                        child: Text(
                                          widget.ticket.movieDetail.title,
                                          style: blackTextFont.copyWith(
                                              fontSize: 18),
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        widget.ticket.movieDetail
                                            .getGenresAndLanguage(),
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    RatingStars(
                                      voteAverage:
                                          widget.ticket.movieDetail.voteAverage,
                                      color: accentColor3,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: defaultMargin),
                          child: Divider(
                            color: Color(0xFFE4E4E4),
                            thickness: 1,
                          )),
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Order ID",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      widget.ticket.bookingCode,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cinema",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                        widget.ticket.theater.name,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Date & Time",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      widget.ticket.time.dateAndTime,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Seat Number",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      widget.ticket.seatsInString,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Price",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      "IDR 25.000 x ${widget.ticket.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Fee",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      "IDR 1.500 x ${widget.ticket.seats.length}",
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Total",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(total),
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: defaultMargin),
                                  child: Divider(
                                    color: Color(0xFFE4E4E4),
                                    thickness: 1,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Your Wallet",
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(state.pengguna.balance),
                                      style: whiteNumberFont.copyWith(
                                          color: state.pengguna.balance >= total
                                              ? Color(0xFF3E9D9D)
                                              : Color(0xFFFF5C83),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 46,
                                margin: EdgeInsets.only(top: 36),
                                child: RaisedButton(
                                  onPressed: () {
                                    if (state.pengguna.balance >= total) {
                                      FlutixTransaction transaction =
                                          FlutixTransaction(
                                              userID: state.pengguna.id,
                                              title: widget
                                                  .ticket.movieDetail.title,
                                              subtitle:
                                                  widget.ticket.theater.name,
                                              time: DateTime.now(),
                                              amount: -total,
                                              picture: widget.ticket.movieDetail
                                                  .posterPath);
                                      pageBloc.add(GoToSuccessPage(
                                          widget.ticket.copyWith(totalPrice: total), transaction));
                                    } else {}
                                  },
                                  child: Text(
                                    state.pengguna.balance >= total
                                        ? "Checkout Now"
                                        : "Top Up My Wallet",
                                    style: whiteTextFont.copyWith(fontSize: 16),
                                  ),
                                  elevation: 0,
                                  color: state.pengguna.balance >= total
                                      ? Color(0xFF3E9D9D)
                                      : mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              )
                            ],
                          );
                        },
                      )
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
}
