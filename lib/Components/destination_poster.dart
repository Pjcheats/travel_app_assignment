import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_assignment/Models/destination_model.dart';
import 'package:travel_app_assignment/Pages/destination_descrition_page.dart';

class DestinationPoster extends StatefulWidget {
  DestinationModel destinationModel;

  DestinationPoster({super.key, required this.destinationModel});

  @override
  State<DestinationPoster> createState() => _DestinationPosterState();
}

class _DestinationPosterState extends State<DestinationPoster> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
        borderRadius: BorderRadius.circular(20),

          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DestinationDescriptionPage(
                          destinationModel: widget.destinationModel,
                        )));
          },
          child: Ink(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            radius: 5,
                            onTap: () {
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  !isFavourite
                                      ? 'assets/custom-icons/heart-icon.png'
                                      : 'assets/custom-icons/heart-selected-icon.png',
                                  height: 16,
                                  width: 16,
                                  color: !isFavourite ? Colors.black : null,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(child: Container()),
                      Text(widget.destinationModel.name,
                          style: _GetUrbanistFont(fontSize: 22)),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/custom-icons/location-icon.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.destinationModel.city +
                                ', ' +
                                widget.destinationModel.country,
                            style: _GetUrbanistFont(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          for (int i = 1;
                              i < widget.destinationModel.rating;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/custom-icons/star-icon.png',
                                color: Colors.amber,
                              ),
                            ),
                          for (int i = 0;
                              i < 5 - widget.destinationModel.rating;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Image.asset(
                                  'assets/custom-icons/star-icon.png'),
                            ),
                          Text(
                            widget.destinationModel.rating.toString(),
                            style: _GetUrbanistFont(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _GetUrbanistFont(
          {double fontSize = 18, Color color = Colors.white}) =>
      GoogleFonts.urbanist(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
}
