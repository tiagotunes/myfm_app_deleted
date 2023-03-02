import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/size_config.dart';

class Country {
  final String name;
  final String flag;

  Country({required this.name, required this.flag});

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Country && name == other.name;

  @override
  int get hashCode => super.hashCode;
}

final List<Country> countries = [
  Country(name: 'Afghanistan', flag: 'assets/flags/af.svg'),
  Country(name: 'Aland Islands', flag: 'assets/flags/ax.svg'),
  Country(name: 'Albania', flag: 'assets/flags/al.svg'),
  Country(name: 'Algeria', flag: 'assets/flags/dz.svg'),
  Country(name: 'American Samoa', flag: 'assets/flags/as.svg'),
  Country(name: 'Andorra', flag: 'assets/flags/ad.svg'),
  Country(name: 'Angola', flag: 'assets/flags/ao.svg'),
  Country(name: 'Anguilla', flag: 'assets/flags/ai.svg'),
  Country(name: 'Antarctica', flag: 'assets/flags/aq.svg'),
  Country(name: 'Antigua and Barbuda', flag: 'assets/flags/ag.svg'),
  Country(name: 'Argentina', flag: 'assets/flags/ar.svg'),
  Country(name: 'Armenia', flag: 'assets/flags/am.svg'),
  Country(name: 'Aruba', flag: 'assets/flags/aw.svg'),
  Country(name: 'Australia', flag: 'assets/flags/au.svg'),
  Country(name: 'Austria', flag: 'assets/flags/at.svg'),
  Country(name: 'Azerbaijan', flag: 'assets/flags/az.svg'),
  Country(name: 'Bahamas', flag: 'assets/flags/bs.svg'),
  Country(name: 'Bahrain', flag: 'assets/flags/bh.svg'),
  Country(name: 'Bangladesh', flag: 'assets/flags/bd.svg'),
  Country(name: 'Barbados', flag: 'assets/flags/bb.svg'),
  Country(name: 'Belarus', flag: 'assets/flags/by.svg'),
  Country(name: 'Belgium', flag: 'assets/flags/be.svg'),
  Country(name: 'Belize', flag: 'assets/flags/bz.svg'),
  Country(name: 'Benin', flag: 'assets/flags/bj.svg'),
  Country(name: 'Bermuda', flag: 'assets/flags/bm.svg'),
  Country(name: 'Bhutan', flag: 'assets/flags/bt.svg'),
  Country(name: 'Bolivia', flag: 'assets/flags/bo.svg'),
  Country(name: 'Bonaire, Sint Eustatius and Saba', flag: 'assets/flags/bq.svg'),
  Country(name: 'Bosnia and Herzegovina', flag: 'assets/flags/ba.svg'),
  Country(name: 'Botswana', flag: 'assets/flags/bw.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
  // Country(name: 'null', flag: 'assets/flags/bj.svg'),
];

class MyCountryPicker extends StatefulWidget {
  final List<Country> countries;
  const MyCountryPicker({super.key, required this.countries});

  @override
  State<MyCountryPicker> createState() => _MyCountryPickerState();
}

class _MyCountryPickerState extends State<MyCountryPicker> {
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = widget.countries;
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries = widget.countries
          .where((country) =>
              country.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        children: [
          Text(
            'Select a nation',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
            onChanged: _filterCountries,
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: filteredCountries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: SvgPicture.asset(
                filteredCountries[index].flag,
                height: 20,
              ),
              title: Text(filteredCountries[index].name),
              onTap: () {
                Navigator.pop(context, filteredCountries[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

// return Stack(
//   children: [
//     Padding(
//       padding: EdgeInsets.fromLTRB(
//         getProportionateScreenWidth(10),
//         getProportionateScreenWidth(10),
//         getProportionateScreenWidth(10),
//         0.0,
//       ),
//       child: CSCPicker(
//         showStates: false,
//         showCities: false,
//         onCountryChanged: (c) {
//           nationCtr.text = c;
//           removeError(kCountryNullError);
//         },
//         onStateChanged: (state) {},
//         onCityChanged: (city) {},
//         countrySearchPlaceholder: "Search",
//         countryDropdownLabel: "Country",
//         dropdownDecoration: const BoxDecoration(color: Colors.black),
//         dropdownHeadingStyle: TextStyle(
//             fontSize: getProportionateScreenHeight(20),
//             fontWeight: FontWeight.bold,
//             color: Colors.black),
//         searchBarRadius: 20,
//       ),
//     ),
//     IgnorePointer(
//       ignoring: true,
//       child: TextFormField(
//         readOnly: true,
//         controller: nationCtr,
//         // onChanged: (value) {
//         //   errors.clear();
//         //   if (value.isNotEmpty) {
//         //     removeError(kCountryNullError);
//         //   }
//         // },
//         validator: (value) {
//           if (value!.isEmpty) {
//             addError(kPlayerNationNullError);
//             return "";
//           }
//           return null;
//         },
//         decoration: const InputDecoration(
//           labelText: 'Nation',
//           hintText: 'Choose player nation',
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           suffixIcon: Icon(Icons.flag_outlined),
//         ),
//       ),
//     ),
//   ],
// );