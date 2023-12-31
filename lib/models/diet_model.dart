class CutDiet {
  final String CutTip1;
  final String CutTip2;
  final String CutTip3;
  final String CutTip4;
  final String CutTip5;

  CutDiet({
    required this.CutTip1,
    required this.CutTip2,
    required this.CutTip3,
    required this.CutTip4,
    required this.CutTip5,
  });

  Map<String, dynamic> toMap() {
    return {
      'CutTip1': CutTip1,
      'CutTip2': CutTip2,
      'CutTip3': CutTip3,
      'CutTip4': CutTip4,
      'CutTip5': CutTip5,
    };
  }

  factory CutDiet.fromMap(Map<String, dynamic> map) {
    return CutDiet(
      CutTip1: map['CutTip1'],
      CutTip2: map['CutTip2'],
      CutTip3: map['CutTip3'],
      CutTip4: map['CutTip4'],
      CutTip5: map['CutTip5'],
    );
  }
}

class BulkDiet {
  final String BulkTip1;
  final String BulkTip2;
  final String BulkTip3;
  final String BulkTip4;
  final String BulkTip5;

  BulkDiet({
    required this.BulkTip1,
    required this.BulkTip2,
    required this.BulkTip3,
    required this.BulkTip4,
    required this.BulkTip5,
  });
}

// File Download Method
class CutFile {
  String cutFilePath;

  CutFile({
    required this.cutFilePath,
  });
}

class BulkFile {
  String bulkFilePath;

  BulkFile({
    required this.bulkFilePath,
  });
}