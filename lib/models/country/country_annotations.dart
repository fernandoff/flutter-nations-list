class CountryAnnotationsModel {
  final String sourceName;
  final String sourceDescription;
  final String datasetName;
  final String datasetLink;
  final String tableId;
  final String topic;
  final String subtopic;

//<editor-fold desc="Data Methods">
  const CountryAnnotationsModel({
    required this.sourceName,
    required this.sourceDescription,
    required this.datasetName,
    required this.datasetLink,
    required this.tableId,
    required this.topic,
    required this.subtopic,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountryAnnotationsModel &&
          runtimeType == other.runtimeType &&
          sourceName == other.sourceName &&
          sourceDescription == other.sourceDescription &&
          datasetName == other.datasetName &&
          datasetLink == other.datasetLink &&
          tableId == other.tableId &&
          topic == other.topic &&
          subtopic == other.subtopic);

  @override
  int get hashCode =>
      sourceName.hashCode ^
      sourceDescription.hashCode ^
      datasetName.hashCode ^
      datasetLink.hashCode ^
      tableId.hashCode ^
      topic.hashCode ^
      subtopic.hashCode;

  @override
  String toString() {
    return 'CountryAnnotationsModel{ sourceName: $sourceName, sourceDescription: $sourceDescription, datasetName: $datasetName, datasetLink: $datasetLink, tableId: $tableId, topic: $topic, subtopic: $subtopic,}';
  }

  CountryAnnotationsModel copyWith({
    String? sourceName,
    String? sourceDescription,
    String? datasetName,
    String? datasetLink,
    String? tableId,
    String? topic,
    String? subtopic,
  }) {
    return CountryAnnotationsModel(
      sourceName: sourceName ?? this.sourceName,
      sourceDescription: sourceDescription ?? this.sourceDescription,
      datasetName: datasetName ?? this.datasetName,
      datasetLink: datasetLink ?? this.datasetLink,
      tableId: tableId ?? this.tableId,
      topic: topic ?? this.topic,
      subtopic: subtopic ?? this.subtopic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sourceName': sourceName,
      'sourceDescription': sourceDescription,
      'datasetName': datasetName,
      'datasetLink': datasetLink,
      'tableId': tableId,
      'topic': topic,
      'subtopic': subtopic,
    };
  }

  factory CountryAnnotationsModel.fromMap(Map<String, dynamic> map) {
    return CountryAnnotationsModel(
      sourceName: map['sourceName'] as String,
      sourceDescription: map['sourceDescription'] as String,
      datasetName: map['datasetName'] as String,
      datasetLink: map['datasetLink'] as String,
      tableId: map['tableId'] as String,
      topic: map['topic'] as String,
      subtopic: map['subtopic'] as String,
    );
  }

//</editor-fold>
}