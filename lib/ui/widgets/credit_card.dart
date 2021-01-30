part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final NetworkImage image;
  final String name;
  CreditCard(this.image, this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 6, right: 6),
          width: 70,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: image, fit: BoxFit.cover)),
        ),
        Container(
          width: 70,
          child: Text(
            name,
            style: blackTextFont.copyWith(
                fontSize: 10, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
