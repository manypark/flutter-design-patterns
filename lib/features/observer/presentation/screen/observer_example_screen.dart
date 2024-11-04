import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/default_stock_subscriber.dart';
import '../widgets/gamestop_stock_ticker.dart';
import '../widgets/google_stock_ticker.dart';
import '../widgets/growing_stock_subscriber.dart';
import '../widgets/selections/selections.dart';
import '../widgets/stock.dart';
import '../widgets/stock_row.dart';
import '../widgets/stock_subscriber.dart';
import '../widgets/stock_ticker_model.dart';
import '../widgets/tesla_stock_ticker.dart';

class ObserverExample extends StatefulWidget {

  static String path = '/observer-example-screen';

  const ObserverExample({super.key});

  @override
  ObserverExampleState createState() => ObserverExampleState();
}

class ObserverExampleState extends State<ObserverExample> {
  
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber(),
  ];

  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GameStopStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TeslaStockTicker()),
  ];

  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  StockSubscriber _subscriber = DefaultStockSubscriber();
  var _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();
    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {

    for (final ticker in _stockTickers) {
      ticker.stockTicker.stopTicker();
    }

    _stockStreamSubscription?.cancel();

    super.dispose();
  }

  void _onStockChange(Stock stock) => setState(() => _stockEntries.add(stock));

  void _setSelectedSubscriberIndex(int? index) {
    for (final ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {

    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    if (stockTickerModel.subscribed) {
      stockTicker.unsubscribe(_subscriber);
    } else {
      stockTicker.subscribe(_subscriber);
    }

    setState(() => stockTickerModel.toggleSubscribed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
      
            StockSubscriberSelection(
              stockSubscriberList : _stockSubscriberList,
              selectedIndex       : _selectedSubscriberIndex,
              onChanged           : _setSelectedSubscriberIndex, 
            ),
      
            StockTickerSelection(
              stockTickers: _stockTickers,
              onChanged   : _toggleStockTickerSelection,
            ),
            
            Column(
              children: [
                ListView.builder(
                  addAutomaticKeepAlives: false,
                  physics     : const NeverScrollableScrollPhysics(),
                  shrinkWrap  : true,
                  itemCount   : _stockEntries.reversed.length,
                  itemBuilder : (BuildContext context, int index) {

                    final stock = _stockEntries[index];

                    return StockRow(stock: stock);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
