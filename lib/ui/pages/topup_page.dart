part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;

  TopUpPage(this.pageEvent);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);

    themeBloc.add(
        ChangeTheme(ThemeData().copyWith(primaryColor: Color(0xFFE4E4E4))));
    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(widget.pageEvent);
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xFFE5E5E5),
            ),
            SafeArea(
                child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: Text("Top Up",
                                style: blackTextFont.copyWith(fontSize: 20)),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, bottom: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                child:
                                    Icon(Icons.arrow_back, color: Colors.black),
                                onTap: () {
                                  pageBloc.add(widget.pageEvent);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        // FIXME: still problem with index and border color
                        onChanged: (text) {
                          String temp = '';

                          for (int i = 0; i < text.length; i++) {
                            temp += text.isDigit(i) ? text[i] : '';
                          }

                          setState(() {
                            selectedAmount = int.tryParse(temp) ?? 0;
                          });

                          amountController.text = NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(selectedAmount);

                          amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: amountController.text.length));
                        },
                        controller: amountController,
                        decoration: InputDecoration(
                          labelStyle: greyTextFont,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Amount",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 14),
                          child:
                              Text("Choose by Template", style: blackTextFont),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
