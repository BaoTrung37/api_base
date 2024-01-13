import 'dart:async';

import 'package:api_base/gen/assets.gen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:api_base/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum InfiniteListType {
  list,
  grid,
}

mixin DataSource<E> {
  E get getData;
}

mixin InfiniteListDelegate {
  int get firstPage {
    return 1;
  }

  late final PagingController<int, DataSource> _infiniteListPagingController =
      PagingController(firstPageKey: firstPage);

  void replaceChunk({
    required List<DataSource> replacements,
    required CheckItemFunction condition,
  }) {
    final items = _infiniteListPagingController.itemList;
    if (items != null) {
      final start = items.indexWhere((element) => condition(element));
      final end = items.lastIndexWhere((element) => condition(element));
      items.replaceRange(start, end + 1, replacements);
      _infiniteListPagingController.itemList = items;
    }
  }

  void addToFirst(DataSource item) {
    final items = _infiniteListPagingController.itemList;
    if (items != null) {
      items.insert(0, item);
      _infiniteListPagingController.itemList = items;
    }
  }

  void replace(DataSource item, int index) {
    final items = List.from(_infiniteListPagingController.itemList ?? []);
    if (index < items.length) {
      items[index] = item;
      _infiniteListPagingController.itemList = items.cast<DataSource>();
    }
  }

  void delete(int index) {
    final items = List.from(_infiniteListPagingController.itemList ?? []);
    if (index < items.length) {
      items.removeAt(index);
      _infiniteListPagingController.itemList = items.cast<DataSource>();
    }
  }

  void appendAtBegin(List<DataSource> items) {
    if (items.isEmpty) {
      return;
    }
    final currentItemSet =
        List<DataSource>.from(_infiniteListPagingController.itemList ?? []);
    currentItemSet.insertAll(0, items);
    _infiniteListPagingController.itemList = currentItemSet;
  }

  void refreshNextPage() {
    _infiniteListPagingController.nextPageKey = firstPage + 1;
  }

  void replaceAll(List<DataSource> newData) {
    _infiniteListPagingController.itemList = newData;
  }

  void reloadEverything() {
    _infiniteListPagingController.refresh();
  }
}

typedef FetchItemFunction = Future<List> Function(int pageKey, int perPage);
typedef CheckItemFunction = bool Function(DataSource item);
typedef PagedListCellBuilder = Widget Function(DataSource item, int index);

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({
    required this.perPage,
    required this.cellBuilder,
    required this.getDataSources,
    this.scrollController,
    this.type = InfiniteListType.list,
    this.separatorBuilder,
    this.firstKey = 1,
    this.scrollDirection = Axis.vertical,
    this.emptyView,
    this.onPullToRefreshComplete,
    this.paddings = EdgeInsets.zero,
    this.newPageIndicator,
    this.delegate,
    this.canPullToRefresh = false,
    this.gridDelegate,
    this.isReversed = false,
    this.shouldClearCacheImageAfterRefresh = false,
    // use the combination of AlwaysScrollableScrollPhysics and BouncingScrollPhysics
    // to fix the bug can not scroll view when all the content in ScrollView is visible
    // and [the ScrollView] is not bounce when scroll, leading to the refresh indicator
    // overlap scroll content in android.
    this.scrollPhysics =
        const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
    super.key,
  }) : assert((type == InfiniteListType.grid && gridDelegate != null) ||
            type == InfiniteListType.list);

  final int perPage;
  final PagedListCellBuilder cellBuilder;
  final FetchItemFunction getDataSources;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? emptyView;
  final Widget? newPageIndicator;
  final VoidCallback? onPullToRefreshComplete;
  final Axis scrollDirection;
  final int firstKey;
  final EdgeInsets? paddings;
  final InfiniteListDelegate? delegate;
  final bool canPullToRefresh;
  final ScrollController? scrollController;
  final ScrollPhysics scrollPhysics;

  final SliverGridDelegate? gridDelegate;
  final InfiniteListType type;

  final bool isReversed;
  final bool shouldClearCacheImageAfterRefresh;

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  late final PagingController<int, DataSource> _pagingController;

  @override
  void initState() {
    super.initState();
    _pagingController = widget.delegate?._infiniteListPagingController ??
        PagingController(firstPageKey: 1);

    _pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1 && widget.shouldClearCacheImageAfterRefresh) {
        PaintingBinding.instance.imageCache.clear();
      }
      Future.delayed(Duration.zero, () async {
        await _fetchNewPage(
          pageKey,
          widget.perPage,
          _pagingController,
          widget.getDataSources,
        );
      });
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case InfiniteListType.list:
        if (widget.canPullToRefresh) {
          return _buildRefreshView(
            child: _buildPagedList(),
          );
        } else {
          return _buildPagedList();
        }
      case InfiniteListType.grid:
        if (widget.canPullToRefresh) {
          return _buildRefreshView(
            child: _buildGridView(),
          );
        } else {
          return _buildGridView();
        }
    }
  }

  RefreshView _buildRefreshView({required Widget child}) {
    return RefreshView(
      onRefresh: () => Future.sync(
        () {
          widget.onPullToRefreshComplete?.call();
          return _pagingController.refresh();
        },
      ),
      child: child,
    );
  }

  Widget _buildGridView() {
    return PagedGridView<int, DataSource>(
      padding: widget.paddings,
      pagingController: _pagingController,
      builderDelegate: _builderDelegate(),
      gridDelegate: widget.gridDelegate!,
      physics: widget.scrollPhysics,
      scrollController: widget.scrollController,
    );
  }

  Widget _buildPagedList() {
    final separatedBuilder = widget.separatorBuilder;
    if (separatedBuilder != null) {
      return PagedListView<int, DataSource>.separated(
          separatorBuilder: separatedBuilder,
          padding: widget.paddings,
          reverse: widget.isReversed,
          scrollController: widget.scrollController,
          physics: widget.scrollPhysics,
          scrollDirection: widget.scrollDirection,
          pagingController: _pagingController,
          builderDelegate: _builderDelegate());
    } else {
      return PagedListView<int, DataSource>(
          padding: widget.paddings,
          reverse: widget.isReversed,
          scrollController: widget.scrollController,
          physics: widget.scrollPhysics,
          scrollDirection: widget.scrollDirection,
          pagingController: _pagingController,
          builderDelegate: _builderDelegate());
    }
  }

  PagedChildBuilderDelegate<DataSource> _builderDelegate() {
    return PagedChildBuilderDelegate<DataSource>(
      itemBuilder: (context, item, index) => widget.cellBuilder(
        item,
        index,
      ),
      firstPageProgressIndicatorBuilder: (_) => const AppLoadingIndicator(),
      noItemsFoundIndicatorBuilder: (_) =>
          widget.emptyView ?? const SizedBox.shrink(),
      firstPageErrorIndicatorBuilder: (_) => LoadingErrorView(
        onReload: _pagingController.retryLastFailedRequest,
      ),
      newPageProgressIndicatorBuilder: (_) =>
          widget.newPageIndicator ??
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: const AppLoadingIndicator(),
          ),
      newPageErrorIndicatorBuilder: (_) => _buildNewPageErrorView(),
    );
  }

  Widget _buildNewPageErrorView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: GestureDetector(
        onTap: () {
          _pagingController.retryLastFailedRequest();
        },
        child: Assets.icons.icRefresh.svg(
          height: 40.h,
          colorFilter: ColorFilter.mode(
            context.colors.iconPrimary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  Future<void> _fetchNewPage(
    int pageKey,
    int pageSize,
    PagingController pagingController,
    FetchItemFunction getItem,
  ) async {
    try {
      final newItems = await getItem.call(
        pageKey,
        widget.perPage,
      );
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      if (mounted) {
        pagingController.error = error;
      }
    }
  }
}
