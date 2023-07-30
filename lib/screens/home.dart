import 'package:events/providers/home_provider.dart';
import 'package:events/screens/event_detail.dart';
import 'package:events/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('E,MMM d ').format(dateTime);
  }

  String formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('  HH:mm a').format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeDataProvider>(context, listen: false);
    homeProvider.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeDataProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Events',
            style: GoogleFonts.inter(
                color: const Color(0xFF120D26),
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: Image.asset(
                  "assets/search.png",
                  width: 24,
                  height: 24,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: const Color(0xFF060518))
          ],
          elevation: 0,
        ),
 // ------------------------------BODY--------------------------------------------------       
        body: homeProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.grey,
              ))
            : ListView.builder(
                itemCount: homeProvider.dataModel.content!.data!.length,
                itemBuilder: (BuildContext context, index) {
                  String formattedDateTime = formatDateTime(
                      homeProvider.dataModel.content!.data![index].dateTime!);
                  String formattedTime = formatTime(
                      homeProvider.dataModel.content!.data![index].dateTime!);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: GestureDetector(                                   // Navigting to event_details page with passing arguments 
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventPageDetail(
                                      title: homeProvider
                                          .dataModel.content!.data![index].title
                                          .toString(),
                                      banner_image: homeProvider.dataModel
                                          .content!.data![index].bannerImage
                                          .toString(),
                                      description: homeProvider.dataModel
                                          .content!.data![index].description
                                          .toString(),
                                      date_time: homeProvider.dataModel.content!
                                          .data![index].dateTime
                                          .toString(),
                                      organiser_name: homeProvider.dataModel
                                          .content!.data![index].organiserName
                                          .toString(),
                                      organiser_icon: homeProvider.dataModel
                                          .content!.data![index].organiserIcon
                                          .toString(),
                                      venue_name: homeProvider.dataModel
                                          .content!.data![index].venueName
                                          .toString(),
                                      venue_country: homeProvider.dataModel
                                          .content!.data![index].venueCountry
                                          .toString(),
                                      venue_city: homeProvider.dataModel
                                          .content!.data![index].venueCity
                                          .toString(),
                                    )));},
//-----------------------------------CONTAINER DESIGN----------------------------------------------                     
                      child: Container(
                          width: 327,
                          height: 106,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0E443E14),
                                offset: Offset(0, 0),
                                blurRadius: 12,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
//----------------------------------BANNER - IMAGE------------------------------------------------                          
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    homeProvider.dataModel.content!.data![index]
                                        .bannerImage!,
                                    height: 92,
                                    width: 79,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
//-------------------------------------- DATE-TIME---------------------------------------------                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          formattedDateTime,
                                          style: GoogleFonts.inter(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue),
                                        ),
                                        Image.asset(
                                          "assets/black-circle.png",
                                          height: 5,
                                          width: 5,
                                          color: Colors.blue,
                                        ),
                                        Text(
                                          formattedTime,
                                          style: GoogleFonts.inter(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
//--------------------------------------------TITLE--------------------------------------------------                                    
                                    Text(
                                      homeProvider.dataModel.content!
                                          .data![index].title!,
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF120D26)),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
//--------------------------------------------lOCATION----------------------------------------------------------                                    
                                    Row(children: [
                                      Image.asset(
                                        'assets/location.png',
                                        height: 14,
                                        width: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          homeProvider.dataModel.content!
                                              .data![index].venueCity!,
                                          style: GoogleFonts.inter(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF747688))),
                                      const SizedBox(width: 5),
                                      Image.asset(
                                        "assets/black-circle.png",
                                        height: 5,
                                        width: 5,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        homeProvider.dataModel.content!
                                            .data![index].venueCountry!,
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF747688)),
                                      ),
                                    ])
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              ));
  }
}
