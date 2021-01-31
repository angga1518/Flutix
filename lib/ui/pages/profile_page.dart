part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return WillPopScope(
      onWillPop: () async {
        pageBloc.add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
                child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30, left: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Icon(Icons.arrow_back, color: Colors.black),
                  onTap: () {
                    pageBloc.add(GoToMainPage());
                  },
                ),
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserLoaded) {
                  return Container(
                      child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState
                                              .pengguna.profilePictureUrl ==
                                          null)
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(
                                          userState.pengguna.profilePictureUrl),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.center,
                          width: 180,
                          child: Text(
                            userState.pengguna.name,
                            style: blackTextFont.copyWith(fontSize: 18),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          )),
                      Container(
                          margin: EdgeInsets.only(bottom: 14),
                          alignment: Alignment.center,
                          width: 180,
                          child: Text(
                            userState.pengguna.email,
                            style: greyTextFont.copyWith(fontSize: 16),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          )),
                    ],
                  ));
                } else {
                  return SizedBox();
                }
              },
            ),
            generateSubMenu(context, AssetImage("assets/edit_profile.png"),
                "Edit Profile", () {}),
            generateSubMenu(context, AssetImage("assets/my_wallet.png"),
                "My Wallet", () {}),
            generateSubMenu(context, AssetImage("assets/language.png"),
                "change Language", () {}),
            generateSubMenu(context, AssetImage("assets/help_centre.png"),
                "Help Centre", () {}),
            generateSubMenu(context, AssetImage("assets/rate.png"),
                "Rate Flutix App", () {}),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                onPressed: () async {
                  await AuthServices.signOut();
                  userBloc.add(SignOut());
                },
                child: Text(
                  "Sign Out",
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
                elevation: 0,
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        ))),
      ])),
    );
  }
}

Widget generateSubMenu(
    BuildContext context, ImageProvider image, String text, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 40, bottom: 10, top: 16),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 24,
                width: 24,
                decoration: BoxDecoration(image: DecorationImage(image: image)),
              ),
              Text(text, style: blackTextFont.copyWith(fontSize: 16)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40),
          child: generateDashedDivider(
              MediaQuery.of(context).size.width - 2 * defaultMargin),
        ),
      ],
    ),
  );
}
