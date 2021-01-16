part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return WillPopScope(
        onWillPop: () async {
          pageBloc.add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
            body: SafeArea(
                child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width:
                        MediaQuery.of(context).size.width - (defaultMargin * 2),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Confirm\nNew Account",
                        style: blackTextFont.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              (widget.registrationData.profilePicture == null)
                                  ? AssetImage("assets/user_pic.png")
                                  : FileImage(
                                      widget.registrationData.profilePicture))),
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(bottom: 20)),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Welcome\n',
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: widget.registrationData.name,
                      style: blackTextFont.copyWith(fontSize: 20)),
                ]),
              ),
              SizedBox(height: 110),
              (isSigningUp)
                  ? SpinKitFadingCircle(
                      color: Color(0xFF3E9D9D),
                      size: 45,
                    )
                  : SizedBox(
                      width: 250,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () async {
                          setState(() {
                            isSigningUp = true;
                          });
                          imageFileToUpload =
                              widget.registrationData.profilePicture;

                          SignInSignUpResult result = await AuthServices.signUp(
                              widget.registrationData.email,
                              widget.registrationData.password,
                              widget.registrationData.name,
                              widget.registrationData.selectedGenres,
                              widget.registrationData.selectedLanguage);

                          if (result.pengguna == null) {
                            setState(() {
                              isSigningUp = false;
                            });

                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: result.message,
                            )..show(context);
                          }
                        },
                        color: Color(0xFF3E9D9D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "Create My Account",
                          style: whiteTextFont.copyWith(fontSize: 16),
                        ),
                      ),
                    )
            ],
          ),
        ))));
  }
}
