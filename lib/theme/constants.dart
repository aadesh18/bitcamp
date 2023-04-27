import 'package:bitcamp/data/pot.dart';
import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/data/recProperty.dart';
import 'package:bitcamp/data/user.dart';
import 'package:flutter/material.dart';

//const Color backgroundColor = Color(0xFFDAF5FF);
const Color backgroundColor = Color(0xFFF5F0BB);
Color cardColor = Colors.grey.shade300.withOpacity(0.5);
double? screenHeight;
double? screenWidth;
IconData appIcon = Icons.home_max_sharp;
Color informationCardColor = Color.fromARGB(255, 175, 210, 142);
// Color informationCardColor = const Color.fromARGB(255, 248, 150, 150);
late List<RecProperty> group1Rec = [];
late List<RecProperty> group2Rec = [];
late Pot pot1;
late Pot pot2;
late List<Property> propertyList = [];
List<List<String>> rawPropList = [
  [
    '0',
    'https://ssl.cdn-redfin.com/system_files/media/498311_JPG/genDesktopMapHomeCardUrl/item_34.jpg',
    '\$360,000',
    '—Beds',
    '1 Bath',
    '557 Sq. Ft.',
    '601 Pennsylvania Ave NW Unit 1101N, Washington, DC 20004'
  ],
  [
    '1',
    'https://ssl.cdn-redfin.com/system_files/media/801499_JPG/genDesktopMapHomeCardUrl/item_1.jpg',
    '\$574,900',
    '2 Beds',
    '2 Baths',
    '858 Sq. Ft.',
    '3733 12th St NE #202, Washington, DC 20017'
  ],
  [
    '2',
    'https://ssl.cdn-redfin.com/system_files/media/805183_JPG/genDesktopMapHomeCardUrl/item_1.jpg',
    '\$775,000',
    '2 Beds',
    '2.5 Baths',
    '1,349 Sq. Ft.',
    '315 I St NE #1, Washington, DC 20002'
  ],
  [
    '3',
    'https://ssl.cdn-redfin.com/system_files/media/797981_JPG/genDesktopMapHomeCardUrl/item_39.jpg',
    '\$1,100,000',
    '2 Beds',
    '2 Baths',
    '1,103 Sq. Ft.',
    '45 Sutton Sq SW #303, Washington, DC 20024'
  ],
  [
    '4',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/338/genIslnoResize.DCDC2091338_0.jpg',
    '\$425,000',
    '1 Bed',
    '1 Bath',
    '1,012 Sq. Ft.',
    '777 7th St NW #1036, Washington, DC 20001'
  ],
  [
    '5',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/336/genIslnoResize.DCDC2091336_0.jpg',
    '\$239,000',
    '—Beds',
    '1 Bath',
    '471 Sq. Ft.',
    '2030 F St NW #504, Washington, DC 20006'
  ],
  [
    '6',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/334/genIslnoResize.DCDC2091334_0.jpg',
    '\$999,900',
    '4 Beds',
    '3.5 Baths',
    '2,280 Sq. Ft.',
    '2417 Capitol NE, Washington, DC 20002'
  ],
  [
    '7',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/356/genIslnoResize.DCDC2083356_2.jpg',
    '\$2,250,000',
    '5 Beds',
    '5.5 Baths',
    '3,800 Sq. Ft.',
    '4934 Upton St NW, Washington, DC 20016'
  ],
  [
    '8',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/314/genIslnoResize.DCDC2091314_0.jpg',
    '\$650,000',
    '3 Beds',
    '1.5 Baths',
    '1,358 Sq. Ft.',
    '2228 12th St NW, Washington, DC 20009'
  ],
  [
    '9',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/308/genIslnoResize.DCDC2090308_0.jpg',
    '\$3,250,000',
    '5 Beds',
    '5.5 Baths',
    '3,417 Sq. Ft.',
    '632 S South Carolina Ave SE #1, Washington, DC 20003'
  ],
  [
    '10',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/816/genIslnoResize.DCDC2090816_0.jpg',
    '\$759,900',
    '2 Beds',
    '2.5 Baths',
    '1,572 Sq. Ft.',
    '1370 Monroe St NW Unit B, Washington, DC 20010'
  ],
  [
    '11',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/448/genIslnoResize.DCDC2090448_0.jpg',
    '\$699,000',
    '5 Beds',
    '3 Baths',
    '1,815 Sq. Ft.',
    '6604 Piney Branch Rd NW, Washington, DC 20012'
  ],
  [
    '12',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/320/genIslnoResize.DCDC2091320_0.jpg',
    '\$1,100,000',
    '3 Beds',
    '2.5 Baths',
    '1,456 Sq. Ft.',
    '1704 Constitution Ave NE, Washington, DC 20002'
  ],
  [
    '13',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/310/genIslnoResize.DCDC2091310_0.jpg',
    '\$329,900',
    '2 Beds',
    '1 Bath',
    '832 Sq. Ft.',
    '4303 Texas Ave SE, Washington, DC 20019'
  ],
  [
    '14',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/324/genIslnoResize.DCDC2091324_0.jpg',
    '\$389,000',
    '1 Bed',
    '1 Bath',
    '720 Sq. Ft.',
    '2320 Wisconsin Ave NW #104, Washington, DC 20007'
  ],
  [
    '15',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/636/genIslnoResize.DCDC2090636_0.jpg',
    '\$1,399,000',
    '5 Beds',
    '3.5 Baths',
    '2,889 Sq. Ft.',
    '200 Webster St NW, Washington, DC 20011'
  ],
  [
    '16',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/144/genIslnoResize.DCDC2091144_0.jpg',
    '\$414,990',
    '3 Beds',
    '1.5 Baths',
    '1,586 Sq. Ft.',
    '1428 41st St SE, Washington, DC 20020'
  ],
  [
    '17',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/574/genIslnoResize.DCDC2087574_0.jpg',
    '\$1,349,990',
    '6 Beds',
    '5.5 Baths',
    '5,140 Sq. Ft.',
    '2815 Brentwood Rd NE, Washington, DC 20018'
  ],
  [
    '18',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/066/genIslnoResize.DCDC2091066_0.jpg',
    '\$1,398,000',
    '3 Beds',
    '3 Baths',
    '1,550 Sq. Ft.',
    '1649 New Jersey Ave NW, Washington, DC 20001'
  ],
  [
    '19',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/290/genIslnoResize.DCDC2091290_0.jpg',
    '\$920,000',
    '4 Beds',
    '2.5 Baths',
    '2,269 Sq. Ft.',
    '746 Princeton Pl NW, Washington, DC 20010'
  ],
  [
    '20',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/260/genIslnoResize.DCDC2090260_15_1.jpg',
    '\$460,000',
    '3 Beds',
    '2.5 Baths',
    '1,280 Sq. Ft.',
    '1102 Varney St SE, Washington, DC 20032'
  ],
  [
    '21',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/988/genIslnoResize.DCDC2090988_1.jpg',
    '\$564,000',
    '2 Beds',
    '1.5 Baths',
    '840 Sq. Ft.',
    '1818 L St NE, Washington, DC 20002'
  ],
  [
    '22',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/414/genIslnoResize.DCDC2088414_1.jpg',
    '\$679,000',
    '3 Beds',
    '2.5 Baths',
    '2,079 Sq. Ft.',
    '250 Oneida St NE, Washington, DC 20011'
  ],
  [
    '23',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/238/genIslnoResize.DCDC2091238_0.jpg',
    '\$309,900',
    '1 Bed',
    '1 Bath',
    '650 Sq. Ft.',
    '1915 16th St NW #404, Washington, DC 20009'
  ],
  [
    '24',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/168/genIslnoResize.DCDC2091168_0.jpg',
    '\$250,000',
    '1 Bed',
    '1 Bath',
    '850 Sq. Ft.',
    '5410 Connecticut Ave NW #217, Washington, DC 20015'
  ],
  [
    '25',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/306/genIslnoResize.DCDC2091306_0.jpg',
    '\$495,000',
    '2 Beds',
    '1 Bath',
    '850 Sq. Ft.',
    '350 G St SW Unit N504, Washington, DC 20024'
  ],
  [
    '26',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/540/genIslnoResize.DCDC2090540_0.jpg',
    '\$399,999',
    '3 Beds',
    '1.5 Baths',
    '1,410 Sq. Ft.',
    '1776 Lang Pl NE, Washington, DC 20002'
  ],
  [
    '27',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/292/genIslnoResize.DCDC2091292_0.jpg',
    '\$347,500',
    '3 Beds',
    '2 Baths',
    '1,120 Sq. Ft.',
    '771 18th St NE, Washington, DC 20002'
  ],
  [
    '28',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/818/genIslnoResize.DCDC2090818_1.jpg',
    '\$975,000',
    '2 Beds',
    '1 Bath',
    '1,022 Sq. Ft.',
    '1912 35th Pl NW, Washington, DC 20007'
  ],
  [
    '29',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/286/genIslnoResize.DCDC2091286_0.jpg',
    '\$795,000',
    '3 Beds',
    '1.5 Baths',
    '1,376 Sq. Ft.',
    '1359 F St NE, Washington, DC 20002'
  ],
  [
    '30',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/090/genIslnoResize.MDPG2074090_1.jpg',
    '\$355,000',
    '3 Beds',
    '3 Baths',
    '1,336 Sq. Ft.',
    '2322 Woodbark Ln, Suitland, MD 20746'
  ],
  [
    '31',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/240/genIslnoResize.DCDC2091240_1.jpg',
    '\$370,000',
    '1 Bed',
    '1 Bath',
    '947 Sq. Ft.',
    '4301 Massachusetts Ave NW #2007, Washington, DC 20016'
  ],
  [
    '32',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/800/genIslnoResize.DCDC2085800_0.jpg',
    '\$1,175,000',
    '4 Beds',
    '3.5 Baths',
    '1,728 Sq. Ft.',
    '124 17th St NE, Washington, DC 20002'
  ],
  [
    '33',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/044/genIslnoResize.DCDC2091044_0.jpg',
    '\$399,000',
    '1 Bed',
    '1 Bath',
    '568 Sq. Ft.',
    '1621 T St NW #104, Washington, DC 20009'
  ],
  [
    '34',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/982/genIslnoResize.DCDC2083982_0.jpg',
    '\$775,000',
    '5 Beds',
    '3.5 Baths',
    '2,383 Sq. Ft.',
    '2839 27th St NE, Washington, DC 20018'
  ],
  [
    '35',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/258/genIslnoResize.DCDC2091258_0.jpg',
    '\$1,799,999',
    '—Beds',
    '—Baths',
    '4,248 Sq. Ft.',
    '2608 Cathedral Ave NW, Washington, DC 20008'
  ],
  [
    '36',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/566/genIslnoResize.DCDC2088566_0.jpg',
    '\$220,000',
    '—Beds',
    '1 Bath',
    '450 Sq. Ft.',
    '1725 17th St NW #311, Washington, DC 20009'
  ],
  [
    '37',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/468/genIslnoResize.DCDC2090468_1.jpg',
    '\$575,000',
    '3 Beds',
    '2.5 Baths',
    '994 Sq. Ft.',
    '1639 Kramer St NE, Washington, DC 20002'
  ],
  [
    '38',
    'https://ssl.cdn-redfin.com/photo/235/islphoto/046/genIslnoResize.DCDC2091046_1.jpg',
    '\$3,750,000',
    '6 Beds',
    '6.5 Baths',
    '6,658 Sq. Ft.',
    '4512 Salem Ln NW, Washington, DC 20007'
  ]
];
