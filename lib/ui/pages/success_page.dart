part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;

  SuccessPage(this.ticket, this.transaction);

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        return;
      },
      child: FutureBuilder(
        future:
            ticket != null ? processingTicketOrder(context) : processingTopUp(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 70),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ticket == null
                              ? "assets/top_up_done.png"
                              : "assets/ticket_done.png"))),
                ),
                Text(
                  (ticket == null) ? "Emmm Yummy!" : "Happy Watching!",
                  style: blackTextFont.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  (ticket == null)
                      ? "You have successfully\ntop up the wallet"
                      : "You have successfully\nbought the ticket",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Container(
                  height: 45,
                  width: 250,
                  margin: EdgeInsets.only(top: 70, bottom: 20),
                  child: RaisedButton(
                      elevation: 0,
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        (ticket == null) ? "My Wallet" : "My Tickets",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () {}),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Discover new movie? ",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageBloc.add(GoToMainPage());
                      },
                      child: Text(
                        "Back to Home",
                        style: purpleTextFont,
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              ),
            );
          }
        },
      ),
    ));
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    // UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // TicketBloc ticketBloc = BlocProvider.of<TicketBloc>(context);
    // userBloc.add(Purchase(ticket.totalPrice));
    // ticketBloc.add(BuyTicket(ticket, transaction.userID));

    // await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp() async {}
}
