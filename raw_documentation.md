# Raw documentation
## Meta information
### What is the purpose of this guide?

The goal of this guide is to set an entry point for state management in Flutter.

This guide helps Flutter developers and Flutter development teams that have to decide which state management solution (SMS) to choose for their app to determine which SMS is most likely the right tool for the job.

It should provide a reference about which state management solution is likely the right one to choose to build an example, small-scale, middle-scale, or large-scale application.
Or at least show the advantages and disadvantages of each solution so that you can make an educated decision yourself.

### Who is this guide for?

This guide is for Flutter developers and Flutter development teams that are planning their next Flutter project. 

It is for people who are overwhelmed by the amount of state management solutions provided by the community. For people who are searching for information about which SMS is in line with their requirements and why they should think about choosing it.

### How is this guide written?

This guide has been written for developers. So I want to keep it informal - from developer to developers. Throughout the guide, I will use the pronoun "we" and "you" to keep it that way.

### What resources were used to create this guide?

For the creation of this guide a collection of books, blog posts, journal article, official documentations and youtube videos has been used.

## 1. Basic knowledge

This chapter will cover the fundamental knowledge we will need to understand how Flutter works internally. It will include what state is in Flutter and how Flutter manages state in general.

### 1.1 Flutter under the hood
Before we take a look at Flutter under the hood, we should get acquainted with some definitions.

So, what is Flutter?

| :closed_book:      | Flutter |  Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.[@FlutterBeautifulNative]     |
|--------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

From the official Flutter documentation we learn that Flutter is declarative.

> Flutter builds its user interface to reflect the current state of your app. [@StartThinkingDeclaratively]

Therefore we can assume that Flutter follows the declarative programming paradigm. Declarative programming focuses on specifying the result of an operation rather than the computational processes it has to do to achieve the desired result. [@abe0560f66034ae3893128ebc0e8197e]Let's take a look at the theory of declarative programming in practice.

```dart
void main() => Center(child: Text('Hello World'));
```
_Code snippet 01: declarative programming example_

Code snippet 1 shows an example of Flutter declarative nature. As you can see, a `main()` method is declared, which returns a `Center` Widget, which holds a `Text` Widget. These declarations are all we need to tell Flutter to build a text in the center of the screen. No specification of what it needs to do to get the text to the screen had to be written.

I have mentioned Widgets a couple of times in the previous paragraph. So let's take a look at what widgets are in the next section.

#### 1.1.1 It's all widgets

To explain what widgets are and their role in Flutter I will reference the official Flutter documentation. [@TechnicalOverview]

In Flutter everything's a widget. 

Widgets are the basic building blocks of an application's user interface (UI). Custom widgets can be composed of smaller widgets and the overall composition of all widgets represents the UI. The relationship of widgets is handled by the widget tree. The concept of the widget tree helps Flutter to layout the UI. Figure 01 is a visualization of how the user interface is build:

|![equation](https://i.imgur.com/DoY8u5y.png)|
|:--:| 
|_Figure 01: How Flutter builds its UI_ [@StartThinkingDeclaratively]|

Since widgets are the building blocks of the UI we can assume that they equal the right side of the equation.

They are blueprints for parts of the UI that hold a configuration for a specific state. [@HowCreateStateless]

Let's take a look at how Flutter defines widgets:

| :closed_book:      | Widget |  A widget is an immutable description of part of a user interface. [@WidgetClassWidgets]     |
|--------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Typically a UI is mutable to reflect changes via for example user interaction. But how can Flutter reflecht changes in the user interface, when a widget is by definition immutable? The answer is simple. Flutter uses different types of widgets with different behaviour. Let's take a look at the different types of widgets.

#### 1.1.2 Types of Widgets

This section will cover the three different types of widget in Flutter. I will start with the Stateless Widget, then move on to the Stateful Widget and finish the section with the Inherited Widget.

##### Stateless widgets

To explain what a Stateless Widget is and how it works I will summarise the youtube video "How to Create Stateless Widgets - Flutter Widgets 101 Ep. 1". [@HowCreateStateless] It is the first video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

A Stateless Widget is specified by two concepts: (1) it has no mutable state it need to keep track of and (2) it is composed of children.

Let's take a look at the concepts in an example:

```dart
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget(this._title);
  final String _title;
  
  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}
```
_Code snippet 02: MyStatelessWidget example_

The first concept is reflected by the data `_title` that is hold by the widget. It is defined as `final` which means that the attribute can not be changed after it has been initialised.

The second concept is reflected by the `build()` method. This method has to return at least one widget which in this example is a Text Widget.

If we want Flutter to use this widget we have to declare it either as root of the widget tree or as part of a composition. The following code snippet shows the later:

```dart
...
	return Center(child: MyStatelessWidget('Hello World'));
...
```
_Code snippet 03: MyStatelessWidget as part of a composition_

When Flutter executes code snippet 03 it mounts the Center Widget to the widget tree. Then it call its `createElement()` method.

```dart
...
  @override
  StatelessElement createElement() => StatelessElement(this); 
...
```
_Code snippet 04: createElement method [@CreateElementMethodStatelessWidget]_

In reaction to the createElement method the StatelessElement gets mounted on the Element tree. I will explain what the Element tree is later in section 1.3 "How does Flutter react to state changes?" so bear with me.

After the StatelessElement has been mounted it tells its referenced Stateless Widget, in this case the Center Widget, to execute its build method to build its children. The children in this case is only one child - MyStatelessWidget.

So to summarise these steps:

1. Stateless Widget gets called and mounted to the widget tree
2. The widget calls its createElement method
3. The created element gets mounted to the element tree
4. The created element tells its referenced widget to build its children via its build method.

Let's take a look at how this visualises for the example in code snippet 03:

First the Stateless widget Center gets build and therefore mounted to the widget tree (Figure 02).

|![Stateless Widget example](https://i.imgur.com/TtDS96i.jpg)|
|:--:| 
|_Figure 02: Stateless widget Center gets mounted_|

Then the createElement method of Center is called and a StatelessElement is created and mounted to the Element tree (Figure 03).

|![Stateless Widget example](https://i.imgur.com/PjUWwuq.jpg)|
|:--:| 
|_Figure 03: StatelessElement gets mounted_|

Then StatelessElement tells Center to build its children. In this case MyStatelessWidget which then gets created and mounted to the widget tree and every step gets repeated.

|![Stateless Widget example](https://i.imgur.com/H1zNKQ2.jpg)|
|:--:| 
|_Figure 04: Stateless widget MyStatelessWidget gets mounted_|

Figure 05 shows the final widget and element tree for the example.

|![Stateless Widget example](https://i.imgur.com/EkS1VuT.jpg)|
|:--:| 
|_Figure 05: Final widget & element tree_|

With Figure 05 this part about the widget type Stateless Widget is finished. But what if we want to tell Flutter to display a different text than "Hello World"? This question will be answered in the next part which introduces the next widget type - Stateful Widget.

##### Stateful Widget

To explain what a Statelful Widget is and how it works I will summarise the youtube video "How Stateful Widgets Are Used Best - Flutter Widgets 101 Ep. 2". [@HowStatefulWidgets] It is the second video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

A Stateful Widget by itself is, as all widgets are, immutable. It holds immutable configurations and a createState() method.
The createState method creates a state object which contains mutable configurations and a `build()` method to build the children of the Stateful Widget. The State object is hold by the StatefulElement. It is responsible to to mutate its state and notify the UI to update to reflect changes. Whenever the state of the state object changes, the element holding the state object marks itself as dirty which triggers Flutter to update the UI by rebuilding its children. 

The StatefulElement marks itself as dirty in two cases: (1) its method `setState()` has been called, or (2) the widget is has been referencing has been removed.

Let's take a look at the following used to explain Stateful Widgets in the video:

```dart
class ItemCounter extends StatefulWidget {
	final String name;
	
	ItemCounter({this.name});

	@override
	_ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
	int count = 0;

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				setState(() {
					count++;
				});
			},
			child: Text('${widget.name}: $count'),
		);
	}
}
```
_Code snippet 05: Stateful Widget ItemCounter_

The ItemCounter is a Stateful Widget which contains the immutable state `name` and a `createState()` method. `_ItemCounterState` is the State Object created by ItemCounter which contains the mutable state `count` and a `build()` method.

Now let's walk through what happens, when ItemCounter gets created:

```dart
	return ItemCounter(name: 'Tom');
```
_Code snippet 06: ItemCounter with String "Tom" is set as parameter name gets build_

The first thing Flutter does when it is told to build the widget ItemCounter is to mount it to the widget tree.

|![Statelful Widget example](https://i.imgur.com/eqGJ23O.png)|
|:--:| 
|_Figure 06: ItemCounter gets mounted to the widget tree_|

Then the widgets createElement() method is being called which creates an StatefulElement that gets mounted to the element tree.

|![Statelful Widget example](https://i.imgur.com/sohHp40.png)|
|:--:| 
|_Figure 07: StatefulElement gets mounted to element tree_|

Then the created Element tells the Stateful Widget to create a State Object for the element.

|![Statelful Widget example](https://i.imgur.com/VGSe2EJ.png)|
|:--:| 
|_Figure 08: State Object created for Stateful Element_|

Finally, the element uses the state object to build the children of the widget.

|![Statelful Widget example](https://i.imgur.com/Rs3S2lw.png)|
|:--:| 
|_Figure 08: Finished widget and element tree_|

As you have noticed the steps to add a widget to the widget & element tree are the same as for a Stateless Widget. Only the state object is an additional step.

Now let's take a look at how the widget and element tree react to the screen being tapped which calls the `setState()` method as seen in code snippet 05.

When the `setState()` method is called the callback inside the method increases the value of `count` from 0 to 1. 

|![Statelful Widget example](https://i.imgur.com/2QpvHsW.png)|
|:--:| 
|_Figure 09: Count value increased_|

The call of the `setState()` method triggers the Stateful Widget to mark itself as dirty. When an element is marked as dirty it signals Flutter to rebuild the widget it is referencing. Since the widget itself (ItemCounter) is still the same Flutter can reuse this widget to increase performance. Then Flutter continues the rebuild with the widgets children. A new text widget is being created with the count value of 1.

|![Statelful Widget example](https://i.imgur.com/1ge3XR2.png)|
|:--:| 
|_Figure 10: New child widget gets build_|

Now since the newly created text widget and the old widget are not the same, Flutter removes the old text widget and mounts the new text widget in its place.

|![Statelful Widget example](https://i.imgur.com/v1NV0V1.png)|
|:--:| 
|_Figure 11: Child widget gets exchanged_|

Since the new child widget is of the same widget type as the old child widget (widget type Text) the Stateless Element of the old widget can be reused.

|![Statelful Widget example](https://i.imgur.com/LkfidRC.png)|
|:--:| 
|_Figure 12: Widget & element tree have been rebuild_|

This sums up what happens with the widget and element tree when the element is marked as dirty via the state objects `setState()` method. Now let us take a look at what happens with the trees when the `ItemCounter` widget gets exchanged.

In this example the old ItemCounter widget gets removed and a new ItemCounter widget with the name attribute "Dan" has been created to take its place.

|![Statelful Widget example](https://i.imgur.com/RvZ5BMB.png)|
|:--:| 
|_Figure 13: Old ItemCounter Widget gets removed_|

After the new ItemCounter has been mounted to the widget tree Flutter walks through the same steps as before. First it checks the widget type to decide if it can reuse parts of its elememt tree. Since it is also of type ItemCounter the Stateful Element can be reused.

|![Statelful Widget example](https://i.imgur.com/RvZ5BMB.png)|
|:--:| 
|_Figure 14: New ItemCounter Widget has been mounted and Stateful Element gets reused._|

(Note that the state object is also being reused!)

Then the children are being rebuild.

|![Statelful Widget example](https://i.imgur.com/LV0Kul8.png)|
|:--:| 
|_Figure 15: New ItemCounter Widget children gets build._|

The newly build child takes the place of the old child in the widget tree and since they are of the same widget type the Stateless Element can be reused.

|![Statelful Widget example](https://i.imgur.com/y15vpxH.png)|
|:--:| 
|_Figure 16: Widget & element tree has been updated with new ItemCounter Widget._|

This sums up how the widget and element tree react to the ItemCounter Widget getting exchanged.

In this part I have explained what a Stateful Widget is and how it is used to update the UI. The next part is about Inherited Widgets the last type of widgets used in Flutter and the last part of this section.

##### Inherited Widget

### 1.2 What is state?

#### 1.2.1 Definition of state in flutter

#### 1.2.2 ephemeral state & app state

### 1.3 How does flutter react to state changes?

#### 1.3.1 widget tree & element tree & renderObject tree

### 1.4 state management

#### 1.4.1 principle of lifting state up


## 2. Methodology (sets boundaries for part 3: Results)

### 2.1 Architecture (DDD principles)

### 2.2 State Management Solution in Application Layer

### 2.3 Weather App Example

### 2.4 Weather App Widget Tree

## 3. Results

### 3.1 Patterns in state management solutions (mutable/immutable)

Each example consist of 5 paragraphs: 

* (1) Introduction, 

* (2) mutable/immutable,

* (3) pattern/concept, 

* (4) code implementation in app, 

* (5) benefits/challenges/outcomes


### 3.2 Examples

#### 3.2.1 Stateful Widget

#### 3.2.2 Inherited Widget

#### 3.2.3 ChangenotifierProvider

#### 3.2.4 BLoC (Vanilla) Rxdart

#### 3.2.5 Flutter_bloc

#### 3.2.6 Redux

#### 3.2.7 MobX

#### 3.2.8 States_rebuilder


## 4. Discussion (depends on part 3: Results)

* how well did it work out to implement the solution into the architecture?

* how many guides and/or tutorials for the solution can be found?

* how easy is it to learn?

* how much boilerplate needs to be implemented?

* how many lines of code in application and presentation layer


## 5. Conclusion (summary of part 4: Discussion)

* use the right tool for the job

* which solution is suited to help with state management in example, small-scale, middle-scale, large-scale applications


## 6. References


## 7. Bibliography
