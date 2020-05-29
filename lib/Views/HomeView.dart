import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:pemexpep/Providers/ViewsProvider.dart';
import 'package:pemexpep/Views/NotesView.dart';
import 'package:pemexpep/Views/RainForecastView.dart';
import 'package:pemexpep/Views/WaveForecastView.dart';
import 'package:provider/provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<Widget> widgets = [
    Main(),
    NotesView(),
    WaveForecastView(),
    RainForecastView()
  ];

  @override
  Widget build(BuildContext context) {
    final viewsProvider = Provider.of<ViewsProvider>(context);
    
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 350),
      child: widgets[viewsProvider.mainSelectedIndex],
    );
  }
}


class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);


  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentNew = 0;
  int _currentImg = 0;
  CarouselController newsCarouselController = CarouselController();
  CarouselController imagesCarouselController = CarouselController();
  List<String> messages = [
    'Área de Perdido\nPronóstico Meteorológico Extendido Área Perdido del 30 de Junio al 05 de Julio de 2019. ...más [30/06/2019 12:51:21]',
    'Área Coatzacoalcos Profundo\nPronóstico Meteorológico Extendido Coatzacoalcos Profundo del 29 de Mayo al 02 de Junio de 2020 ...más [28/05/2020 11:11:16]',
    'Sonda de Campeche\nPronóstico Meteorológico Extendido Sonda de Campeche del 29 de Mayo al 02 de Junio de 2020 ...más [28/05/2020 10:47:51]'
  ];
  
  List<String> imageUrls = [
    'http://www3.pemex.com:6015/Logistica/v4/meteorologia/imagenes/sinopsis.jpg',
    'http://www3.pemex.com:6015/Logistica/v4/meteorologia/imagenes/PronosticoRegiones/chicas/BBBB.JPG',
    'http://www3.pemex.com:6015/Logistica/v4/meteorologia/imagenes/VisualizadorModelosNum.jpg',
    'http://www3.pemex.com:6015/Logistica/v4/meteorologia/imagenes/ModeloOleajeWAM.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final viewsProvider = Provider.of<ViewsProvider>(context);
    
    return Container(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //Services
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 237,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //Meteorological services
                            ExpansionTile(
                              title: Text('Servicios meteorológicos', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold)),
                              children: [
                                //Changes AppContainer view to ForecastView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(2);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronósticos meteorológicos'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to Ports
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Reportes de Conds. Met. y Oper. Portuarias'),
                                    ),
                                  ),
                                ),
                                //Changes this view to NotesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Notas informativas'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to CyclonesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(3);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Alertas por ciclones tropicales'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Visualizador de modelos meteorológicos y de oleaje'),
                                    ),
                                  ),
                                ),
                                //Changes this view to WaveForecastView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(2);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronóstico de oleaje'),
                                    ),
                                  ),
                                ),
                                //Changes this view to RainForecastView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(3);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronóstico de precipitación'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to ExtendedForecastView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(4);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronóstico extendido'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at http://scsm.mar.dpep.pep.pemex.com/C13/C3/ReportesOceanica/default.aspx unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://scsm.mar.dpep.pep.pemex.com/C13/C3/ReportesOceanica/default.aspx']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Reporte de circulación oceánica en el golfo de México'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Documents, guides and procedures
                            ExpansionTile(
                              title: Text('Documentos, guías y procedimientos', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold)),
                              children: [
                                //Changes this view to NotesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Guía Técnica de Acciones Preventivas'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to CyclonesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(3);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Plan de Respuesta a Emergencias por Huracanes'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Sistema de Alerta Temprana por Ciclón Tropical'),
                                    ),
                                  ),
                                ),
                                //Changes this view to WaveForecastView
                              ],
                            ),
                            //Monitoring networks and maps
                            ExpansionTile(
                              title: Text('Redes de monitoreo y mapas', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold)),
                              children: [
                                //Changes this view to NotesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Red de Monitoreo Hidrometeorológico de PEP'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to CyclonesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(3);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Boyas Instrumentadas PEP-CICESE'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Carta Sinóptica de Superficie a 12 hrs'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Carta Sinóptica de Superficie a 24 hrs'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Temperatura de la Superficial del Mar'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronóstico de Periodo de Ola a 48 hrs'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Pronóstico de Periodo de Ola a 72 hrs'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Other sites of interest
                            ExpansionTile(
                              title: Text('Otros sitios de interés', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold)),
                              children: [
                                //Changes this view to NotesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setMainSelectedIndex(1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Imágenes de Satélite GOES'),
                                    ),
                                  ),
                                ),
                                //Changes AppContainer view to CyclonesView
                                InkWell(
                                  onTap: () {
                                    viewsProvider.setSelectedIndex(3);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Sitio Oficial del Gobierno Federal'),
                                    ),
                                  ),
                                ),
                                //Opens new tab at intermco unknown location yet
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Petroleos Mexicanos'),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Servicio Meteorológico Nacional'),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Organización Meteorológica Mundial'),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Servicio de Información Meteorológica Mundial'),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Hora Oficial en los Estados Unidos Mexicanos'),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    js.context.callMethod('open', ['http://0.5.86.147/intermco/']);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: ListTile(
                                      title: Text('Centro Nacional de Huracanes TPC/NOAA'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  )
                ),
              ),
              //Msgs table
              Expanded(
                child: Card(
                  color: Color.fromARGB(255, 11, 35, 30),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Tablero de mensajes', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16)),
                        Container(
                          height: 200,
                          child: CarouselSlider(
                            carouselController: newsCarouselController,
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              height: 150.0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 10),
                              autoPlayCurve: Curves.easeInOut,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentNew = index;
                                });
                              }
                            ),
                            items: messages.map((m) => 
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Card(
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: () => print(m),
                                      child: Text(m, style: TextStyle(fontSize: 14.0),)
                                    ),
                                  ),
                                )
                              )
                            ).toList()
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: messages.map((m) {
                            int index = messages.indexOf(m);
                            return InkWell(
                              onTap: () => newsCarouselController.animateToPage(index),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentNew == index
                                    ? Color.fromRGBO(255, 255, 255, 0.9)
                                    : Color.fromRGBO(255, 255, 255, 0.4),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Operating situation in the gulf of México
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      height: 227,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Situación de operaciones en el golfo de México', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold, fontSize: 16)),
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Puerto'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Estado'),
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 31, 182, 1)
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Cd. Del Carmen, Camp., Tab', style: TextStyle(fontSize: 12)),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 31, 182, 1)
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Plat. Cayo Arcas, Tab', style: TextStyle(fontSize: 12)),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 224, 54, 25)
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Área De Plataformas, Tab', style: TextStyle(fontSize: 12)),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 31, 182, 1)
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("Fpso. Yuum K'ak Náab (pto), Tab", style: TextStyle(fontSize: 12)),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 31, 182, 1)
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Seybaplaya, Camp.', style: TextStyle(fontSize: 12)),
                                  ),
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 31, 182, 1)
                                    ),
                                  ),
                                ]
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 260,
                width: 350,
                padding: EdgeInsets.all(5),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        carouselController: imagesCarouselController,
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 200.0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayCurve: Curves.easeInOut,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImg = index;
                            });
                          }
                        ),
                        items: imageUrls.map((url) => 
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () => print(url),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.fitWidth,
                                )
                              ),
                            )
                          )
                        ).toList()
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageUrls.map((url) {
                          int index = imageUrls.indexOf(url);
                          return InkWell(
                            onTap: () => imagesCarouselController.animateToPage(index),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImg == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 250,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SingleChildScrollView (
                        child: Column(
                          children: [
                            Text('Sinopsis general 28/05/2020 8:00:00\n', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold)),
                            Text('Condiciones favorables para las operaciones marítimas en el Golfo de México. Esta mañana, una vaguada sobre el noroeste y otra más al occidente del Golfo de México ocasionan cielo medio nublado a nublado sobre el litoral de Tamaulipas y Veracruz con bajo potencial para precipitaciones, mientras que en la Sonda de Campeche se aprecia cielo despejado a medio nublado. Por otra parte, una Onda Tropical avanza sobre y frente al litoral de Tabasco sin generar mayores efectos y una más avanza en la región oriente del Mar Caribe; mientras tanto una zona de baja presión al sur del Golfo de Tehuantepec presenta 40 % de probabilidad para su desarrollo a Ciclón Tropical en las próximas 48 horas, por lo que se mantiene en vigilancia. Por el momento domina un flujo del Sureste sobre gran parte del litoral del Golfo de México, registrándose intensidades de 10 a 20 Km/h (5-11 Kt) en la costa de Tamaulipas y Veracruz, siendo en la Sonda de Campeche de 25 a 30 Km/h (13-16 Kt) y oleaje con altura significante de 0.9 a 1.2 m (3 a 4 ft). - //Pronosticador: LCA. Vilver Viveros / LCA. Rodrigo Flores Zamudio', textAlign: TextAlign.justify)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      height: 227,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Condiciones Meteorológicas y Situación de Operaciones en el Golfo de México 28/05/2020 12:00:00', style: TextStyle(color: Color.fromARGB(255, 4, 98, 190), fontWeight: FontWeight.bold, fontSize: 16)),
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            border: TableBorder.all(),
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Ciudad'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Viento Km/h'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dirección'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Olas mts'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Temperatura °C'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Presión hPa'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Cielo'),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('PTO. TUXPAN, VER.', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('10 a 15', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('ESTE', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Sin datos', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('32', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('1012, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Despejado', style: TextStyle(fontSize: 12),),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('Dos Bocas, Tab', style: TextStyle(fontSize: 12),),
                                  ),
                                ]
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
