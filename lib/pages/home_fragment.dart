// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
            width: size.width * 0.58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard(
                        context, '128', 'Reports', 'assets/images/reports.png'),
                    _buildCard(context, '14', 'Track Student',
                        'assets/images/track.png'),
                    _buildCard(
                        context, '145', 'SOS Alerts', 'assets/images/sos.png'),
                  ],
                ),
                const SizedBox(height: 20),
                _buildPerformanceChart(),
                const SizedBox(height: 20),
                _buildActiveSOSAlerts(context),
              ],
            ),
          ),
          SizedBox(width: size.width * 0.006),
          Column(
            children: [
              Container(
                // width: size.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildProfileCard(),
                    const SizedBox(height: 20),
                    _buildSearchCard(),
                    const SizedBox(height: 20),
                    _buildStudentsOnlineCard(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String count, String label, String icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.17,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(icon, height: 42, width: 42),
            ],
          ),
          const SizedBox(height: 3.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          InkWell(
            onTap: () {
              // onTap functionality here
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View more',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ).decorateContainer(),
        ],
      ),
    );
  }
}

extension DecorateContainer on Widget {
  Widget decorateContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 24, 115, 190),
            Color.fromARGB(255, 32, 89, 137),
            Color.fromARGB(255, 13, 60, 98),
          ],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: this,
    );
  }

  Widget _buildPerformanceChart() {
    final data = [
      PerformanceData('Jan', 30, 50, 10),
      PerformanceData('Feb', 70, 20, 30),
      PerformanceData('Mar', 50, 60, 20),
      PerformanceData('Apr', 40, 30, 60),
      PerformanceData('May', 90, 80, 40),
      PerformanceData('Jun', 60, 40, 70),
      PerformanceData('Jul', 100, 90, 50),
      PerformanceData('Aug', 80, 70, 30),
    ];

    final seriesList = [
      charts.Series<PerformanceData, String>(
        id: 'Reports',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.reports,
        data: data,
      ),
      charts.Series<PerformanceData, String>(
        id: 'Student Population',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.studentPopulation,
        data: data,
      ),
      charts.Series<PerformanceData, String>(
        id: 'Alerts',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (PerformanceData data, _) => data.month,
        measureFn: (PerformanceData data, _) => data.alerts,
        data: data,
      ),
    ];

    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
        color: Colors.white,
        // padding: const EdgeInsets.all(0),
        // margin: const EdgeInsets.all(8),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 15, left: 8, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Performance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const SizedBox(width: 3),
                          const Text('SOS Alerts')
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const SizedBox(width: 3),
                          const Text('Reports')
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                          const SizedBox(width: 3),
                          const Text('Student Population')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6))),
              height: 350,
              child: charts.BarChart(
                seriesList,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 270,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/visca.jpg'),
              radius: 30,
              // child: Image.asset('assets/images/visca.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              'Snr. System Administrator',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
            Text(
              'Email: johndoe@gmail.com',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveSOSAlerts(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
        color: Colors.white,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Active SOS Alerts'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: size.height * 0.36,
                      width: size.width * 0.38,
                      child: const GoogleMapWidget()),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[800],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('On campus',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SOS alerts',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '- 6 active',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[800],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Off-campus',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SOS alerts',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '- 6 active',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Widget _buildStudentsOnlineCard() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 270,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Students Online',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Divider(color: Colors.grey[200], thickness: 2),
            ),
            const SizedBox(height: 2),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('Chris Aggay', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', false),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus('John Doe', 'BSc. Computer Science', true),
            const SizedBox(height: 10),
            _buildStudentStatus(
                'Jane Smith', 'BSc. Information Technology', false),
            const SizedBox(height: 10),
            _buildStudentStatus(
                'David Brown', 'BSc. Software Engineering', true),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentStatus(String name, String course, bool online) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/visca.jpg'),
              radius: 22,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.green,
                      width: online ? 100 : 97,
                      child: Text(
                        name,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Spacer(),
                    // const SizedBox(width: 26),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          online ? 'online' : 'offline',
                          style: const TextStyle(fontSize: 10),
                          // color: online ? Colors.green : Colors.red
                        ),
                        const SizedBox(width: 4),
                        CircleAvatar(
                            radius: 3,
                            backgroundColor:
                                online ? Colors.green : Colors.red),
                      ],
                    ),
                  ],
                ),
                Text(
                  course,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        width: 270,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Search Students',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceData {
  final String month;
  final int reports;
  final int studentPopulation;
  final int alerts;

  PerformanceData(
      this.month, this.reports, this.studentPopulation, this.alerts);
}

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.8688, 151.2093); // Sydney coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}
