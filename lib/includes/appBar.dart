import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mbrella/outlet/list.dart';
import 'package:mbrella/includes/search.dart';
import 'package:url_launcher/url_launcher.dart';

class appBarInfo extends StatefulWidget  implements PreferredSizeWidget {
  final String title;
  const appBarInfo({Key? key, required this.title}) : super(key: key);

  @override
  State<appBarInfo> createState() => _appBarInfoState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _appBarInfoState extends State<appBarInfo> {

  Future<void> _launchSocialMediaUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $urlString');
    }
  }


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.yellow.withOpacity(0.3)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const FaIcon(FontAwesomeIcons.barsStaggered), // Use FontAwesome icon here
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchButton()));
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const SearchButton(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );

            },
            icon: const Icon(Icons.search, size: 28,),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Outlet()));
              Navigator.push( context,
                MaterialPageRoute(
                  builder: (context) => const Outlet(),
                  fullscreenDialog: true, // Optional: Shows a fullscreen dialog transition
                ),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.shop, size: 19,),
          ),
          IconButton(
            onPressed: () {
              // Get the RenderBox of the IconButton
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              // Get the size and position of the RenderBox
              var size = renderBox.size;
              var offset = renderBox.localToGlobal(Offset.zero);

              // Calculate the position for the menu
              var position = RelativeRect.fromLTRB(
                offset.dx + size.width - 150, // adjust this value according to your needs
                offset.dy + size.height,
                offset.dx + size.width,
                offset.dy + size.height + 100, // adjust this value according to your needs
              );

              showMenu(
                context: context,
                position: position,
                items: <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color
                        borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                      ),
                      child: InkWell(
                        child: const ListTile(
                          leading: Icon(Icons.policy_outlined),
                          title: Text('Privacy policy'),
                        ),
                        onTap: () async {
                          _launchSocialMediaUrl('https://mbrellabd.com/about/policy/privacy-policy');
                        },
                      ),
                    ),
                  ),

                  PopupMenuItem(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color
                        borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                      ),
                      child: InkWell(
                        child: const ListTile(
                          leading: Icon(Icons.policy_outlined),
                          title: Text('Terms and Conditions'),
                        ),
                        onTap: () async {
                          _launchSocialMediaUrl('https://mbrellabd.com/about/policy/terms-and-conditions');
                        },
                      ),
                    ),
                  ),

                  PopupMenuItem(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color
                        borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                      ),
                      child: InkWell(
                        child: const ListTile(
                          leading: Icon(Icons.policy_outlined),
                          title: Text('Terms and Conditions'),
                        ),
                        onTap: () async {
                          _launchSocialMediaUrl('https://mbrellabd.com/about/policy/all');
                        },
                      ),
                    ),
                  ),

                  PopupMenuItem(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Background color
                        borderRadius: BorderRadius.circular(8.0), // Optional: Round the corners
                      ),
                      child: InkWell(
                        child: const ListTile(
                          leading: Icon(Icons.photo_size_select_large),
                          title: Text('Product size guide'),
                        ),
                        onTap: () async {
                          _launchSocialMediaUrl('https://mbrellabd.com/size-guide');
                        },
                      ),
                    ),
                  ),

                ],
              );
            },
            icon: const FaIcon(FontAwesomeIcons.gripVertical, size: 18,),
          ),
        ]
      ),
    );
  }

}
