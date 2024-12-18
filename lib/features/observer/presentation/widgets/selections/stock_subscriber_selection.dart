
import 'package:flutter/material.dart';

import '../stock_subscriber.dart';

class StockSubscriberSelection extends StatelessWidget {

  final List<StockSubscriber> stockSubscriberList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const StockSubscriberSelection({
    super.key,
    required this.stockSubscriberList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (i, subscriber) in stockSubscriberList.indexed)
          RadioListTile(
            title: Text(subscriber.title),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            onChanged: onChanged,
          ),
      ],
    );
  }
}