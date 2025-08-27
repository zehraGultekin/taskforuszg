import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';

final timeProvider = StateProvider<String?>((ref) => null);
final selectedPermissionType = StateProvider<String>((ref) => "Yıllık İzin");

final permissionProvider =
    StateNotifierProvider<PermissionNotifier, List<PermissionModel>>(
      (ref) => PermissionNotifier(),
    );

class PermissionNotifier extends StateNotifier<List<PermissionModel>> {
  PermissionNotifier() : super(List.from(items));

  void addPermission(PermissionModel permisson) {
    state = [...state, permisson];
  }
}
