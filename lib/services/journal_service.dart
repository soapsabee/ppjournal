
import 'package:ppjournal/data/local/database.dart';
import 'package:ppjournal/data/models/journal_model.dart';
import 'package:ppjournal/data/repositories/journal_repository.dart';

class JournalService {
  // This class will handle
  final JournalRepository journalRepository;
  JournalService(this.journalRepository);

  Future<List<JournalFull>> getAllJournalsFull(int portId) async {
    return await journalRepository.getAllJournalsFull(portId);
  }

  Future<List<JournalData>> getAllJournals() async {
    return await journalRepository.getAllJournals();
  }

  Future<JournalFull?> getJournalById(int id) async {
    return await journalRepository.getJournalById(id);
  }

  Future<int> insertJournal(JournalCompanion data) async {
    return await journalRepository.insertJournal(data);
  }

  Future<bool> updateJournal(int journalId, JournalCompanion data) async {
    return await journalRepository.updateJournal(journalId, data);
  }

  Future<int> deleteJournal(int id) async {
    return await journalRepository.deleteJournal(id);
  }
}