import 'package:events/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    void _performSearch(String query) async {
      setState(() {
        _isSearching = true;
      });
      await eventProvider.fetchEvents(query);
      setState(() {
        _isSearching = false;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Search',
          style: GoogleFonts.inter(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 32,
              child: TextField(
                controller: _searchController,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Type Event Name',
                  border: InputBorder.none,
                  prefixIcon: Image.asset(
                    "assets/search1.png",
                    height: 15,
                    width: 15,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
                onChanged: (query) => _performSearch(query),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isSearching
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.grey,
                    ))
                  : ListView.builder(
                      itemCount: eventProvider.events.length,
                      itemBuilder: (context, index) {
                        final event = eventProvider.events[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, right: 16),
                          child: GestureDetector(
                            onTap: () {},
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        event.bannerImage ?? '',
                                        height: 92,
                                        width: 79,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.dateTime ?? '',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          event.title ?? '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF120D26),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/location.png',
                                              height: 14,
                                              width: 14,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              event.venueCity ?? '',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF747688),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Image.asset(
                                              "assets/black-circle.png",
                                              height: 5,
                                              width: 5,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              event.venueCountry ?? '',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF747688),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
