import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterdScreen extends StatefulWidget {
  //const FilterdScreen({super.key});

  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterdScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterdScreen> createState() => _FilterdScreenState();
}

class _FilterdScreenState extends State<FilterdScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  void initState() {
    // TODO: implement initState
    _Family = widget.currentFilters['family']!;
    _Summer = widget.currentFilters['summer']!;
    _Winter = widget.currentFilters['winter']!;

    super.initState();
  }

  SwitchListTile buildSwitchListTile(String title, String subtitle,
      var currentValue, ValueChanged<bool> updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' الفلترة',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'winter': _Winter,
                'family': _Family,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'الرحلات الصيفية', 'اظهار الرحلات الصيفية فقط ', _Summer,
                    (newValue) {
                  setState(() {
                    _Summer = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات الشتوية', 'اظهار الرحلات الشتوية فقط ', _Winter,
                    (newValue) {
                  setState(() {
                    _Winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات للعائلات', 'اظهار الرحلات للعائلات فقط ', _Family,
                    (newValue) {
                  setState(() {
                    _Family = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
