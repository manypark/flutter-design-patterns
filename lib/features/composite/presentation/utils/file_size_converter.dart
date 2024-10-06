class FileSizeConverter {

  const FileSizeConverter._();

  static String bytesToString(int bytes) {

    final sizes = ['B', 'KB', 'MB', 'GB', 'TB'];

    double len = bytes.toDouble();
    
    int order = 0;

    while (len >= 1024 && order++ < sizes.length - 1) {
      len /= 1024;
    }

    return '${len.toStringAsFixed(2)} ${sizes[order]}';
  }
}