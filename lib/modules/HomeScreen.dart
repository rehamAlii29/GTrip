import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gtrip/AppCubit.dart';
import 'package:gtrip/AppStates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            body: AppCubit.get(context).ScreensofNavbar[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (selectedIndex){
                AppCubit.get(context).toggelbetweenNavbarScreens(selectedIndex);
              },
            items: const [
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), label: "Home" ),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.history), label: "Home" ),
              BottomNavigationBarItem(icon: Icon(Icons.help), label: "Home" ),
              BottomNavigationBarItem(icon: Icon(Icons.read_more_sharp), label: "Home" ),
            ],
            ),
          );
    }
        );
  }
}
