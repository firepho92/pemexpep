import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pemexpep/Providers/ViewsProvider.dart';
import 'package:pemexpep/Views/ContactView.dart';
import 'package:pemexpep/Views/CyclonesView.dart';
import 'package:pemexpep/Views/ExtendedForecastView.dart';
import 'package:pemexpep/Views/ForecastView.dart';
import 'package:pemexpep/Views/HomeView.dart';
import 'package:pemexpep/Views/NotesView.dart';
import 'package:pemexpep/Views/PortsView.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';


class AppContainer extends StatefulWidget {
  AppContainer({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  String title = 'Meteorología';
  List<Widget> views = [
    HomeView(),
    PortsView(),
    ForecastView(),
    CyclonesView(),
    ExtendedForecastView(),
    ContactView(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewsProvider = Provider.of<ViewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image.asset('pemex.png'),
        ),
        title: Text(title),
        actions: [
          GestureDetector(
            onTap: () => js.context.callMethod('open', ['https://www.gob.mx/sener']),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'sener.png',
              ),
            ),
          )
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Lateral navigation bar
          NavigationRail(
            backgroundColor: Color.fromARGB(255, 11, 35, 30),
            selectedIndex: viewsProvider.selectedIndex,
            onDestinationSelected: (int index) {
              viewsProvider.setSelectedIndex(index);
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home, color: Colors.white,),
                selectedIcon: Icon(Icons.home, color: Colors.white,),
                label: Text('Inicio', style: TextStyle(color: Colors.white, fontSize:12),),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.lighthouse, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.lighthouse, color: Colors.white,),
                label: Text('Puertos', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.weather_cloudy, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.weather_cloudy, color: Colors.white,),
                label: Text('Pronóstico\nmet.', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.weather_hurricane, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.weather_hurricane, color: Colors.white,),
                label: Text('Ciclones\ntrop.', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.file_document, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.file_document, color: Colors.white,),
                label: Text('Pronóstico\next.', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.history, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.history, color: Colors.white,),
                label: Text('Datos\nhistóricos', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
              NavigationRailDestination(
                icon: Icon(MaterialCommunityIcons.contact_mail, color: Colors.white,),
                selectedIcon: Icon(MaterialCommunityIcons.contact_mail, color: Colors.white,),
                label: Text('Contacto', style: TextStyle(color: Colors.white, fontSize:12)),
              ),
            ],
          ),
          Expanded(
            child: AnimatedSwitcher(
              child: views[viewsProvider.selectedIndex],
              duration: Duration(milliseconds: 350),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('2020 Petróleos Mexicanos · Orgullosamente hecho en PEMEX\n Marina Nacional #329, Col. Huasteca, C.P. 11311, México D.F. (+52 55) 1944 2500.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        )
      )
    );
  }
}
