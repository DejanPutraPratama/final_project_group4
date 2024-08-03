class WasteHistoryModel {
  String wasteType;
  double wasteWeight;
  String destinationLandfill;
  DateTime uploadedAt;

  WasteHistoryModel(
      {required this.wasteType,
      required this.wasteWeight,
      required this.destinationLandfill,
      required this.uploadedAt});
}
