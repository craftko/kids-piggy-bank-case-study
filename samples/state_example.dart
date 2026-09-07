import 'package:flutter/foundation.dart';

typedef PersistEntry = Future<void> Function(MoneyEntry entry);

class MoneyEntry {
  const MoneyEntry({
    required this.id,
    required this.amount,
    required this.label,
  });

  final String id;
  final double amount;
  final String label;
}

/// Illustrative optimistic state flow with rollback on persistence failure.
class LedgerController extends ChangeNotifier {
  LedgerController({required PersistEntry persistEntry}) : _persistEntry = persistEntry;

  final PersistEntry _persistEntry;
  List<MoneyEntry> _entries = const [];
  bool _isSaving = false;

  List<MoneyEntry> get entries => List.unmodifiable(_entries);
  bool get isSaving => _isSaving;

  Future<void> addEntry(MoneyEntry entry) async {
    final previous = _entries;
    _entries = [...previous, entry];
    _isSaving = true;
    notifyListeners();

    try {
      await _persistEntry(entry);
    } catch (_) {
      _entries = previous;
      rethrow;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }
}
