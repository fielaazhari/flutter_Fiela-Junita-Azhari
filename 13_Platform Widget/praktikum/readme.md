# (13) Platform Widget
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari

## Task
### CupertinoNavigationBar
    import 'package:flutter/cupertino.dart';

    void main() => runApp(const NavBarApp());

    class NavBarApp extends StatelessWidget {
    const NavBarApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: NavBarExample(),
        );
    }
    }

    class NavBarExample extends StatefulWidget {
    const NavBarExample({super.key});

    @override
    State<NavBarExample> createState() => _NavBarExampleState();
    }

    class _NavBarExampleState extends State<NavBarExample> {
    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            // Try removing opacity to observe the lack of a blur effect and of sliding content.
            backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
            middle: const Text('CupertinoNavigationBar Sample'),
        ),
        child: Column(
            children: <Widget>[
            Container(height: 50, color: CupertinoColors.systemRed),
            Container(height: 50, color: CupertinoColors.systemGreen),
            Container(height: 50, color: CupertinoColors.systemBlue),
            Container(height: 50, color: CupertinoColors.systemYellow),
            ],
        ),
        );
    }
    }
      
### CupertinoSearchTextField
    import 'package:flutter/cupertino.dart';

    void main() => runApp(const SearchTextFieldApp());

    class SearchTextFieldApp extends StatelessWidget {
    const SearchTextFieldApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: SearchTextFieldExample(),
        );
    }
    }

    class SearchTextFieldExample extends StatefulWidget {
    const SearchTextFieldExample({super.key});

    @override
    State<SearchTextFieldExample> createState() => _SearchTextFieldExampleState();
    }

    class _SearchTextFieldExampleState extends State<SearchTextFieldExample> {
    late TextEditingController textController;

    @override
    void initState() {
        super.initState();
        textController = TextEditingController(text: 'initial text');
    }

    @override
    void dispose() {
        textController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('CupertinoSearchTextField Sample'),
        ),
        child: Center(
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoSearchTextField(
                controller: textController,
                placeholder: 'Search',
            ),
            ),
        ),
        );
    }
    }

### CupertinoTabBar
    import 'package:flutter/cupertino.dart';

    void main() => runApp(const CupertinoTabBarApp());

    class CupertinoTabBarApp extends StatelessWidget {
    const CupertinoTabBarApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoTabBarExample(),
        );
    }
    }

    class CupertinoTabBarExample extends StatelessWidget {
    const CupertinoTabBarExample({super.key});

    @override
    Widget build(BuildContext context) {
        return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.star_fill),
                label: 'Favourites',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock_solid),
                label: 'Recents',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: 'Contacts',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
                label: 'Keypad',
            ),
            ],
        ),
        tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
            builder: (BuildContext context) {
                return Center(
                child: Text('Content of tab $index'),
                );
            },
            );
        },
        );
    }
    }
