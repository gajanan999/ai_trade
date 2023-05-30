import 'package:ai_trade/src/imports.dart';

class GoldSummaryModel with ChangeNotifier, DiagnosticableTreeMixin {

  String _summary = '';
  String _signal = '';
  String _time = '';

  GoldSummaryModel();

  void updateGoldSummary(String newSummary, String signal, String time){
    _summary = newSummary ?? '';
    _signal = signal ?? '';
    _time = time ?? '';
    notifyListeners();
  }

  String get time => _time;

  String get signal => _signal;

  String get summary => _summary;
}
