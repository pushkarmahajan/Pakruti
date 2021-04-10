import 'package:flutter/material.dart';
import 'package:pakruti/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const RouteName = '/filterScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilteres;
  FiltersScreen(this.currentFilteres, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState(){
    _glutenFree = widget.currentFilteres['gluten'];
    _vegetarian = widget.currentFilteres['vegetarian'];
    _vegan = widget.currentFilteres['vegan'];
    _lactoseFree = widget.currentFilteres['lactose'];
    super.initState();
  }


  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      activeColor: Colors.cyan,
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  bool updateValue(currenValue) {
    return !currenValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: (){
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);})
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-Free',
                    'Only shows recipe which are gluten free',
                    _glutenFree, (newValue) {
                  setState(() {_glutenFree = newValue;});

                }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only shows recipe which are vegetarian',
                    _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });

                }),
                _buildSwitchListTile(
                    'Vegan', 'Only shows recipe which are vegan', _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });

                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only shows recipe which are lactose free',
                    _lactoseFree, (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });

                }),
              ],
            ))
          ],
        ));
  }
}
