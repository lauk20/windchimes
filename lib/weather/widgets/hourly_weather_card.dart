import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Text("12 PM", style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w500)),
            Expanded(
              //height: 60,
              child: SvgPicture.asset(
                'assets/day.svg',
                fit: BoxFit.cover,
              )
            ),
            Text("80°", style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 15,
                ),
                Text("100%"),
              ],
            )
          ],
        )
      )
    );
  }
}