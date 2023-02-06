import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseCategoryButton extends StatefulWidget {
  String imgURL;
  String label;

  ChooseCategoryButton({super.key, required this.imgURL, required this.label});

  @override
  State<ChooseCategoryButton> createState() => _ChooseCategoryButtonState();
}

class _ChooseCategoryButtonState extends State<ChooseCategoryButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all( width: 1.5,color: isSelected ? Colors.green:Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Row(
            children: [
              Image.asset(widget.imgURL,height: 36,),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
