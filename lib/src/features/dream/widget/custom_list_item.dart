import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget checkbox;
  final String title;
  final String date;
  final double price;

  const CustomListItem({
    required this.checkbox,
    required this.title,
    required this.date,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: checkbox,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text('Realização do sonho: $date'),
                const SizedBox(
                  height: 2.0,
                ),
                Text('Valor do sonho: R\$ $price'),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.more_vert,
              size: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
