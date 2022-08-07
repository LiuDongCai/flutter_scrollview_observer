import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:scrollview_observer/src/common/models/observe_model.dart';

class ListViewObserveModel extends ObserveModel {
  ListViewObserveModel({
    required this.sliverList,
    required this.firstChild,
    required this.displayingChildModelList,
    required bool visible,
  }) : super(
          visible: visible,
          sliver: sliverList,
          innerDisplayingChildModelList: displayingChildModelList,
        );

  /// The target sliverList.
  RenderSliverList sliverList;

  /// The observing data of the first child widget that is displaying.
  final ListViewObserveDisplayingChildModel? firstChild;

  /// Stores observing model list of displaying children widgets.
  final List<ListViewObserveDisplayingChildModel> displayingChildModelList;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is ListViewObserveModel) {
      return firstChild == other.firstChild &&
          listEquals(displayingChildModelList, other.displayingChildModelList);
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    return firstChild.hashCode + displayingChildModelList.hashCode;
  }
}
