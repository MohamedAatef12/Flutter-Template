// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// generated_from: lib/config/env/.env
final class _Env {
  static const List<int> _enviedkeybaseUrl = <int>[
    2015803504,
    1688488745,
    2206218920,
    104091306,
    3888933922,
    3777278657,
    2620696743,
    4266325705,
    1949538848,
    2359266390,
    1819418318,
    534196250,
    2969381179,
    2920195228,
    1973658285,
    3503084731,
    4080154325,
    1863837243,
    442581390,
    2730746623,
  ];

  static const List<int> _envieddatabaseUrl = <int>[
    2015803416,
    1688488797,
    2206218972,
    104091354,
    3888933969,
    3777278715,
    2620696712,
    4266325734,
    1949538905,
    2359266361,
    1819418299,
    534196328,
    2969381142,
    2920195325,
    1973658333,
    3503084754,
    4080154363,
    1863837272,
    442581473,
    2730746514,
  ];

  static final String baseUrl = String.fromCharCodes(
    List<int>.generate(
      _envieddatabaseUrl.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i]),
  );

  static const List<int> _enviedkeyapiKey = <int>[
    1224817425,
    394676093,
    1584225692,
    3613071992,
    1364405523,
    3012090378,
    3685646760,
    996083197,
    3671233205,
    2711788132,
    3632033782,
    1608161699,
    3924446237,
    3928666527,
    1156945905,
  ];

  static const List<int> _envieddataapiKey = <int>[
    1224817512,
    394675986,
    1584225769,
    3613071882,
    1364405566,
    3012090489,
    3685646797,
    996083102,
    3671233223,
    2711788033,
    3632033666,
    1608161678,
    3924446326,
    3928666618,
    1156945800,
  ];

  static final String apiKey = String.fromCharCodes(
    List<int>.generate(
      _envieddataapiKey.length,
      (int i) => i,
      growable: false,
    ).map((int i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i]),
  );
}
