import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the Cubit
class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void changeTab(int index) {
    emit(index);
  }
}

// Define the Cubit state
class NavigationState {}

// Define the five screens
class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Screen One',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Screen Two',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Screen Three',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class ScreenFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Screen Four',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

class ScreenFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          'Screen Five',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}

// Define the bottom navigation bar widget
class BottomNavigationBarWidget extends StatelessWidget {
  final NavigationCubit navigationCubit;

  BottomNavigationBarWidget({required this.navigationCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      bloc: navigationCubit,
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
              ScreenFour(),
              ScreenFive(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => navigationCubit.changeTab(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Screen One',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Screen Two',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Screen Three',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Screen Four',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Screen Five',
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => NavigationCubit(),
        child: BottomNavigationBarWidget(
          navigationCubit: NavigationCubit(),
        ),
      ),
    ),
  );
}