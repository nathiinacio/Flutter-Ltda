import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:Hurb_Challenge/home_list_view.dart';
import 'package:Hurb_Challenge/detail_screen.dart';
import 'package:Hurb_Challenge/last_seen_list_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
    TabController controller;
    ProductType productType = ProductType.hotels;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
              Stack(
                children: <Widget>[
                   Container(
                    height: 350.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(150, 80)),
                      color: AppTheme.commonBlue
                         .withOpacity(1.0)),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      getAppBar(),
                      SizedBox(height: 5.0),
                      getSearchBar(),
                      SizedBox(height: 5.0),
                      getFilters(),
                    ],
                  )
                ],
              ),
            SizedBox(height: 5.0),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                       child: getHome(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      // bottomNavigationBar: Material(
      //   color: Colors.white,
      //   child: TabBar(
      //     controller: controller,
      //     indicatorColor: Colors.yellow,
      //     tabs: <Widget>[
      //       Tab(icon: Icon(Icons.event_seat, color: Colors.yellow)),
      //       Tab(icon: Icon(Icons.timer, color: Colors.grey)),
      //       Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
      //       Tab(icon: Icon(Icons.person_outline, color: Colors.grey))
      //     ],
      //   ),
      // ),
      ),
    );
  }

  Widget getFilters() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Filtrar por:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtons(ProductType.hotels, productType == ProductType.hotels),
              const SizedBox(
                width: 16,
              ),
              getButtons(
                  ProductType.packages, productType == ProductType.packages),
              const SizedBox(
                width: 16,
              ),
              getButtons(
                  ProductType.activities, productType == ProductType.activities),
            ],
          ),
        ),
      ],
    );
  }
Widget getInfo(){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 85.0,
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/hotel.png'))),

                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Milhares \nde Hotéis',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14, letterSpacing: 0.27, color: AppTheme.darkGray),
                    )
                    )
                  ],
                ),
              ),
              Container(
                height: 85.0,
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/cancelamento.png'))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                      'Cancelamento \nGrátis',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14, letterSpacing: 0.27, color: AppTheme.darkGray),
                    )
                    )
                  ],
                ),
              ),
              Container(
                height: 85.0,
                width: MediaQuery.of(context).size.width / 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/atendimento.png'))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                      'Atendimento\n 24h',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14, letterSpacing: 0.27, color: AppTheme.darkGray)
                    )
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  } 
  
  Widget getHome() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        SizedBox(height: 5.0),
        getInfo(),
        SizedBox(height: 30.0),
        Text(
        'Últimos vistos:',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: 0.27,
          color: AppTheme.darkerText,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        LastSeenListView(
          callBack: () {
            moveTo();
          },
        ),
          Text(
            'Destaques',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
          Flexible(
            child: HomeListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DetailScreen(),
      ),
    );
  }

  Widget getButtons(ProductType productTypeData, bool isSelected) {
    String txt = '';
    if (ProductType.hotels == productTypeData) {
      txt = 'Hotéis';
    } else if (ProductType.packages == productTypeData) {
      txt = 'Pacotes';
    } else if (ProductType.activities == productTypeData) {
      txt = 'Atividades';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.buttonPink
                : AppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: AppTheme.commonBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                productType = productTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? AppTheme.nearlyWhite
                        : AppTheme.buttonPink,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.cardColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.commonBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Para onde quer ir?',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppTheme.lightgray,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: AppTheme.lightgray,
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pesquisar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 0.27,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ProductType {
  hotels,
  packages,
  activities,
}