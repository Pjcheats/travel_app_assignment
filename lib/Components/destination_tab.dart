import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_assignment/Models/destination_model.dart';
import 'package:travel_app_assignment/Pages/destination_descrition_page.dart';

class DestinationTab extends StatefulWidget {
  DestinationModel destinationModel;

  DestinationTab({super.key, required this.destinationModel});

  @override
  State<DestinationTab> createState() => _DestinationTabState();
}

class _DestinationTabState extends State<DestinationTab> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),

        onTap: (() {
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DestinationDescriptionPage(
                          destinationModel: widget.destinationModel,
                        )));
        }),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
               Expanded(
                 child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                   child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                             image: DecorationImage(
                               image: AssetImage(widget.destinationModel.imgURL),
                               fit: BoxFit.cover,
                             ),
                           ),
                 
                   ),
                 ),
               ),
               SizedBox(width: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.destinationModel.name,
                        style: _GetUrbanistFont(fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                          '₹' +
                          widget.destinationModel.price.toString(),
                      style: _GetUrbanistFont(fontSize: 16,color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        for (int i = 1; i < widget.destinationModel.rating; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Image.asset(
                              'assets/custom-icons/star-icon.png',
                              color: Colors.amber,
                            ),
                          ),
                        for (int i = 0;
                            i < 5 - widget.destinationModel.rating;
                            i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child:
                                Image.asset('assets/custom-icons/star-icon.png'
                              ,color: Colors.grey.shade400,
                                ),
                          ),
                        Text(
                          widget.destinationModel.rating.toString(),
                          style: _GetUrbanistFont(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                            
                            widget.destinationModel.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                        style: _GetUrbanistFont(fontSize: 16),
                      ),
                    ),
                  ],
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
                                !isFavourite ? 'assets/custom-icons/heart-icon.png' : 'assets/custom-icons/heart-selected-icon.png',
                                height: 16,
                                width: 16,
                                color: !isFavourite ? Colors.grey : null,
                              ),
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _GetUrbanistFont(
          {double fontSize = 18, Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w500);
}
