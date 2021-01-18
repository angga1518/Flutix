part of 'widgets.dart';

class ComingSoonMovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  ComingSoonMovieCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.onTap != null) {
          this.onTap();
        }
      },
      child: Container(
        width: 100,
        height: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image:
                    NetworkImage(image_base_url + "w500" + movie.posterPath),
                fit: BoxFit.cover)),
        child: Container(
          width: 210,
          height: 140,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0),
                  ])),
        ),
      ),
    );
  }
}
