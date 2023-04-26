import 'dart:typed_data';

import 'package:e_banati/heroes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-banati',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HeroesList());
  }
}

class HeroesList extends StatefulWidget {
  const HeroesList({Key? key}) : super(key: key);

  @override
  State<HeroesList> createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  @override
  Widget build(BuildContext context) {
    List<Heroes> heroes = [
      Heroes(1, 'assets/images/Dimas.png', 3, 10, 1, 'Dimas'),
      Heroes(2, 'assets/images/Tyoma.png', 3, 20, 1, 'Tyoma'),
      Heroes(3, 'assets/images/Sergey.png', 3, 10, 1, 'Sergey'),
      Heroes(4, 'assets/images/Sanya.png', 2, 10, 1, 'Sanya'),
      Heroes(5, 'assets/images/Lena.png', 1, 10, 1, 'Lena'),
      Heroes(6, 'assets/images/Yulia.png', 1, 10, 1, 'Yulia'),
    ];
    return Material(
        child: ListView.builder(
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              Heroes item = heroes[index];
              return ListTile(
                title: Image.asset(item.cardImage),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailsScreen(heroesElements: item),
                      ));
                },
              );
            }));
  }
}

class ItemDetailsScreen extends StatefulWidget {
  final Heroes heroesElements;

  ItemDetailsScreen({super.key, required this.heroesElements});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int _atk = 0;
  int _hp = 0;
  int _lvl = 0;

  @override
  void initState() {
    super.initState();
    _atk = widget.heroesElements.atk;
    _hp = widget.heroesElements.hp;
    _lvl = widget.heroesElements.lvl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(widget.heroesElements.cardImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('ATK:'),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _atk--;
                    });
                  },
                ),
                Text('$_atk'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _atk++;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('HP:'),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _hp--;
                    });
                  },
                ),
                Text('$_hp'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _hp++;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('LVL:'),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _lvl--;
                    });
                  },
                ),
                Text('$_lvl'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _lvl++;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
