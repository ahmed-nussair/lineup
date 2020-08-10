import 'package:flutter/material.dart';
import 'package:lineup/ui/screen_util.dart';

class CountryCode extends StatefulWidget {

  final Function(String) onCountryCodeSelected;

  CountryCode({@required this.onCountryCodeSelected});

  @override
  _CountryCodeState createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {

  List _list;

  @override
  void initState() {
    _list = countryCodes;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(

        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(ScreenUtil().setWidth(50)),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setWidth(50)),
                topRight: Radius.circular(ScreenUtil().setWidth(50)),
              ),
              color: Color(0xffFC550A),
            ),
            child: Text('Select Country Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(50),
              ),
            ),
          ),
          TextField(
            onChanged: (value) {
              if(value.trim().isEmpty) {
                setState(() {
                  _list = countryCodes;
                });
                return;
              }
              List newList = List();
              for (var item in countryCodes) {
                String name = item['name'];

                if(name.toLowerCase().contains(value.toLowerCase())) {
                  newList.add(item);
                }

                setState(() {
                  _list = newList;
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              hintText: 'Search'
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: List.generate(_list.length, (index){
                return _countryCodeItem(index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _countryCodeItem(int index) {
    return GestureDetector(
      onTap: () {
        widget.onCountryCodeSelected('+${_list[index]['code']}');
        Navigator.of(context).pop();
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  child: Image.asset(
                    _list[index]['flag'],
                    width: ScreenUtil().setWidth(100),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text(_list[index]['name'],
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(40),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text('+${_list[index]['code']}',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(40),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

final countryCodes = [
  {
    "code":"93",
    "name":"Afghanistan",
    "flag":"assets/flags/afg.png"
  },
  {
    "code":"358",
    "name":"Åland Islands",
    "flag":"assets/flags/ala.png"
  },
  {
    "code":"355",
    "name":"Albania",
    "flag":"assets/flags/alb.png"
  },
  {
    "code":"213",
    "name":"Algeria",
    "flag":"assets/flags/dza.png"
  },
  {
    "code":"1684",
    "name":"American Samoa",
    "flag":"assets/flags/asm.png"
  },
  {
    "code":"376",
    "name":"Andorra",
    "flag":"assets/flags/and.png"
  },
  {
    "code":"244",
    "name":"Angola",
    "flag":"assets/flags/ago.png"
  },
  {
    "code":"1264",
    "name":"Anguilla",
    "flag":"assets/flags/aia.png"
  },
  {
    "code":"672",
    "name":"Antarctica",
    "flag":"assets/flags/ata.png"
  },
  {
    "code":"1268",
    "name":"Antigua and Barbuda",
    "flag":"assets/flags/atg.png"
  },
  {
    "code":"54",
    "name":"Argentina",
    "flag":"assets/flags/arg.png"
  },
  {
    "code":"374",
    "name":"Armenia",
    "flag":"assets/flags/arm.png"
  },
  {
    "code":"297",
    "name":"Aruba",
    "flag":"assets/flags/abw.png"
  },
  {
    "code":"61",
    "name":"Australia",
    "flag":"assets/flags/aus.png"
  },
  {
    "code":"43",
    "name":"Austria",
    "flag":"assets/flags/aut.png"
  },
  {
    "code":"994",
    "name":"Azerbaijan",
    "flag":"assets/flags/aze.png"
  },
  {
    "code":"1242",
    "name":"Bahamas",
    "flag":"assets/flags/bhs.png"
  },
  {
    "code":"973",
    "name":"Bahrain",
    "flag":"assets/flags/bhr.png"
  },
  {
    "code":"880",
    "name":"Bangladesh",
    "flag":"assets/flags/bgd.png"
  },
  {
    "code":"1246",
    "name":"Barbados",
    "flag":"assets/flags/brb.png"
  },
  {
    "code":"375",
    "name":"Belarus",
    "flag":"assets/flags/blr.png"
  },
  {
    "code":"32",
    "name":"Belgium",
    "flag":"assets/flags/bel.png"
  },
  {
    "code":"501",
    "name":"Belize",
    "flag":"assets/flags/blz.png"
  },
  {
    "code":"229",
    "name":"Benin",
    "flag":"assets/flags/ben.png"
  },
  {
    "code":"1441",
    "name":"Bermuda",
    "flag":"assets/flags/bmu.png"
  },
  {
    "code":"975",
    "name":"Bhutan",
    "flag":"assets/flags/btn.png"
  },
  {
    "code":"591",
    "name":"Bolivia (Plurinational State of)",
    "flag":"assets/flags/bol.png"
  },
  {
    "code":"5997",
    "name":"Bonaire, Sint Eustatius and Saba",
    "flag":"assets/flags/bes.png"
  },
  {
    "code":"387",
    "name":"Bosnia and Herzegovina",
    "flag":"assets/flags/bih.png"
  },
  {
    "code":"267",
    "name":"Botswana",
    "flag":"assets/flags/bwa.png"
  },
  {
    "code":"55",
    "name":"Brazil",
    "flag":"assets/flags/bra.png"
  },
  {
    "code":"246",
    "name":"British Indian Ocean Territory",
    "flag":"assets/flags/iot.png"
  },
  {
    "code":"1284",
    "name":"Virgin Islands (British)",
    "flag":"assets/flags/vgb.png"
  },
  {
    "code":"1 340",
    "name":"Virgin Islands (U.S.)",
    "flag":"assets/flags/vir.png"
  },
  {
    "code":"673",
    "name":"Brunei Darussalam",
    "flag":"assets/flags/brn.png"
  },
  {
    "code":"359",
    "name":"Bulgaria",
    "flag":"assets/flags/bgr.png"
  },
  {
    "code":"226",
    "name":"Burkina Faso",
    "flag":"assets/flags/bfa.png"
  },
  {
    "code":"257",
    "name":"Burundi",
    "flag":"assets/flags/bdi.png"
  },
  {
    "code":"855",
    "name":"Cambodia",
    "flag":"assets/flags/khm.png"
  },
  {
    "code":"237",
    "name":"Cameroon",
    "flag":"assets/flags/cmr.png"
  },
  {
    "code":"1",
    "name":"Canada",
    "flag":"assets/flags/can.png"
  },
  {
    "code":"238",
    "name":"Cabo Verde",
    "flag":"assets/flags/cpv.png"
  },
  {
    "code":"1345",
    "name":"Cayman Islands",
    "flag":"assets/flags/cym.png"
  },
  {
    "code":"236",
    "name":"Central African Republic",
    "flag":"assets/flags/caf.png"
  },
  {
    "code":"235",
    "name":"Chad",
    "flag":"assets/flags/tcd.png"
  },
  {
    "code":"56",
    "name":"Chile",
    "flag":"assets/flags/chl.png"
  },
  {
    "code":"86",
    "name":"China",
    "flag":"assets/flags/chn.png"
  },
  {
    "code":"61",
    "name":"Christmas Island",
    "flag":"assets/flags/cxr.png"
  },
  {
    "code":"61",
    "name":"Cocos (Keeling) Islands",
    "flag":"assets/flags/cck.png"
  },
  {
    "code":"57",
    "name":"Colombia",
    "flag":"assets/flags/col.png"
  },
  {
    "code":"269",
    "name":"Comoros",
    "flag":"assets/flags/com.png"
  },
  {
    "code":"242",
    "name":"Congo",
    "flag":"assets/flags/cog.png"
  },
  {
    "code":"243",
    "name":"Congo (Democratic Republic of the)",
    "flag":"assets/flags/cod.png"
  },
  {
    "code":"682",
    "name":"Cook Islands",
    "flag":"assets/flags/cok.png"
  },
  {
    "code":"506",
    "name":"Costa Rica",
    "flag":"assets/flags/cri.png"
  },
  {
    "code":"385",
    "name":"Croatia",
    "flag":"assets/flags/hrv.png"
  },
  {
    "code":"53",
    "name":"Cuba",
    "flag":"assets/flags/cub.png"
  },
  {
    "code":"599",
    "name":"Curaçao",
    "flag":"assets/flags/cuw.png"
  },
  {
    "code":"357",
    "name":"Cyprus",
    "flag":"assets/flags/cyp.png"
  },
  {
    "code":"420",
    "name":"Czech Republic",
    "flag":"assets/flags/cze.png"
  },
  {
    "code":"45",
    "name":"Denmark",
    "flag":"assets/flags/dnk.png"
  },
  {
    "code":"253",
    "name":"Djibouti",
    "flag":"assets/flags/dji.png"
  },
  {
    "code":"1767",
    "name":"Dominica",
    "flag":"assets/flags/dma.png"
  },
  {
    "code":"1809",
    "name":"Dominican Republic",
    "flag":"assets/flags/dom.png"
  },
  {
    "code":"593",
    "name":"Ecuador",
    "flag":"assets/flags/ecu.png"
  },
  {
    "code":"20",
    "name":"Egypt",
    "flag":"assets/flags/egy.png"
  },
  {
    "code":"503",
    "name":"El Salvador",
    "flag":"assets/flags/slv.png"
  },
  {
    "code":"240",
    "name":"Equatorial Guinea",
    "flag":"assets/flags/gnq.png"
  },
  {
    "code":"291",
    "name":"Eritrea",
    "flag":"assets/flags/eri.png"
  },
  {
    "code":"372",
    "name":"Estonia",
    "flag":"assets/flags/est.png"
  },
  {
    "code":"251",
    "name":"Ethiopia",
    "flag":"assets/flags/eth.png"
  },
  {
    "code":"500",
    "name":"Falkland Islands (Malvinas)",
    "flag":"assets/flags/flk.png"
  },
  {
    "code":"298",
    "name":"Faroe Islands",
    "flag":"assets/flags/fro.png"
  },
  {
    "code":"679",
    "name":"Fiji",
    "flag":"assets/flags/fji.png"
  },
  {
    "code":"358",
    "name":"Finland",
    "flag":"assets/flags/fin.png"
  },
  {
    "code":"33",
    "name":"France",
    "flag":"assets/flags/fra.png"
  },
  {
    "code":"594",
    "name":"French Guiana",
    "flag":"assets/flags/guf.png"
  },
  {
    "code":"689",
    "name":"French Polynesia",
    "flag":"assets/flags/pyf.png"
  },
  {
    "code":"241",
    "name":"Gabon",
    "flag":"assets/flags/gab.png"
  },
  {
    "code":"220",
    "name":"Gambia",
    "flag":"assets/flags/gmb.png"
  },
  {
    "code":"995",
    "name":"Georgia",
    "flag":"assets/flags/geo.png"
  },
  {
    "code":"49",
    "name":"Germany",
    "flag":"assets/flags/deu.png"
  },
  {
    "code":"233",
    "name":"Ghana",
    "flag":"assets/flags/gha.png"
  },
  {
    "code":"350",
    "name":"Gibraltar",
    "flag":"assets/flags/gib.png"
  },
  {
    "code":"30",
    "name":"Greece",
    "flag":"assets/flags/grc.png"
  },
  {
    "code":"299",
    "name":"Greenland",
    "flag":"assets/flags/grl.png"
  },
  {
    "code":"1473",
    "name":"Grenada",
    "flag":"assets/flags/grd.png"
  },
  {
    "code":"590",
    "name":"Guadeloupe",
    "flag":"assets/flags/glp.png"
  },
  {
    "code":"1671",
    "name":"Guam",
    "flag":"assets/flags/gum.png"
  },
  {
    "code":"502",
    "name":"Guatemala",
    "flag":"assets/flags/gtm.png"
  },
  {
    "code":"44",
    "name":"Guernsey",
    "flag":"assets/flags/ggy.png"
  },
  {
    "code":"224",
    "name":"Guinea",
    "flag":"assets/flags/gin.png"
  },
  {
    "code":"245",
    "name":"Guinea-Bissau",
    "flag":"assets/flags/gnb.png"
  },
  {
    "code":"592",
    "name":"Guyana",
    "flag":"assets/flags/guy.png"
  },
  {
    "code":"509",
    "name":"Haiti",
    "flag":"assets/flags/hti.png"
  },
  {
    "code":"379",
    "name":"Holy See",
    "flag":"assets/flags/vat.png"
  },
  {
    "code":"504",
    "name":"Honduras",
    "flag":"assets/flags/hnd.png"
  },
  {
    "code":"852",
    "name":"Hong Kong",
    "flag":"assets/flags/hkg.png"
  },
  {
    "code":"36",
    "name":"Hungary",
    "flag":"assets/flags/hun.png"
  },
  {
    "code":"354",
    "name":"Iceland",
    "flag":"assets/flags/isl.png"
  },
  {
    "code":"91",
    "name":"India",
    "flag":"assets/flags/ind.png"
  },
  {
    "code":"62",
    "name":"Indonesia",
    "flag":"assets/flags/idn.png"
  },
  {
    "code":"225",
    "name":"Côte d'Ivoire",
    "flag":"assets/flags/civ.png"
  },
  {
    "code":"98",
    "name":"Iran (Islamic Republic of)",
    "flag":"assets/flags/irn.png"
  },
  {
    "code":"964",
    "name":"Iraq",
    "flag":"assets/flags/irq.png"
  },
  {
    "code":"353",
    "name":"Ireland",
    "flag":"assets/flags/irl.png"
  },
  {
    "code":"44",
    "name":"Isle of Man",
    "flag":"assets/flags/imn.png"
  },
  {
    "code":"972",
    "name":"Israel",
    "flag":"assets/flags/isr.png"
  },
  {
    "code":"39",
    "name":"Italy",
    "flag":"assets/flags/ita.png"
  },
  {
    "code":"1876",
    "name":"Jamaica",
    "flag":"assets/flags/jam.png"
  },
  {
    "code":"81",
    "name":"Japan",
    "flag":"assets/flags/jpn.png"
  },
  {
    "code":"44",
    "name":"Jersey",
    "flag":"assets/flags/jey.png"
  },
  {
    "code":"962",
    "name":"Jordan",
    "flag":"assets/flags/jor.png"
  },
  {
    "code":"76",
    "name":"Kazakhstan",
    "flag":"assets/flags/kaz.png"
  },
  {
    "code":"254",
    "name":"Kenya",
    "flag":"assets/flags/ken.png"
  },
  {
    "code":"686",
    "name":"Kiribati",
    "flag":"assets/flags/kir.png"
  },
  {
    "code":"965",
    "name":"Kuwait",
    "flag":"assets/flags/kwt.png"
  },
  {
    "code":"996",
    "name":"Kyrgyzstan",
    "flag":"assets/flags/kgz.png"
  },
  {
    "code":"856",
    "name":"Lao People's Democratic Republic",
    "flag":"assets/flags/lao.png"
  },
  {
    "code":"371",
    "name":"Latvia",
    "flag":"assets/flags/lva.png"
  },
  {
    "code":"961",
    "name":"Lebanon",
    "flag":"assets/flags/lbn.png"
  },
  {
    "code":"266",
    "name":"Lesotho",
    "flag":"assets/flags/lso.png"
  },
  {
    "code":"231",
    "name":"Liberia",
    "flag":"assets/flags/lbr.png"
  },
  {
    "code":"218",
    "name":"Libya",
    "flag":"assets/flags/lby.png"
  },
  {
    "code":"423",
    "name":"Liechtenstein",
    "flag":"assets/flags/lie.png"
  },
  {
    "code":"370",
    "name":"Lithuania",
    "flag":"assets/flags/ltu.png"
  },
  {
    "code":"352",
    "name":"Luxembourg",
    "flag":"assets/flags/lux.png"
  },
  {
    "code":"853",
    "name":"Macao",
    "flag":"assets/flags/mac.png"
  },
  {
    "code":"389",
    "name":"Macedonia (the former Yugoslav Republic of)",
    "flag":"assets/flags/mkd.png"
  },
  {
    "code":"261",
    "name":"Madagascar",
    "flag":"assets/flags/mdg.png"
  },
  {
    "code":"265",
    "name":"Malawi",
    "flag":"assets/flags/mwi.png"
  },
  {
    "code":"60",
    "name":"Malaysia",
    "flag":"assets/flags/mys.png"
  },
  {
    "code":"960",
    "name":"Maldives",
    "flag":"assets/flags/mdv.png"
  },
  {
    "code":"223",
    "name":"Mali",
    "flag":"assets/flags/mli.png"
  },
  {
    "code":"356",
    "name":"Malta",
    "flag":"assets/flags/mlt.png"
  },
  {
    "code":"692",
    "name":"Marshall Islands",
    "flag":"assets/flags/mhl.png"
  },
  {
    "code":"596",
    "name":"Martinique",
    "flag":"assets/flags/mtq.png"
  },
  {
    "code":"222",
    "name":"Mauritania",
    "flag":"assets/flags/mrt.png"
  },
  {
    "code":"230",
    "name":"Mauritius",
    "flag":"assets/flags/mus.png"
  },
  {
    "code":"262",
    "name":"Mayotte",
    "flag":"assets/flags/myt.png"
  },
  {
    "code":"52",
    "name":"Mexico",
    "flag":"assets/flags/mex.png"
  },
  {
    "code":"691",
    "name":"Micronesia (Federated States of)",
    "flag":"assets/flags/fsm.png"
  },
  {
    "code":"373",
    "name":"Moldova (Republic of)",
    "flag":"assets/flags/mda.png"
  },
  {
    "code":"377",
    "name":"Monaco",
    "flag":"assets/flags/mco.png"
  },
  {
    "code":"976",
    "name":"Mongolia",
    "flag":"assets/flags/mng.png"
  },
  {
    "code":"382",
    "name":"Montenegro",
    "flag":"assets/flags/mne.png"
  },
  {
    "code":"1664",
    "name":"Montserrat",
    "flag":"assets/flags/msr.png"
  },
  {
    "code":"212",
    "name":"Morocco",
    "flag":"assets/flags/mar.png"
  },
  {
    "code":"258",
    "name":"Mozambique",
    "flag":"assets/flags/moz.png"
  },
  {
    "code":"95",
    "name":"Myanmar",
    "flag":"assets/flags/mmr.png"
  },
  {
    "code":"264",
    "name":"Namibia",
    "flag":"assets/flags/nam.png"
  },
  {
    "code":"674",
    "name":"Nauru",
    "flag":"assets/flags/nru.png"
  },
  {
    "code":"977",
    "name":"Nepal",
    "flag":"assets/flags/npl.png"
  },
  {
    "code":"31",
    "name":"Netherlands",
    "flag":"assets/flags/nld.png"
  },
  {
    "code":"687",
    "name":"New Caledonia",
    "flag":"assets/flags/ncl.png"
  },
  {
    "code":"64",
    "name":"New Zealand",
    "flag":"assets/flags/nzl.png"
  },
  {
    "code":"505",
    "name":"Nicaragua",
    "flag":"assets/flags/nic.png"
  },
  {
    "code":"227",
    "name":"Niger",
    "flag":"assets/flags/ner.png"
  },
  {
    "code":"234",
    "name":"Nigeria",
    "flag":"assets/flags/nga.png"
  },
  {
    "code":"683",
    "name":"Niue",
    "flag":"assets/flags/niu.png"
  },
  {
    "code":"672",
    "name":"Norfolk Island",
    "flag":"assets/flags/nfk.png"
  },
  {
    "code":"850",
    "name":"Korea (Democratic People's Republic of)",
    "flag":"assets/flags/prk.png"
  },
  {
    "code":"1670",
    "name":"Northern Mariana Islands",
    "flag":"assets/flags/mnp.png"
  },
  {
    "code":"47",
    "name":"Norway",
    "flag":"assets/flags/nor.png"
  },
  {
    "code":"968",
    "name":"Oman",
    "flag":"assets/flags/omn.png"
  },
  {
    "code":"92",
    "name":"Pakistan",
    "flag":"assets/flags/pak.png"
  },
  {
    "code":"680",
    "name":"Palau",
    "flag":"assets/flags/plw.png"
  },
  {
    "code":"970",
    "name":"Palestine, State of",
    "flag":"assets/flags/pse.png"
  },
  {
    "code":"507",
    "name":"Panama",
    "flag":"assets/flags/pan.png"
  },
  {
    "code":"675",
    "name":"Papua New Guinea",
    "flag":"assets/flags/png.png"
  },
  {
    "code":"595",
    "name":"Paraguay",
    "flag":"assets/flags/pry.png"
  },
  {
    "code":"51",
    "name":"Peru",
    "flag":"assets/flags/per.png"
  },
  {
    "code":"63",
    "name":"Philippines",
    "flag":"assets/flags/phl.png"
  },
  {
    "code":"64",
    "name":"Pitcairn",
    "flag":"assets/flags/pcn.png"
  },
  {
    "code":"48",
    "name":"Poland",
    "flag":"assets/flags/pol.png"
  },
  {
    "code":"351",
    "name":"Portugal",
    "flag":"assets/flags/prt.png"
  },
  {
    "code":"1787",
    "name":"Puerto Rico",
    "flag":"assets/flags/pri.png"
  },
  {
    "code":"974",
    "name":"Qatar",
    "flag":"assets/flags/qat.png"
  },
  {
    "code":"383",
    "name":"Republic of Kosovo",
    "flag":"assets/flags/kos.png"
  },
  {
    "code":"262",
    "name":"Réunion",
    "flag":"assets/flags/reu.png"
  },
  {
    "code":"40",
    "name":"Romania",
    "flag":"assets/flags/rou.png"
  },
  {
    "code":"7",
    "name":"Russian Federation",
    "flag":"assets/flags/rus.png"
  },
  {
    "code":"250",
    "name":"Rwanda",
    "flag":"assets/flags/rwa.png"
  },
  {
    "code":"590",
    "name":"Saint Barthélemy",
    "flag":"assets/flags/blm.png"
  },
  {
    "code":"290",
    "name":"Saint Helena, Ascension and Tristan da Cunha",
    "flag":"assets/flags/shn.png"
  },
  {
    "code":"1869",
    "name":"Saint Kitts and Nevis",
    "flag":"assets/flags/kna.png"
  },
  {
    "code":"1758",
    "name":"Saint Lucia",
    "flag":"assets/flags/lca.png"
  },
  {
    "code":"590",
    "name":"Saint Martin (French part)",
    "flag":"assets/flags/maf.png"
  },
  {
    "code":"508",
    "name":"Saint Pierre and Miquelon",
    "flag":"assets/flags/spm.png"
  },
  {
    "code":"1784",
    "name":"Saint Vincent and the Grenadines",
    "flag":"assets/flags/vct.png"
  },
  {
    "code":"685",
    "name":"Samoa",
    "flag":"assets/flags/wsm.png"
  },
  {
    "code":"378",
    "name":"San Marino",
    "flag":"assets/flags/smr.png"
  },
  {
    "code":"239",
    "name":"Sao Tome and Principe",
    "flag":"assets/flags/stp.png"
  },
  {
    "code":"966",
    "name":"Saudi Arabia",
    "flag":"assets/flags/sau.png"
  },
  {
    "code":"221",
    "name":"Senegal",
    "flag":"assets/flags/sen.png"
  },
  {
    "code":"381",
    "name":"Serbia",
    "flag":"assets/flags/srb.png"
  },
  {
    "code":"248",
    "name":"Seychelles",
    "flag":"assets/flags/syc.png"
  },
  {
    "code":"232",
    "name":"Sierra Leone",
    "flag":"assets/flags/sle.png"
  },
  {
    "code":"65",
    "name":"Singapore",
    "flag":"assets/flags/sgp.png"
  },
  {
    "code":"1721",
    "name":"Sint Maarten (Dutch part)",
    "flag":"assets/flags/sxm.png"
  },
  {
    "code":"421",
    "name":"Slovakia",
    "flag":"assets/flags/svk.png"
  },
  {
    "code":"386",
    "name":"Slovenia",
    "flag":"assets/flags/svn.png"
  },
  {
    "code":"677",
    "name":"Solomon Islands",
    "flag":"assets/flags/slb.png"
  },
  {
    "code":"252",
    "name":"Somalia",
    "flag":"assets/flags/som.png"
  },
  {
    "code":"27",
    "name":"South Africa",
    "flag":"assets/flags/zaf.png"
  },
  {
    "code":"500",
    "name":"South Georgia and the South Sandwich Islands",
    "flag":"assets/flags/sgs.png"
  },
  {
    "code":"82",
    "name":"Korea (Republic of)",
    "flag":"assets/flags/kor.png"
  },
  {
    "code":"211",
    "name":"South Sudan",
    "flag":"assets/flags/ssd.png"
  },
  {
    "code":"34",
    "name":"Spain",
    "flag":"assets/flags/esp.png"
  },
  {
    "code":"94",
    "name":"Sri Lanka",
    "flag":"assets/flags/lka.png"
  },
  {
    "code":"249",
    "name":"Sudan",
    "flag":"assets/flags/sdn.png"
  },
  {
    "code":"597",
    "name":"Suriname",
    "flag":"assets/flags/sur.png"
  },
  {
    "code":"4779",
    "name":"Svalbard and Jan Mayen",
    "flag":"assets/flags/sjm.png"
  },
  {
    "code":"268",
    "name":"Swaziland",
    "flag":"assets/flags/swz.png"
  },
  {
    "code":"46",
    "name":"Sweden",
    "flag":"assets/flags/swe.png"
  },
  {
    "code":"41",
    "name":"Switzerland",
    "flag":"assets/flags/che.png"
  },
  {
    "code":"963",
    "name":"Syrian Arab Republic",
    "flag":"assets/flags/syr.png"
  },
  {
    "code":"886",
    "name":"Taiwan",
    "flag":"assets/flags/twn.png"
  },
  {
    "code":"992",
    "name":"Tajikistan",
    "flag":"assets/flags/tjk.png"
  },
  {
    "code":"255",
    "name":"Tanzania, United Republic of",
    "flag":"assets/flags/tza.png"
  },
  {
    "code":"66",
    "name":"Thailand",
    "flag":"assets/flags/tha.png"
  },
  {
    "code":"670",
    "name":"Timor-Leste",
    "flag":"assets/flags/tls.png"
  },
  {
    "code":"228",
    "name":"Togo",
    "flag":"assets/flags/tgo.png"
  },
  {
    "code":"690",
    "name":"Tokelau",
    "flag":"assets/flags/tkl.png"
  },
  {
    "code":"676",
    "name":"Tonga",
    "flag":"assets/flags/ton.png"
  },
  {
    "code":"1868",
    "name":"Trinidad and Tobago",
    "flag":"assets/flags/tto.png"
  },
  {
    "code":"216",
    "name":"Tunisia",
    "flag":"assets/flags/tun.png"
  },
  {
    "code":"90",
    "name":"Turkey",
    "flag":"assets/flags/tur.png"
  },
  {
    "code":"993",
    "name":"Turkmenistan",
    "flag":"assets/flags/tkm.png"
  },
  {
    "code":"1649",
    "name":"Turks and Caicos Islands",
    "flag":"assets/flags/tca.png"
  },
  {
    "code":"688",
    "name":"Tuvalu",
    "flag":"assets/flags/tuv.png"
  },
  {
    "code":"256",
    "name":"Uganda",
    "flag":"assets/flags/uga.png"
  },
  {
    "code":"380",
    "name":"Ukraine",
    "flag":"assets/flags/ukr.png"
  },
  {
    "code":"971",
    "name":"United Arab Emirates",
    "flag":"assets/flags/are.png"
  },
  {
    "code":"44",
    "name":"United Kingdom of Great Britain and Northern Ireland",
    "flag":"assets/flags/gbr.png"
  },
  {
    "code":"1",
    "name":"United States of America",
    "flag":"assets/flags/usa.png"
  },
  {
    "code":"598",
    "name":"Uruguay",
    "flag":"assets/flags/ury.png"
  },
  {
    "code":"998",
    "name":"Uzbekistan",
    "flag":"assets/flags/uzb.png"
  },
  {
    "code":"678",
    "name":"Vanuatu",
    "flag":"assets/flags/vut.png"
  },
  {
    "code":"58",
    "name":"Venezuela (Bolivarian Republic of)",
    "flag":"assets/flags/ven.png"
  },
  {
    "code":"84",
    "name":"Viet Nam",
    "flag":"assets/flags/vnm.png"
  },
  {
    "code":"681",
    "name":"Wallis and Futuna",
    "flag":"assets/flags/wlf.png"
  },
  {
    "code":"212",
    "name":"Western Sahara",
    "flag":"assets/flags/esh.png"
  },
  {
    "code":"967",
    "name":"Yemen",
    "flag":"assets/flags/yem.png"
  },
  {
    "code":"260",
    "name":"Zambia",
    "flag":"assets/flags/zmb.png"
  },
  {
    "code":"263",
    "name":"Zimbabwe",
    "flag":"assets/flags/zwe.png"
  }
];
