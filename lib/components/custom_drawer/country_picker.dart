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
];

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