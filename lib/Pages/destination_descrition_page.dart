import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_assignment/Models/destination_model.dart';

class DestinationDescriptionPage extends StatefulWidget {
  DestinationModel destinationModel;

  DestinationDescriptionPage({super.key, required this.destinationModel});

  @override
  State<DestinationDescriptionPage> createState() => _DestinationDescriptionPageState();
}

class _DestinationDescriptionPageState extends State<DestinationDescriptionPage> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.destinationModel.imgURL),
                fit: BoxFit.cover,
              ),
            ),
            child: Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ),
                            InkWell(
                              radius: 5,
                              onTap: () {
                                setState(() {
                                  isFavourite = !isFavourite;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                   isFavourite ? 'assets/custom-icons/heart-selected-icon.png' :'assets/custom-icons/heart-icon.png',
                                  height: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.destinationModel.name,
                                style: _GetPoppinsFont(fontSize: 26)),
                            Row(
                              children: [
                                Image.asset(
                                    'assets/custom-icons/location-icon.png'),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.destinationModel.city +
                                      ', ' +
                                      widget.destinationModel.country,
                                  style: _GetUrbanistFont(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(widget.destinationModel.description,
                            style: _GetUrbanistFont(fontSize: 14)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            for (int i = 1; i < widget.destinationModel.rating; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Image.asset(
                                  'assets/custom-icons/star-icon.png',
                                  color: Colors.amber[400],
                                ),
                              ),
                            for (int i = 0; i < 5 - widget.destinationModel.rating; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Image.asset(
                                    'assets/custom-icons/star-icon.png'),
                              ),
                            Text(
                              widget.destinationModel.rating.toString(),
                              style: _GetPoppinsFont(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹ ' +
                                  widget.destinationModel.price.toString() +
                                  ' / person',
                              style: _GetUrbanistFont(fontSize: 20),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.amber[400]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16.0),
                                child: Text(
                                  'Book Now',
                                  style: _GetInterFont(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  TextStyle _GetPoppinsFont(
          {double fontSize = 18, Color color = Colors.white}) =>
      GoogleFonts.poppins(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w600);

  TextStyle _GetInterFont({double fontSize = 16, Color color = Colors.white}) =>
      GoogleFonts.inter(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w500);

  TextStyle _GetUrbanistFont(
          {double fontSize = 18, Color color = Colors.white}) =>
      GoogleFonts.urbanist(
          height: 1.8,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500);
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
