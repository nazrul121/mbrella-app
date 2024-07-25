import 'package:flutter/material.dart';
import 'package:mbrella/includes/utility.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? selectedCountry;
  final List<String> countries = ['USA', 'Canada', 'UK', 'Germany', 'France']; // Example country list

  Future<void> _launchSocialMediaUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.yellow.withOpacity(0.3),
                ],
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  bottom: 30.0,
                  left: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mbrella ltd',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(3, -5), // Offset for the shadow
                              blurRadius: 3.0, // Blur radius for the shadow
                              color: Colors.black, // Color of the shadow
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'A Mondol group product',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: Offset(3, 5), // Offset for the shadow
                              blurRadius: 3.0, // Blur radius for the shadow
                              color: Colors.black, // Color of the shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 25.0,
                  right: 30.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(-7, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        child: Image.asset(
                          'assets/logo.png', // Replace with your logo image path
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp(page: 0)),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: ExpansionTile(
              leading: const Icon(Icons.discount_sharp, color: Colors.blueGrey),
              title: const Text('Browse category'),
              backgroundColor: Colors.green.withOpacity(0.1),
              collapsedBackgroundColor: Colors.green.withOpacity(0.1),
              children: <Widget>[
                ListTile(
                  title: const Text('Men`s Item'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Ladies items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Kids items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: ExpansionTile(
              leading: const Icon(Icons.settings_accessibility_sharp, color: Colors.blueGrey),
              title: const Text('Season products'),
              backgroundColor: Colors.yellow.withOpacity(0.1),
              collapsedBackgroundColor: Colors.yellow.withOpacity(0.1),
              children: <Widget>[
                ListTile(
                  title: const Text('Men`s Item'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Ladies items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Kids items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: ExpansionTile(
              leading: const Icon(Icons.percent_sharp, color: Colors.blueGrey),
              title: const Text('Discount Sales'),
              backgroundColor: Colors.orange.withOpacity(0.1),
              collapsedBackgroundColor: Colors.orange.withOpacity(0.1),
              children: <Widget>[
                ExpansionTile(
                  leading: const Icon(Icons.arrow_right, color: Colors.blueGrey),
                  title: const Text('More Categories'),
                  backgroundColor: Colors.orange.withOpacity(0.05),
                  collapsedBackgroundColor: Colors.orange.withOpacity(0.05),
                  children: <Widget>[
                    ListTile(
                      title: const Text('Category 1'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text('Category 2'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    // Add more list items as needed
                  ],
                ),
                ListTile(
                  title: const Text('Ladies items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Kids items'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Countries'),
            trailing: DropdownButton<String>(
              value: selectedCountry,
              hint: const Text('Select Country'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                });
              },
              items: countries.map<DropdownMenuItem<String>>((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 10),
          ListTile(
            leading: const Icon(Icons.local_police_outlined),
            title: const Text('Policies'),
            onTap: () async {
              _launchSocialMediaUrl('https://mbrellabd.com/about/policy/all');
            },
          ),
          const Divider(height: 10),
          FutureBuilder<bool>(
            future: Utility.isLoggedIn(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error fetching login status'));
              } else {
                bool isLoggedIn = snapshot.data ?? false;
                if (isLoggedIn) {
                  return ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.red.withOpacity(0.5)),
                    title: Text('Logout',style: TextStyle(color: Colors.red.withOpacity(0.5))),
                    onTap: () {
                      Utility.setLoggedIn(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(page: 4)),
                      );
                    },
                  );
                } else {
                  return ListTile(
                    leading: const Icon(Icons.login_outlined),
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(page: 4)),
                      );
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
