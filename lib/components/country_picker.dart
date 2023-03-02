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
  Country(name: 'Bosnia and Herzegovina', flag: 'assets/flags/ba.svg'),
  Country(name: 'Botswana', flag: 'assets/flags/bw.svg'),
  Country(name: 'Brazil', flag: 'assets/flags/br.svg'),
  Country(name: 'British Indian Ocean Territory', flag: 'assets/flags/io.svg'),
  Country(name: 'Brunei Darussalam', flag: 'assets/flags/bn.svg'),
  Country(name: 'Bulgaria', flag: 'assets/flags/bg.svg'),
  Country(name: 'Burkina Faso', flag: 'assets/flags/bf.svg'),
  Country(name: 'Burundi', flag: 'assets/flags/bi.svg'),
  Country(name: 'Cabo Verde', flag: 'assets/flags/cv.svg'),
  Country(name: 'Cambodia', flag: 'assets/flags/kh.svg'),
  Country(name: 'Cameroon', flag: 'assets/flags/cm.svg'),
  Country(name: 'Canada', flag: 'assets/flags/ca.svg'),
  Country(name: 'Cayman Islands', flag: 'assets/flags/ky.svg'),
  Country(name: 'Central African Republic', flag: 'assets/flags/cf.svg'),
  Country(name: 'Chad', flag: 'assets/flags/td.svg'),
  Country(name: 'Chile', flag: 'assets/flags/cl.svg'),
  Country(name: 'China', flag: 'assets/flags/cn.svg'),
  Country(name: 'Christmas Island', flag: 'assets/flags/cx.svg'),
  Country(name: 'Cocos (Keeling) Islands', flag: 'assets/flags/cc.svg'),
  Country(name: 'Colombia', flag: 'assets/flags/co.svg'),
  Country(name: 'Comoros', flag: 'assets/flags/km.svg'),
  Country(name: 'Cook Islands', flag: 'assets/flags/ck.svg'),
  Country(name: 'Costa Rica', flag: 'assets/flags/cr.svg'),
  Country(name: 'Croatia', flag: 'assets/flags/hr.svg'),
  Country(name: 'Cuba', flag: 'assets/flags/cu.svg'),
  Country(name: 'Curaçao', flag: 'assets/flags/cw.svg'),
  Country(name: 'Cyprus', flag: 'assets/flags/cy.svg'),
  Country(name: 'Czech Republic', flag: 'assets/flags/cz.svg'),
  Country(name: 'Democratic Republic of the Congo', flag: 'assets/flags/cd.svg'),
  Country(name: 'Denmark', flag: 'assets/flags/dk.svg'),
  Country(name: 'Djibouti', flag: 'assets/flags/dj.svg'),
  Country(name: 'Dominica', flag: 'assets/flags/dm.svg'),
  Country(name: 'Dominican Republic', flag: 'assets/flags/do.svg'),
  Country(name: 'Ecuador', flag: 'assets/flags/ec.svg'),
  Country(name: 'Egypt', flag: 'assets/flags/eg.svg'),
  Country(name: 'El Salvador', flag: 'assets/flags/sv.svg'),
  Country(name: 'England', flag: 'assets/flags/gb-eng.svg'),
  Country(name: 'Equatorial Guinea', flag: 'assets/flags/gq.svg'),
  Country(name: 'Eritrea', flag: 'assets/flags/er.svg'),
  Country(name: 'Estonia', flag: 'assets/flags/ee.svg'),
  Country(name: 'Eswatini', flag: 'assets/flags/sz.svg'),
  Country(name: 'Ethiopia', flag: 'assets/flags/et.svg'),
  Country(name: 'Faroe Islands', flag: 'assets/flags/fo.svg'),
  Country(name: 'Federated States of Micronesia', flag: 'assets/flags/fm.svg'),
  Country(name: 'Fiji', flag: 'assets/flags/fj.svg'),
  Country(name: 'Finland', flag: 'assets/flags/fi.svg'),
  Country(name: 'France', flag: 'assets/flags/fr.svg'),
  Country(name: 'Gabon', flag: 'assets/flags/ga.svg'),
  Country(name: 'Gambia', flag: 'assets/flags/gm.svg'),
  Country(name: 'Georgia', flag: 'assets/flags/ge.svg'),
  Country(name: 'Germany', flag: 'assets/flags/de.svg'),
  Country(name: 'Ghana', flag: 'assets/flags/gh.svg'),
  Country(name: 'Gibraltar', flag: 'assets/flags/gi.svg'),
  Country(name: 'Greece', flag: 'assets/flags/gr.svg'),
  Country(name: 'Greenland', flag: 'assets/flags/gl.svg'),
  Country(name: 'Guatemala', flag: 'assets/flags/gt.svg'),
  Country(name: 'Guinea', flag: 'assets/flags/gn.svg'),
  Country(name: 'Guinea-Bissau', flag: 'assets/flags/gw.svg'),
  Country(name: 'Guyana', flag: 'assets/flags/gy.svg'),
  Country(name: 'Haiti', flag: 'assets/flags/ht.svg'),
  Country(name: 'Holy See', flag: 'assets/flags/va.svg'),
  Country(name: 'Honduras', flag: 'assets/flags/hn.svg'),
  Country(name: 'Hong Kong', flag: 'assets/flags/hk.svg'),
  Country(name: 'Hungary', flag: 'assets/flags/hu.svg'),
  Country(name: 'Iceland', flag: 'assets/flags/is.svg'),
  Country(name: 'India', flag: 'assets/flags/in.svg'),
  Country(name: 'Indonesia', flag: 'assets/flags/id.svg'),
  Country(name: 'Iran', flag: 'assets/flags/ir.svg'),
  Country(name: 'Iraq', flag: 'assets/flags/iq.svg'),
  Country(name: 'Ireland  ', flag: 'assets/flags/ie.svg'),
  Country(name: 'Israel', flag: 'assets/flags/il.svg'),
  Country(name: 'Italy', flag: 'assets/flags/it.svg'),
  Country(name: "Ivory Cost (Côte d'Ivoire)", flag: 'assets/flags/ci.svg'),
  Country(name: 'Jamaica', flag: 'assets/flags/jm.svg'),
  Country(name: 'Japan', flag: 'assets/flags/jp.svg'),
  Country(name: 'Jordan', flag: 'assets/flags/jo.svg'),
  Country(name: 'Kazakhstan', flag: 'assets/flags/kz.svg'),
  Country(name: 'Kenya', flag: 'assets/flags/ke.svg'),
  Country(name: 'Kiribati', flag: 'assets/flags/ki.svg'),
  Country(name: 'Kosovo', flag: 'assets/flags/xk.svg'),
  Country(name: 'Kuwait', flag: 'assets/flags/kw.svg'),
  Country(name: 'Kyrgyzstan', flag: 'assets/flags/kg.svg'),
  Country(name: 'Laos', flag: 'assets/flags/la.svg'),
  Country(name: 'Latvia', flag: 'assets/flags/lv.svg'),
  Country(name: 'Lebanon', flag: 'assets/flags/lb.svg'),
  Country(name: 'Lesotho', flag: 'assets/flags/ls.svg'),
  Country(name: 'Liberia', flag: 'assets/flags/lr.svg'),
  Country(name: 'Libya', flag: 'assets/flags/ly.svg'),
  Country(name: 'Liechtenstein', flag: 'assets/flags/li.svg'),
  Country(name: 'Lithuania', flag: 'assets/flags/lt.svg'),
  Country(name: 'Luxembourg', flag: 'assets/flags/lu.svg'),
  Country(name: 'Madagascar', flag: 'assets/flags/mg.svg'),
  Country(name: 'Malawi', flag: 'assets/flags/mw.svg'),
  Country(name: 'Malaysia', flag: 'assets/flags/my.svg'),
  Country(name: 'Maldives', flag: 'assets/flags/mv.svg'),
  Country(name: 'Malta', flag: 'assets/flags/mt.svg'),
  Country(name: 'Marshall Islands', flag: 'assets/flags/mh.svg'),
  Country(name: 'Mauritania', flag: 'assets/flags/mr.svg'),
  Country(name: 'Mauritius', flag: 'assets/flags/mu.svg'),
  Country(name: 'Mexico', flag: 'assets/flags/mx.svg'),
  Country(name: 'Moldova', flag: 'assets/flags/md.svg'),
  Country(name: 'Mongolia', flag: 'assets/flags/mn.svg'),
  Country(name: 'Montenegro', flag: 'assets/flags/me.svg'),
  Country(name: 'Morocco', flag: 'assets/flags/ma.svg'),
  Country(name: 'Mozambique', flag: 'assets/flags/mz.svg'),
  Country(name: 'Myanmar', flag: 'assets/flags/mm.svg'),
  Country(name: 'Namibia', flag: 'assets/flags/na.svg'),
  Country(name: 'Nauru', flag: 'assets/flags/nr.svg'),
  Country(name: 'Nepal', flag: 'assets/flags/np.svg'),
  Country(name: 'Netherlands', flag: 'assets/flags/nl.svg'),
  Country(name: 'New Zealand', flag: 'assets/flags/nz.svg'),
  Country(name: 'Nicaragua', flag: 'assets/flags/ni.svg'),
  Country(name: 'Niger', flag: 'assets/flags/ne.svg'),
  Country(name: 'Nigeria', flag: 'assets/flags/ng.svg'),
  Country(name: 'Niue', flag: 'assets/flags/nu.svg'),
  Country(name: 'North Korea', flag: 'assets/flags/kp.svg'),
  Country(name: 'North Macedonia', flag: 'assets/flags/mk.svg'),
  Country(name: 'Northern Ireland', flag: 'assets/flags/gb-nir.svg'),
  Country(name: 'Norway', flag: 'assets/flags/no.svg'),
  Country(name: 'Oman', flag: 'assets/flags/om.svg'),
  Country(name: 'Pakistan', flag: 'assets/flags/pk.svg'),
  Country(name: 'Palau', flag: 'assets/flags/pw.svg'),
  Country(name: 'Panama', flag: 'assets/flags/pa.svg'),
  Country(name: 'Papua New Guinea', flag: 'assets/flags/pg.svg'),
  Country(name: 'Paraguay', flag: 'assets/flags/py.svg'),
  Country(name: 'Peru', flag: 'assets/flags/pe.svg'),
  Country(name: 'Philippines', flag: 'assets/flags/ph.svg'),
  Country(name: 'Poland', flag: 'assets/flags/pl.svg'),
  Country(name: 'Portugal', flag: 'assets/flags/pt.svg'),
  Country(name: 'Puerto Rico', flag: 'assets/flags/pr.svg'),
  Country(name: 'Qatar', flag: 'assets/flags/qa.svg'),
  Country(name: 'Republic of the Congo', flag: 'assets/flags/cg.svg'),
  Country(name: 'Romania', flag: 'assets/flags/ro.svg'),
  Country(name: 'Russia', flag: 'assets/flags/ru.svg'),
  Country(name: 'Rwanda', flag: 'assets/flags/rw.svg'),
  Country(name: 'Samoa', flag: 'assets/flags/ws.svg'),
  Country(name: 'San Marino', flag: 'assets/flags/sm.svg'),
  Country(name: 'Sao Tome and Principe', flag: 'assets/flags/st.svg'),
  Country(name: 'Saudi Arabia', flag: 'assets/flags/sa.svg'),
  Country(name: 'Scotland', flag: 'assets/flags/gb-sct.svg'),
  Country(name: 'Senegal', flag: 'assets/flags/sn.svg'),
  Country(name: 'Serbia', flag: 'assets/flags/rs.svg'),
  Country(name: 'Seychelles', flag: 'assets/flags/sc.svg'),
  Country(name: 'Sierra Leone', flag: 'assets/flags/sl.svg'),
  Country(name: 'Singapore', flag: 'assets/flags/sg.svg'),
  Country(name: 'Slovakia', flag: 'assets/flags/sk.svg'),
  Country(name: 'Slovenia', flag: 'assets/flags/si.svg'),
  Country(name: 'Solomon Islands', flag: 'assets/flags/sb.svg'),
  Country(name: 'Somalia', flag: 'assets/flags/so.svg'),
  Country(name: 'South Africa', flag: 'assets/flags/za.svg'),
  Country(name: 'South Korea', flag: 'assets/flags/kr.svg'),
  Country(name: 'South Sudan', flag: 'assets/flags/ss.svg'),
  Country(name: 'Spain', flag: 'assets/flags/es.svg'),
  Country(name: 'Sri Lanka', flag: 'assets/flags/lk.svg'),
  Country(name: 'Palestine', flag: 'assets/flags/ps.svg'),
  Country(name: 'Sudan', flag: 'assets/flags/sd.svg'),
  Country(name: 'Suriname', flag: 'assets/flags/sr.svg'),
  Country(name: 'Sweden', flag: 'assets/flags/se.svg'),
  Country(name: 'Switzerland', flag: 'assets/flags/ch.svg'),
  Country(name: 'Syria', flag: 'assets/flags/sy.svg'),
  Country(name: 'Taiwan', flag: 'assets/flags/tw.svg'),
  Country(name: 'Tajikistan', flag: 'assets/flags/tj.svg'),
  Country(name: 'Tanzania', flag: 'assets/flags/tz.svg'),
  Country(name: 'Thailand', flag: 'assets/flags/th.svg'),
  Country(name: 'Timor-Leste', flag: 'assets/flags/tl.svg'),
  Country(name: 'Tonga', flag: 'assets/flags/to.svg'),
  Country(name: 'Trinidad and Tobago', flag: 'assets/flags/tt.svg'),
  Country(name: 'Tunisia', flag: 'assets/flags/tn.svg'),
  Country(name: 'Turkey', flag: 'assets/flags/tr.svg'),
  Country(name: 'Turkmenistan', flag: 'assets/flags/tm.svg'),
  Country(name: 'Tuvalu', flag: 'assets/flags/tv.svg'),
  Country(name: 'Uganda', flag: 'assets/flags/ug.svg'),
  Country(name: 'Ukraine', flag: 'assets/flags/ua.svg'),
  Country(name: 'United Arab Emirates', flag: 'assets/flags/ae.svg'),
  Country(name: 'United States of America', flag: 'assets/flags/us.svg'),
  Country(name: 'Uruguay', flag: 'assets/flags/uy.svg'),
  Country(name: 'Uzbekistan', flag: 'assets/flags/uz.svg'),
  Country(name: 'Vanuatu', flag: 'assets/flags/vu.svg'),
  Country(name: 'Venezuela', flag: 'assets/flags/ve.svg'),
  Country(name: 'Vietnam', flag: 'assets/flags/vn.svg'),
  Country(name: 'Virgin Islands', flag: 'assets/flags/vg.svg'),
  Country(name: 'Wales', flag: 'assets/flags/gb-wls.svg'),
  Country(name: 'Yemen', flag: 'assets/flags/ye.svg'),
  Country(name: 'Zambia', flag: 'assets/flags/zm.svg'),
  Country(name: 'Zimbabwe', flag: 'assets/flags/zw.svg'),
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
                height: getProportionateScreenWidth(25),
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