enum LocationAccuracy {
  /// Lowest possible accuracy, typically around 5000 meters
  /// Useful for very broad location tracking
  lowest,

  /// Low accuracy, around 2000 meters
  /// Suitable for country or large region-level tracking
  low,

  /// Medium accuracy, around 500-1000 meters
  /// Good for city-level location services
  medium,

  /// High accuracy, around 100-500 meters
  /// Suitable for neighborhood or district-level tracking
  high,

  /// Highest possible accuracy, around 10-50 meters
  /// Best for precise location tracking like navigation
  best,
}