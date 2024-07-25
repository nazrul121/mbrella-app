import 'package:flutter/material.dart';
import 'package:mbrella/includes/search.dart';
import '../main.dart';


class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPressed;

  const ProductAppBar({ Key? key, required this.title, this.onPressed, }) : super(key: key);

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
          title: Text(title),
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
                  context: context,  position: position,
                  items: <PopupMenuEntry>[
                    PopupMenuItem(
                      child: InkWell(
                        child: const ListTile(
                          leading: Icon(Icons.home_filled),
                          title: Text('Home'),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(page: 0)));
                        },
                      )
                    ),

                    PopupMenuItem(
                        child: InkWell(
                          child: const ListTile(
                            leading: Icon(Icons.perm_identity),
                            title: Text('Account'),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp(page: 4)));
                          },
                        )
                    ),
                  ],
                );
              },
              icon: const Icon(Icons.more_vert)

            ),
          ]
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
