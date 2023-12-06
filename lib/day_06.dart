Future<int> day6A(String inputFile, bool test) async {
  late Map<int, int> data;
  if (test) {
    data = testData;
  } else {
    data = taskData;
  }
  var totalWays = <int>[];

  for (var t in data.keys) {
    var ways = 0;
    for (var i = 0; i < t; i++) {
      if (i * (t - i) > data[t]!) {
        ways++;
      }
    }
    totalWays.add(ways);
  }
  return totalWays.fold<int>(1, (p, c) => p * c);
}

Future<int> day6B(String inputFile, bool test) async {
  var totalWays = <int>[];
  var t = test ? 71530 : 61709066;
  var d = test ? 940200 : 643118413621041;
  var ways = 0;
  for (var i = 0; i < t; i++) {
    if (i * (t - i) > d) {
      ways++;
    }
  }
  totalWays.add(ways);

  return totalWays.fold<int>(1, (p, c) => p * c);
}

var testData = <int, int>{
  7: 9,
  15: 40,
  30: 200,
};

var taskData = <int, int>{
  61: 643,
  70: 1184,
  90: 1362,
  66: 1041,
};
