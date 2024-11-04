
import 'package:flutter/material.dart';

import 'stock.dart';
import 'stock_change_direction.dart';

class StockRow extends StatelessWidget {
  
  const StockRow({
    super.key,
    required this.stock,
  });

  final Stock stock;

  Color get color => stock.changeDirection == StockChangeDirection.growing
      ? Colors.green
      : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40 * 2,
          child: Text(
            stock.symbol.name,
            style: TextStyle(color: color),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 40 * 2,
          child: Text(
            stock.price.toString(),
            style: TextStyle(color: color),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Icon(
            stock.changeDirection == StockChangeDirection.growing
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: color,
          ),
        ),
        Text(
          stock.changeAmount.toStringAsFixed(2),
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}