import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryCodeSelector extends StatefulWidget {
  const CountryCodeSelector({super.key , required this.darkModeOn});
  final bool darkModeOn;
  @override
  State<CountryCodeSelector> createState() => _CountryCodeSelectorState();
}

class _CountryCodeSelectorState extends State<CountryCodeSelector> {

  List countries = [];
  List filteredCountries = [];
  final TextEditingController _searchController = TextEditingController();
  var selectedCountry = {};

  @override
  void initState() {
    super.initState();
    loadCountriesFromJson();
    
  }


  Future<void> loadCountriesFromJson() async {
    String jsonString = await rootBundle.loadString('packages/phonenumber_input/assets/directory.json');
    final data = await json.decode(jsonString);
    setState(() {
      countries = data;
      filteredCountries = countries;
    });

    
  }


  void searchCountry(String query) {
    List filterCountries = [];
    filterCountries.addAll(countries);
    if(query.isNotEmpty) {
      List tempCountries = [];
      for (var country in filterCountries) {
        if(country['name'].toString().toLowerCase().contains(query.toLowerCase())) {
          tempCountries.add(country);
        }
      }
      setState(() {
        filteredCountries = tempCountries;
      });
      return;
    } else {
      setState(() {
        filteredCountries = countries;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.darkModeOn ? const Color.fromARGB(221, 48, 48, 48) : Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            backgroundColor: widget.darkModeOn ? const Color.fromARGB(221, 48, 48, 48) : Colors.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_rounded , color: widget.darkModeOn ? Colors.white : Colors.black,),
            ),
            title: Text("Country Code" , style: TextStyle(
              color: widget.darkModeOn ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),),
            centerTitle: true,
            
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: widget.darkModeOn ? const Color.fromARGB(221, 48, 48, 48) : Colors.white,
              title: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (value) => searchCountry(value),
                     style: TextStyle(
                        color: widget.darkModeOn ? Colors.white : const Color.fromRGBO(46, 46, 46, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: widget.darkModeOn ? Colors.white : const Color.fromRGBO(46, 46, 46, 1),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      hintStyle: TextStyle(
                        color: widget.darkModeOn ? Colors.white30 : const Color.fromRGBO(46, 46, 46, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context , index) => ListTile(
                onTap: () {
                  setState(() {
                    selectedCountry = filteredCountries[index];
                  });
                  Navigator.pop(context , selectedCountry);
                },
                title: Text(filteredCountries[index]['name'], style: TextStyle(
                  color: widget.darkModeOn ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),),
                subtitle: Text(filteredCountries[index]['dial_code'] , style: TextStyle(
                  color: widget.darkModeOn ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),),
                trailing: Icon(Icons.arrow_forward_ios_rounded , color: widget.darkModeOn ? Colors.white : Colors.black,),
              ),
              childCount: filteredCountries.length,
            ),
          ),
        ],
      )
    );
  }
}