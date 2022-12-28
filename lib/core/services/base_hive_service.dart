import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseHiveService {
  Future<void> init() async {
    await Hive.initFlutter();
    registerAdapter();
  }

  void registerAdapter();

  //#region INSERT

  Future<void> insert<DataType>({required String boxName, required dynamic data, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.add(data);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[insert] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<void> insertOne({required String boxName, required String keyName, required dynamic data, closeAfter = true}) async {
    try {
      Box box = await openBox(boxName);
      await box.put(keyName, data);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[insertOne] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<void> insertAll<DataType>({required String boxName, required List<dynamic> listData, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.addAll(listData);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[insertAll] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  //#endregion

  //#region UPDATE

  Future<void> updateAt<DataType>({required String boxName, required int index, required dynamic data, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.putAt(index, data);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[updateAt] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  //#endregion

  //#region GET

  Future<List<dynamic>> getAll<DataType>({required String boxName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      dynamic results = box.values.toList();
      if (box.isOpen && closeAfter) {
        await box.close();
      }
      return results ?? [];
    } catch (error, s) {
      throw HiveError('[getAll] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<List<DataType>> getSome<DataType>({required String boxName, required int page, required int pageSize, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      int length = box.length;
      int limit = pageSize;
      int offset = (page - 1) * limit;
      int maxIndex = ((offset + limit) < length) ? (offset + limit) : (length);
      List<DataType> tempList = [];
      for (int i = offset; i < maxIndex; i++) {
        DataType result = box.getAt(i);
        tempList.add(result);
      }
      if (box.isOpen && closeAfter) {
        await box.close();
      }
      return tempList;
    } catch (error, s) {
      throw HiveError('[getSome] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<int> getDataLength<DataType>({required String boxName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      int length = box.length;
      if (box.isOpen && closeAfter) {
        await box.close();
      }
      return length;
    } catch (error, s) {
      throw HiveError('[getDataLength] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<dynamic> getFirst<DataType>({required String boxName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      dynamic results = box.getAt(0);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
      return results;
    } catch (error, s) {
      throw HiveError('[getFirst] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<dynamic> getOne<DataType>({required String boxName, required String keyName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      dynamic result = await box.get(keyName);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
      return result;
    } catch (error, s) {
      throw HiveError('[getOne] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  //#endregion

  //#region DELETE

  Future<void> deleteAll<DataType>({required String boxName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.clear();
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[deleteAll] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<void> deleteOne<DataType>({required String boxName, required String keyName, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.delete(keyName);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[deleteOne] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  Future<void> deleteAt<DataType>({required String boxName, required int index, closeAfter = true}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.deleteAt(index);
      if (box.isOpen && closeAfter) {
        await box.close();
      }
    } catch (error, s) {
      throw HiveError('[deleteAt] BOX: $boxName | ${error.toString()} | $s');
    }
  }

  //#endregion

  //#region CORE

  Future<Box> openBox<DataType>(String boxName) async {
    try {
      final isBoxOpen = Hive.isBoxOpen(boxName);
      if (isBoxOpen) {
        final Box box = Hive.box<DataType>(boxName);
        return box;
      } else {
        final Box box = await Hive.openBox<DataType>(boxName);
        return box;
      }
    } catch (error, s) {
      throw HiveError('OPEN BOX ERROR $boxName | ${error.toString()} | $s');
    }
  }

  //#endregion
}
