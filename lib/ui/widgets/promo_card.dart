part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    promo.title,
                    style: whiteTextFont,
                  ),
                  Text(
                    promo.subtitle,
                    style: whiteTextFont.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "OFF ",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${promo.discount}%",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.white.withOpacity(0.1), Colors.transparent])
                .createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 80 / 310 * 320,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.asset(
                "assets/reflection2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
                  child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft,
                      colors: [Colors.white.withOpacity(0.1), Colors.transparent])
                  .createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 96,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  "assets/reflection1.png",
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
                  child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft,
                      colors: [Colors.white.withOpacity(0.1), Colors.transparent])
                  .createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 53,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.asset(
                  "assets/reflection1.png",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
