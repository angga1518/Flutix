part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  Movie movie;
  MovieDetailPage(this.movie);

  MovieDetail movieDetail;
  List<Credit> credits;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        pageBloc.add(GoToMainPage());
      },
      child: Stack(
        children: [
          Container(color: accentColor1),
          SafeArea(
            child: Container(
              color: Color(0xFFF6F7F9),
              child: FutureBuilder(
                future: MovieServices.getMovieDetail(movie),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: mainColor,
                        size: 50,
                      ),
                    );
                  } else {
                    movieDetail = snapshot.data;
                    return ListView(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width,
                              height: 270,
                              child: Center(
                                child: SpinKitFadingCircle(
                                  color: mainColor,
                                  size: 50,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(image_base_url +
                                          "w1280" +
                                          (movie.backdropPath ??
                                              movie.posterPath)),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 271,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(0, 1),
                                      end: Alignment(0, 0.06),
                                      colors: [
                                    Color(0xFFF6F7F9),
                                    Color(0xFFF6F7F9).withOpacity(0)
                                  ])),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 24, top: 20),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: GestureDetector(
                                  onTap: () {
                                    pageBloc.add(GoToMainPage());
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.8,
                        ),
                        Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: blackTextFont.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          movieDetail.getGenresAndLanguage(),
                          textAlign: TextAlign.center,
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        RatingStars(
                          voteAverage: movie.voteAverage,
                          color: accentColor3,
                          alignment: MainAxisAlignment.center,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: defaultMargin, bottom: 12),
                          child: Text(
                            "Cast & Crew",
                            style: blackTextFont.copyWith(fontSize: 14),
                          ),
                        ),
                        Container(
                          height: 110,
                          child: FutureBuilder(
                            future: MovieServices.getCredits(movie.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                List<Credit> listCredit =
                                    snapshot.data as List<Credit>;
                                List<Widget> listCreditWidget = listCredit
                                    .map((e) => CreditCard(
                                        NetworkImage(image_base_url +
                                            "w780" +
                                            e.profilePath),
                                        e.name))
                                    .toList();
                                return ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: listCreditWidget,
                                );
                              } else {
                                return SpinKitFadingCircle(
                                  color: mainColor,
                                  size: 30,
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: defaultMargin, top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Storyline",
                                  style: blackTextFont.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  movieDetail.overview,
                                  style: greyTextFont.copyWith(fontSize: 14),
                                )
                              ],
                            )),
                        Container(
                          height: 45,
                          margin: EdgeInsets.all(30),
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: mainColor,
                              child: Text(
                                "Continue to Book",
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                              onPressed: () {
                                pageBloc
                                    .add(GoToSelectSchedulePage(movieDetail));
                              }),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
