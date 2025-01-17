extension NumberFormatting on double {
  String get formattedWithSpaces {
    return toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ');
  }

  String get formatCompact {
    if (this >= 1e9) {
      return '${(this / 1e9).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}B';
    } else if (this >= 1e6) {
      return '${(this / 1e6).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M';
    } else if (this >= 1e3) {
      return '${(this / 1e3).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K';
    } else {
      return this.toString();
    }
  }
}