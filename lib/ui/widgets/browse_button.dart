part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  String selectedGenre;
  BrowseButton(this.selectedGenre);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        generateImage(selectedGenre),
        SizedBox(
          height: 4,
        ),
        Text(
          selectedGenre,
          style: blackTextFont.copyWith(fontSize: 13),
        )
      ],
    );
  }

  Widget generateImage(String genre) {
    switch (genre) {
      case "Horror":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_horror.png"),
        );
        break;
      case "Music":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_music.png"),
        );
        break;
      case "Action":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_action.png"),
        );
        break;
      case "Drama":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_drama.png"),
        );
        break;
      case "War":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_war.png"),
        );
        break;
      case "Crime":
        return SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("assets/ic_crime.png"),
        );
        break;
      default:
        return null;
    }
  }
}
