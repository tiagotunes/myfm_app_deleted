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
  Country(name: 'Afghanistan', flag: 'assets/flagsv2/af.svg'),
  Country(name: 'Aland Islands', flag: 'assets/flagsv2/ax.svg'),
  Country(name: 'Albania', flag: 'assets/flagsv2/al.svg'),
  Country(name: 'Algeria', flag: 'assets/flagsv2/dz.svg'),
  Country(name: 'American Samoa', flag: 'assets/flagsv2/as.svg'),
  Country(name: 'Andorra', flag: 'assets/flagsv2/ad.svg'),
  Country(name: 'Angola', flag: 'assets/flagsv2/ao.svg'),
  Country(name: 'Anguilla', flag: 'assets/flagsv2/ai.svg'),
  Country(name: 'Antarctica', flag: 'assets/flagsv2/aq.svg'),
  Country(name: 'Antigua and Barbuda', flag: 'assets/flagsv2/ag.svg'),
  Country(name: 'Argentina', flag: 'assets/flagsv2/ar.svg'),
  Country(name: 'Armenia', flag: 'assets/flagsv2/am.svg'),
  Country(name: 'Aruba', flag: 'assets/flagsv2/aw.svg'),
  Country(name: 'Australia', flag: 'assets/flagsv2/au.svg'),
  Country(name: 'Austria', flag: 'assets/flagsv2/at.svg'),
  Country(name: 'Azerbaijan', flag: 'assets/flagsv2/az.svg'),
  Country(name: 'Bahamas', flag: 'assets/flagsv2/bs.svg'),
  Country(name: 'Bahrain', flag: 'assets/flagsv2/bh.svg'),
  Country(name: 'Bangladesh', flag: 'assets/flagsv2/bd.svg'),
  Country(name: 'Barbados', flag: 'assets/flagsv2/bb.svg'),
  Country(name: 'Belarus', flag: 'assets/flagsv2/by.svg'),
  Country(name: 'Belgium', flag: 'assets/flagsv2/be.svg'),
  Country(name: 'Belize', flag: 'assets/flagsv2/bz.svg'),
  Country(name: 'Benin', flag: 'assets/flagsv2/bj.svg'),
  Country(name: 'Bermuda', flag: 'assets/flagsv2/bm.svg'),
  Country(name: 'Bhutan', flag: 'assets/flagsv2/bt.svg'),
  Country(name: 'Bolivia', flag: 'assets/flagsv2/bo.svg'),
  Country(name: 'Bosnia and Herzegovina', flag: 'assets/flagsv2/ba.svg'),
  Country(name: 'Botswana', flag: 'assets/flagsv2/bw.svg'),
  Country(name: 'Brazil', flag: 'assets/flagsv2/br.svg'),
  Country(name: 'British Indian Ocean Territory', flag: 'assets/flagsv2/io.svg'),
  Country(name: 'Brunei Darussalam', flag: 'assets/flagsv2/bn.svg'),
  Country(name: 'Bulgaria', flag: 'assets/flagsv2/bg.svg'),
  Country(name: 'Burkina Faso', flag: 'assets/flagsv2/bf.svg'),
  Country(name: 'Burundi', flag: 'assets/flagsv2/bi.svg'),
  Country(name: 'Cabo Verde', flag: 'assets/flagsv2/cv.svg'),
  Country(name: 'Cambodia', flag: 'assets/flagsv2/kh.svg'),
  Country(name: 'Cameroon', flag: 'assets/flagsv2/cm.svg'),
  Country(name: 'Canada', flag: 'assets/flagsv2/ca.svg'),
  Country(name: 'Cayman Islands', flag: 'assets/flagsv2/ky.svg'),
  Country(name: 'Central African Republic', flag: 'assets/flagsv2/cf.svg'),
  Country(name: 'Chad', flag: 'assets/flagsv2/td.svg'),
  Country(name: 'Chile', flag: 'assets/flagsv2/cl.svg'),
  Country(name: 'China', flag: 'assets/flagsv2/cn.svg'),
  Country(name: 'Christmas Island', flag: 'assets/flagsv2/cx.svg'),
  Country(name: 'Cocos (Keeling) Islands', flag: 'assets/flagsv2/cc.svg'),
  Country(name: 'Colombia', flag: 'assets/flagsv2/co.svg'),
  Country(name: 'Comoros', flag: 'assets/flagsv2/km.svg'),
  Country(name: 'Cook Islands', flag: 'assets/flagsv2/ck.svg'),
  Country(name: 'Costa Rica', flag: 'assets/flagsv2/cr.svg'),
  Country(name: 'Croatia', flag: 'assets/flagsv2/hr.svg'),
  Country(name: 'Cuba', flag: 'assets/flagsv2/cu.svg'),
  Country(name: 'Curaçao', flag: 'assets/flagsv2/cw.svg'),
  Country(name: 'Cyprus', flag: 'assets/flagsv2/cy.svg'),
  Country(name: 'Czech Republic', flag: 'assets/flagsv2/cz.svg'),
  Country(name: 'Democratic Republic of the Congo', flag: 'assets/flagsv2/cd.svg'),
  Country(name: 'Denmark', flag: 'assets/flagsv2/dk.svg'),
  Country(name: 'Djibouti', flag: 'assets/flagsv2/dj.svg'),
  Country(name: 'Dominica', flag: 'assets/flagsv2/dm.svg'),
  Country(name: 'Dominican Republic', flag: 'assets/flagsv2/do.svg'),
  Country(name: 'Ecuador', flag: 'assets/flagsv2/ec.svg'),
  Country(name: 'Egypt', flag: 'assets/flagsv2/eg.svg'),
  Country(name: 'El Salvador', flag: 'assets/flagsv2/sv.svg'),
  Country(name: 'England', flag: 'assets/flagsv2/gb-eng.svg'),
  Country(name: 'Equatorial Guinea', flag: 'assets/flagsv2/gq.svg'),
  Country(name: 'Eritrea', flag: 'assets/flagsv2/er.svg'),
  Country(name: 'Estonia', flag: 'assets/flagsv2/ee.svg'),
  Country(name: 'Eswatini', flag: 'assets/flagsv2/sz.svg'),
  Country(name: 'Ethiopia', flag: 'assets/flagsv2/et.svg'),
  Country(name: 'Faroe Islands', flag: 'assets/flagsv2/fo.svg'),
  Country(name: 'Federated States of Micronesia', flag: 'assets/flagsv2/fm.svg'),
  Country(name: 'Fiji', flag: 'assets/flagsv2/fj.svg'),
  Country(name: 'Finland', flag: 'assets/flagsv2/fi.svg'),
  Country(name: 'France', flag: 'assets/flagsv2/fr.svg'),
  Country(name: 'Gabon', flag: 'assets/flagsv2/ga.svg'),
  Country(name: 'Gambia', flag: 'assets/flagsv2/gm.svg'),
  Country(name: 'Georgia', flag: 'assets/flagsv2/ge.svg'),
  Country(name: 'Germany', flag: 'assets/flagsv2/de.svg'),
  Country(name: 'Ghana', flag: 'assets/flagsv2/gh.svg'),
  Country(name: 'Gibraltar', flag: 'assets/flagsv2/gi.svg'),
  Country(name: 'Greece', flag: 'assets/flagsv2/gr.svg'),
  Country(name: 'Greenland', flag: 'assets/flagsv2/gl.svg'),
  Country(name: 'Guatemala', flag: 'assets/flagsv2/gt.svg'),
  Country(name: 'Guinea', flag: 'assets/flagsv2/gn.svg'),
  Country(name: 'Guinea-Bissau', flag: 'assets/flagsv2/gw.svg'),
  Country(name: 'Guyana', flag: 'assets/flagsv2/gy.svg'),
  Country(name: 'Haiti', flag: 'assets/flagsv2/ht.svg'),
  Country(name: 'Honduras', flag: 'assets/flagsv2/hn.svg'),
  Country(name: 'Hong Kong', flag: 'assets/flagsv2/hk.svg'),
  Country(name: 'Hungary', flag: 'assets/flagsv2/hu.svg'),
  Country(name: 'Iceland', flag: 'assets/flagsv2/is.svg'),
  Country(name: 'India', flag: 'assets/flagsv2/in.svg'),
  Country(name: 'Indonesia', flag: 'assets/flagsv2/id.svg'),
  Country(name: 'Iran', flag: 'assets/flagsv2/ir.svg'),
  Country(name: 'Iraq', flag: 'assets/flagsv2/iq.svg'),
  Country(name: 'Ireland  ', flag: 'assets/flagsv2/ie.svg'),
  Country(name: 'Israel', flag: 'assets/flagsv2/il.svg'),
  Country(name: 'Italy', flag: 'assets/flagsv2/it.svg'),
  Country(name: "Ivory Cost (Côte d'Ivoire)", flag: 'assets/flagsv2/ci.svg'),
  Country(name: 'Jamaica', flag: 'assets/flagsv2/jm.svg'),
  Country(name: 'Japan', flag: 'assets/flagsv2/jp.svg'),
  Country(name: 'Jordan', flag: 'assets/flagsv2/jo.svg'),
  Country(name: 'Kazakhstan', flag: 'assets/flagsv2/kz.svg'),
  Country(name: 'Kenya', flag: 'assets/flagsv2/ke.svg'),
  Country(name: 'Kiribati', flag: 'assets/flagsv2/ki.svg'),
  Country(name: 'Kosovo', flag: 'assets/flagsv2/xk.svg'),
  Country(name: 'Kuwait', flag: 'assets/flagsv2/kw.svg'),
  Country(name: 'Kyrgyzstan', flag: 'assets/flagsv2/kg.svg'),
  Country(name: 'Laos', flag: 'assets/flagsv2/la.svg'),
  Country(name: 'Latvia', flag: 'assets/flagsv2/lv.svg'),
  Country(name: 'Lebanon', flag: 'assets/flagsv2/lb.svg'),
  Country(name: 'Lesotho', flag: 'assets/flagsv2/ls.svg'),
  Country(name: 'Liberia', flag: 'assets/flagsv2/lr.svg'),
  Country(name: 'Libya', flag: 'assets/flagsv2/ly.svg'),
  Country(name: 'Liechtenstein', flag: 'assets/flagsv2/li.svg'),
  Country(name: 'Lithuania', flag: 'assets/flagsv2/lt.svg'),
  Country(name: 'Luxembourg', flag: 'assets/flagsv2/lu.svg'),
  Country(name: 'Madagascar', flag: 'assets/flagsv2/mg.svg'),
  Country(name: 'Malawi', flag: 'assets/flagsv2/mw.svg'),
  Country(name: 'Malaysia', flag: 'assets/flagsv2/my.svg'),
  Country(name: 'Maldives', flag: 'assets/flagsv2/mv.svg'),
  Country(name: 'Malta', flag: 'assets/flagsv2/mt.svg'),
  Country(name: 'Marshall Islands', flag: 'assets/flagsv2/mh.svg'),
  Country(name: 'Mauritania', flag: 'assets/flagsv2/mr.svg'),
  Country(name: 'Mauritius', flag: 'assets/flagsv2/mu.svg'),
  Country(name: 'Mexico', flag: 'assets/flagsv2/mx.svg'),
  Country(name: 'Moldova', flag: 'assets/flagsv2/md.svg'),
  Country(name: 'Mongolia', flag: 'assets/flagsv2/mn.svg'),
  Country(name: 'Montenegro', flag: 'assets/flagsv2/me.svg'),
  Country(name: 'Morocco', flag: 'assets/flagsv2/ma.svg'),
  Country(name: 'Mozambique', flag: 'assets/flagsv2/mz.svg'),
  Country(name: 'Myanmar', flag: 'assets/flagsv2/mm.svg'),
  Country(name: 'Namibia', flag: 'assets/flagsv2/na.svg'),
  Country(name: 'Nauru', flag: 'assets/flagsv2/nr.svg'),
  Country(name: 'Nepal', flag: 'assets/flagsv2/np.svg'),
  Country(name: 'Netherlands', flag: 'assets/flagsv2/nl.svg'),
  Country(name: 'New Zealand', flag: 'assets/flagsv2/nz.svg'),
  Country(name: 'Nicaragua', flag: 'assets/flagsv2/ni.svg'),
  Country(name: 'Niger', flag: 'assets/flagsv2/ne.svg'),
  Country(name: 'Nigeria', flag: 'assets/flagsv2/ng.svg'),
  Country(name: 'Niue', flag: 'assets/flagsv2/nu.svg'),
  Country(name: 'North Korea', flag: 'assets/flagsv2/kp.svg'),
  Country(name: 'North Macedonia', flag: 'assets/flagsv2/mk.svg'),
  Country(name: 'Norway', flag: 'assets/flagsv2/no.svg'),
  Country(name: 'Oman', flag: 'assets/flagsv2/om.svg'),
  Country(name: 'Pakistan', flag: 'assets/flagsv2/pk.svg'),
  Country(name: 'Palau', flag: 'assets/flagsv2/pw.svg'),
  Country(name: 'Panama', flag: 'assets/flagsv2/pa.svg'),
  Country(name: 'Papua New Guinea', flag: 'assets/flagsv2/pg.svg'),
  Country(name: 'Paraguay', flag: 'assets/flagsv2/py.svg'),
  Country(name: 'Peru', flag: 'assets/flagsv2/pe.svg'),
  Country(name: 'Philippines', flag: 'assets/flagsv2/ph.svg'),
  Country(name: 'Poland', flag: 'assets/flagsv2/pl.svg'),
  Country(name: 'Portugal', flag: 'assets/flagsv2/pt.svg'),
  Country(name: 'Puerto Rico', flag: 'assets/flagsv2/pr.svg'),
  Country(name: 'Qatar', flag: 'assets/flagsv2/qa.svg'),
  Country(name: 'Republic of the Congo', flag: 'assets/flagsv2/cg.svg'),
  Country(name: 'Romania', flag: 'assets/flagsv2/ro.svg'),
  Country(name: 'Russia', flag: 'assets/flagsv2/ru.svg'),
  Country(name: 'Rwanda', flag: 'assets/flagsv2/rw.svg'),
  Country(name: 'Samoa', flag: 'assets/flagsv2/ws.svg'),
  Country(name: 'San Marino', flag: 'assets/flagsv2/sm.svg'),
  Country(name: 'Sao Tome and Principe', flag: 'assets/flagsv2/st.svg'),
  Country(name: 'Saudi Arabia', flag: 'assets/flagsv2/sa.svg'),
  Country(name: 'Scotland', flag: 'assets/flagsv2/gb-sct.svg'),
  Country(name: 'Senegal', flag: 'assets/flagsv2/sn.svg'),
  Country(name: 'Serbia', flag: 'assets/flagsv2/rs.svg'),
  Country(name: 'Seychelles', flag: 'assets/flagsv2/sc.svg'),
  Country(name: 'Sierra Leone', flag: 'assets/flagsv2/sl.svg'),
  Country(name: 'Singapore', flag: 'assets/flagsv2/sg.svg'),
  Country(name: 'Slovakia', flag: 'assets/flagsv2/sk.svg'),
  Country(name: 'Slovenia', flag: 'assets/flagsv2/si.svg'),
  Country(name: 'Solomon Islands', flag: 'assets/flagsv2/sb.svg'),
  Country(name: 'Somalia', flag: 'assets/flagsv2/so.svg'),
  Country(name: 'South Africa', flag: 'assets/flagsv2/za.svg'),
  Country(name: 'South Korea', flag: 'assets/flagsv2/kr.svg'),
  Country(name: 'South Sudan', flag: 'assets/flagsv2/ss.svg'),
  Country(name: 'Spain', flag: 'assets/flagsv2/es.svg'),
  Country(name: 'Sri Lanka', flag: 'assets/flagsv2/lk.svg'),
  Country(name: 'Sudan', flag: 'assets/flagsv2/sd.svg'),
  Country(name: 'Suriname', flag: 'assets/flagsv2/sr.svg'),
  Country(name: 'Sweden', flag: 'assets/flagsv2/se.svg'),
  Country(name: 'Switzerland', flag: 'assets/flagsv2/ch.svg'),
  Country(name: 'Syria', flag: 'assets/flagsv2/sy.svg'),
  Country(name: 'Taiwan', flag: 'assets/flagsv2/tw.svg'),
  Country(name: 'Tajikistan', flag: 'assets/flagsv2/tj.svg'),
  Country(name: 'Tanzania', flag: 'assets/flagsv2/tz.svg'),
  Country(name: 'Thailand', flag: 'assets/flagsv2/th.svg'),
  Country(name: 'Timor-Leste', flag: 'assets/flagsv2/tl.svg'),
  Country(name: 'Tonga', flag: 'assets/flagsv2/to.svg'),
  Country(name: 'Trinidad and Tobago', flag: 'assets/flagsv2/tt.svg'),
  Country(name: 'Tunisia', flag: 'assets/flagsv2/tn.svg'),
  Country(name: 'Turkey', flag: 'assets/flagsv2/tr.svg'),
  Country(name: 'Turkmenistan', flag: 'assets/flagsv2/tm.svg'),
  Country(name: 'Tuvalu', flag: 'assets/flagsv2/tv.svg'),
  Country(name: 'Uganda', flag: 'assets/flagsv2/ug.svg'),
  Country(name: 'Ukraine', flag: 'assets/flagsv2/ua.svg'),
  Country(name: 'United Arab Emirates', flag: 'assets/flagsv2/ae.svg'),
  Country(name: 'United Kingdom', flag: 'assets/flagsv2/uk.svg'),
  Country(name: 'United States of America', flag: 'assets/flagsv2/us.svg'),
  Country(name: 'Uruguay', flag: 'assets/flagsv2/uy.svg'),
  Country(name: 'Uzbekistan', flag: 'assets/flagsv2/uz.svg'),
  Country(name: 'Vanuatu', flag: 'assets/flagsv2/vu.svg'),
  Country(name: 'Vatican', flag: 'assets/flagsv2/va.svg'),
  Country(name: 'Venezuela', flag: 'assets/flagsv2/ve.svg'),
  Country(name: 'Vietnam', flag: 'assets/flagsv2/vn.svg'),
  Country(name: 'Virgin Islands', flag: 'assets/flagsv2/vg.svg'),
  Country(name: 'Wales', flag: 'assets/flagsv2/gb-wls.svg'),
  Country(name: 'Yemen', flag: 'assets/flagsv2/ye.svg'),
  Country(name: 'Zambia', flag: 'assets/flagsv2/zm.svg'),
  Country(name: 'Zimbabwe', flag: 'assets/flagsv2/zw.svg'),
];
// Missing: Guadalupe, Northern Ireland, Palestine

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
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
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
                height: getProportionateScreenWidth(40),
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