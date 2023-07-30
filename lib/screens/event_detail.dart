import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventPageDetail extends StatefulWidget {
  final String title;
  final String description;
  final String banner_image;
  final String date_time;
  final String organiser_name;
  final String organiser_icon;
  final String venue_name;
  final String venue_country;
  final String venue_city;
  const EventPageDetail(
      {super.key,
      int? id,
      required this.title,
      required this.description,
      required this.banner_image,
      required this.date_time,
      required this.organiser_name,
      required this.organiser_icon,
      required this.venue_name,
      required this.venue_country,
      required this.venue_city});

  @override
  State<EventPageDetail> createState() => _EventPageDetailState();
}

class _EventPageDetailState extends State<EventPageDetail> {
  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('dd MMMM, y').format(dateTime);
  }

  String formatTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('EEEE, HH:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = formatDateTime(widget.date_time);
    String formattedTime = formatTime(widget.date_time);
    return Scaffold(
      body: Column(children: [
        Container(
            height: 203,
            width: 375,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                widget.banner_image,
              ),
            )),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 40, left: 5),
                        child: IconButton(
                          icon: Image.asset("assets/back.png",
                              width: 22, height: 22),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 1),
                      child: Text(
                        "Event Details",
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 40, left: 100),
                        child: Image.asset(
                          "assets/fav.png",
                          width: 36,
                          height: 36,
                        ))
                  ],
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.title,
            style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 35),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 51.68,
                  width: 270,
                  child: Row(
                    children: [
                      Image.network(
                        widget.organiser_icon,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/cycle.png");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.organiser_name,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFF0D0C26)),
                              ),
                              Text(
                                "Organizer",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF706E8F)),
                              ),
                            ]),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 51.68,
                  width: 250,
                  child: Row(
                    children: [
                      Image.asset("assets/Date.png"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formattedDateTime,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0XFF0D0C26)),
                              ),
                              Text(
                                formattedTime,
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF706E8F)),
                              ),
                            ]),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 51.68,
                  width: 330,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/drop.png"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.venue_name,
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0XFF0D0C26)),
                              ),
                              Row(children: [
                                Text(
                                  widget.venue_city + " , ",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF706E8F)),
                                ),
                                Text(
                                  widget.venue_country,
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF706E8F)),
                                ),
                              ])
                            ]),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Event',
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            )),
        Expanded(
          child: Container(),
        ),
        Container(
          height: 65,
          child: Image.asset(
            "assets/Button- Color.png",
            width: 271,
            //height: 58,
          ),
        ),
      ]),
    );
  }
}
