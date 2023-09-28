import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gendercard extends StatelessWidget {
  final String? gender;
  final IconData? symbol;
  Gendercard({
    super.key,
    @required this.gender,
    @required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender!,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final Color? colour;
  final Widget? containerChild;
  final void Function()? onPress;

  ReusableContainer({@required this.colour, this.containerChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: containerChild,
      ),
    );
  }
}

class SizeCard extends StatelessWidget {
  final String? size;
  final String? label;
  final Function()? add;
  final Function()? sub;

  const SizeCard({
    this.label,
    this.size,
    this.add,
    this.sub,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          size!,
          style: const TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconBtn(
              child: FontAwesomeIcons.minus,
              onPressed: sub,
            ),
            RoundIconBtn(
              child: FontAwesomeIcons.plus,
              onPressed: add,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  final IconData? child;
  final Function()? onPressed;
  const RoundIconBtn({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(child),
    );
  }
}
