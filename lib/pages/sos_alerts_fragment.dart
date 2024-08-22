import 'package:flutter/material.dart';

class SosAlertsFragment extends StatefulWidget {
  const SosAlertsFragment({super.key});

  @override
  State<SosAlertsFragment> createState() => _SosAlertsFragmentState();
}

class _SosAlertsFragmentState extends State<SosAlertsFragment> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // The first row consisting of the page title and search bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('SOS Alerts',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              _buildSearchCard(),
            ],
          ),
          SizedBox(height: size.height * 0.0026),
          _buildMap(context),
          SizedBox(height: size.height * 0.0026),
          _buildSosAlertsCard()
        ],
      ),
    ));
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 270,
      height: 70,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            fillColor: Colors.white,
            // prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            hintText: 'Search',
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      child: const Center(
        child: Text('Map here'),
      ),
    );
  }

  Widget _buildSosAlertsCard() {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      child: Expanded(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            // width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.start,
                  'SOS Alerts',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                      ],
                    ),
                    // SizedBox(
                    //   width: size.width * 0.005,
                    // ),
                    Column(
                      children: [
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                      ],
                    ),
                    // SizedBox(
                    //   width: size.width * 0.005,
                    // ),
                    Column(
                      children: [
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                        const SizedBox(height: 6),
                        _buildStudentStatus('John Doe', 'BSc. Computer Science',
                            'KNUST Botanical Gardens', true),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStudentStatus(
      String name, String course, String location, bool online) {
    return Container(
      width: 340,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/visca.jpg'),
              radius: 26,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          name,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            online ? 'online' : 'offline',
                            style: const TextStyle(fontSize: 10),
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                              radius: 3,
                              backgroundColor:
                                  online ? Colors.green : Colors.red),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Text(
                    course,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Live Location: $location',
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
