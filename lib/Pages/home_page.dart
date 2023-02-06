import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_assignment/Components/choose_category.dart';
import 'package:travel_app_assignment/Components/destination_poster.dart';
import 'package:travel_app_assignment/Components/destination_tab.dart';
import 'package:travel_app_assignment/Models/destination_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.grey.shade300),
                      const SizedBox(width: 10),
                      Text('Hello, Vineeta', style: _GetInterFont(fontSize: 18)),
                      Expanded(child: Container()),
                      Image.asset('assets/custom-icons/notification-icon.png')
                    ],
                  ),
                  const SizedBox(height: 30),
              Text('Where do you \nwant to explore today?',
                  style: _GetPoppinsFont(fontSize: 24)),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    style: _GetInterFont(fontSize: 16),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: _GetInterFont(color: Colors.grey),
                        hintText: 'Search'),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose Category', style: _GetInterFont()),
                  Text('See all',  style: _GetInterFont(fontSize: 14, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ChooseCategoryButton(imgURL: 'assets/custom-icons/beach-icon.png',label: 'Beach'),
                  const SizedBox(width: 20),
                  ChooseCategoryButton(imgURL: 'assets/custom-icons/mountain-icon.png',label: 'Mountain'),
                ],
              ),
              const SizedBox(height: 30),
                ],
              ),
            ),
            
            Container(
              height: 260,
              
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                itemCount: mockDestinationList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return DestinationPoster(destinationModel:mockDestinationList[index]);
                  
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Packages', style: _GetInterFont()),
                    Text('See all',  style: _GetInterFont(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              for(int i = 0; i < mockPackageList.length;i++)
              DestinationTab(destinationModel: mockPackageList[i]),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }

  TextStyle _GetPoppinsFont(
          {double fontSize = 18, Color color = Colors.black}) =>
      GoogleFonts.poppins(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
  TextStyle _GetInterFont({double fontSize = 16, Color color = Colors.black}) =>
      GoogleFonts.inter(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w500);
  TextStyle _GetUrbanistFont(
          {double fontSize = 18, Color color = Colors.black}) =>
      GoogleFonts.urbanist(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
}
