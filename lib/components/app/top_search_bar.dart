import 'package:flutter/material.dart';

class TopSearchBar extends StatefulWidget {
  final bool search;
  final Function toggleSearch;

  TopSearchBar({Key key, this.search, this.toggleSearch}) : super(key: key);

  @override
  _TopSearchBarState createState() => _TopSearchBarState();
}

class _TopSearchBarState extends State<TopSearchBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => widget.toggleSearch(true),
        child: Row(
          children: <Widget>[
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: Container(
                child: widget.search
                    ? IconButton(
                        onPressed: () => widget.toggleSearch(false),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    : null,
                width: widget.search ? 42.0 : 0,
              ),
              vsync: this,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 42.0,
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Flexible(
                      flex: widget.search ? 1 : 0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        child: Container(
                          width: widget.search ? double.infinity : 0.0,
                          child: widget.search
                              ? TextField(
                                  cursorWidth: 1.5,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    contentPadding: EdgeInsets.only(
                                      bottom: 5.0,
                                    ),
                                  ),
                                  autofocus: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color: Colors.black),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: widget.search ? 0 : 1,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: widget.search ? 0.0 : 1.0,
                        child: Container(
                          width: widget.search ? 0.0 : double.infinity,
                          child: Center(
                            child: Text(
                              'Search your recipes',
                              style: Theme.of(context).textTheme.subtitle1,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.search ? 0.0 : 42.0,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
              ),
            ),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
    );
  }
}
