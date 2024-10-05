import 'package:flutter/cupertino.dart';

import '../../interfaces/iactivity_indicator.dart';

class IosActivityIndicator implements IActivityIndicator {
  
  const IosActivityIndicator();

  @override
  Widget render() {
    return const CupertinoActivityIndicator();
  }
}