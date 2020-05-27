# Introduction

Contents of the Chapter

- [Foreword](#foreword)
- [What is the Purpose of this Guide?](#what-is-the-purpose-of-this-guide)
- [Who is this Guide For?](#who-is-this-guide-for)
- [Topics that will be Covered](#topics-that-will-be-covered)
- [Creation Context](#creation-context)
- [How was this Guide Written?](#how-was-this-guide-written)
- [What Sources were used to create this Guide?](#what-sources-were-used-to-create-this-guide)

## Foreword

I want to use this foreword to give credits to Sebastian Faust [[@FasustOverview]](https://github.com/Fasust) and DevonFw [[@Devonfw]](https://devonfw.com/index.html) for their excellent Flutter guide [[@DevonfwforgeDevonfw4flutter]](https://github.com/devonfw-forge/devonfw4flutter). The guide is well written, and its structure has been a massive inspiration for my guide.

## What Is the Purpose of this Guide?

The goal of this guide is to set an entry point for state management in Flutter.

The goal is to help Flutter developers and Flutter development teams that have to decide which state management solution (SMS) to choose for their app to determine which SMS is most likely _the right tool for the job_.

It should provide a reference about which state management solution is likely the right one to choose to build an example, small-scale, middle-scale, or large-scale application.
Or at least show the advantages and disadvantages of each solution so that you can make an educated decision yourself.

## Who Is this Guide For?

This guide is for Flutter developers and Flutter development teams that are planning their next Flutter project.

It is for people who are overwhelmed by the amount of state management solutions provided by the community. For people who are searching for information about which SMS is in line with their requirements and why they should think about choosing it.

## Topics that Will Be Covered

The topics that will be covered are:

- some [prerequisites](#prerequisites) that you will need to understand how Flutter works under the hood to realize state changes in the UI.
- the [methodology](#methodology) behind the guide
- the [results](#results) of the methodology, represented by the implementation of each SMS
- an [evaluation](#evaluation) of the implemented SMS based on specified criteria
- a [recommendation](#recommendations) on which SMS is suited for example, small-scale, middle-scale, and large-scale applications
- a [conclusion](#conclusion) of my personal retrospective view on the guide and its future as well as my future work

## Creation Context

For the Bachelor's degree in the Bachelor of Science Program, "Business Informatics" at Technical University Cologne [[@HomeTHKoln]](https://www.th-koeln.de/en/homepage_26.php) the students have to deliver a project which includes some of the practices taught in the study program. Furthermore, they have to write documentation along with the project. This guide is my version of the documentation.

## How Was this Guide Written?

This guide is written for developers. Therefore, I want to keep it informal - _from developer to developers_. Throughout the guide, I will use the pronoun "you" to keep it that way.

To get a full understanding of the guide, I advise to read it from chapter 1 to chapter 5. If you are only interested in the recommendations, jump straight to chapter 4, section 3 - [Recommendations](#recommendations).

Most of the code examples, explicitly the code snippets in chapter 3 - [Results](#results), are taken from _SME-APP_, which is the example application that has been build for this guide. The full source code for the app is found [here](https://github.com/eddiesTime/sme_app).

To highlight definitions, you will find the following approach throughout the guide:

| :closed_book: | Term | Definition |
| :-----------: | :-----: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |

## What Sources Were Used to Create this Guide?

For the creation of this guide, a collection of books, blog posts, journal articles, official documentation, and YouTube videos has been used. In chapter 6 - [References](#references), a list of all sources used in this guide can be found.

# Prerequisites

## Contents of the Chapter

- [Introduction](#introduction-1)
- [Flutter under the Hood](#flutter-under-the-hood)
- [What is State?](#what-is-state)
- [How does Flutter React to State Changes?](#flutter-does-flutter-react-to-state-changes)
- [State Management](#state-management)

## Introduction

This chapter will cover the fundamental knowledge you will need as prerequisites to follow the guide and fully understand how Flutter works internally. The first section of this chapter will cover the concepts of Flutter and show how it works _under the hood_. The second section will cover what state in Flutter is. The third section will include how state changes in Flutter are handled internally. The fourth and last section will cover state management in Flutter.

## Flutter under the Hood

Contents of the Section

- [Introduction](#introduction-2)
- [Definitions](#definitions)
- [It's all Widgets](#its-all-widgets)
- [Types of Widgets](#types-of-widgets)
  - [Stateless Widget](#stateless-widget)
  - [Stateful Widget](#stateful-widget)
  - [Inherited Widget](#inherited-widget)

### Introduction

This section covers what Flutter is, what widgets are, and how they work together.

So, _what is Flutter?_

### Definitions

| :closed_book: | Flutter | Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase [[@FlutterBeautifulNative]](https://flutter.dev/) |
| :-----------: | :-----: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |


The official Flutter documentation states that Flutter is declarative.

> Flutter builds its user interface to reflect the current state of your app [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative)

Therefore I assume that Flutter follows the declarative programming paradigm. Declarative programming focuses on specifying the result of an operation rather than the computational processes it has to do to achieve the desired outcome [@10.5555/895948].

Let's take a look at the theory of declarative programming in practice.

```dart
void main() => Center(child: Text('Hello World'));
```
_Code snippet 01: Declarative programming example_

_Code snippet 01_ shows an example of Flutters declarative nature. As you can see, a `main()` method is declared, which returns a `Center` widget, which holds a `Text` widget. These declarations are all you need to tell Flutter to build a text in the center of the screen. No specification of what it needs to do to get the text to the screen had to be written.

I have mentioned Widgets a couple of times in the previous paragraph. So let's take a look at what widgets are in the next part.

### It's All Widgets

To explain what widgets are and their role in Flutter, I will reference the official Flutter documentation [[@TechnicalOverview]](https://flutter.dev/docs/resources/technical-overview).

In Flutter, _everything's a widget_.

Widgets are the basic building blocks of an application's _user interface_ (UI). Custom widgets can be composed of smaller widgets, and the overall _composition_ of all widgets represents the UI. Flutter uses a so-called _widget tree_ to handle the relationship of widgets. The concept of the widget tree helps Flutter to layout the UI. _Figure 01_ is a visualization of how Flutter builds the user interface:

|                                                     ![equation](https://i.imgur.com/DoY8u5y.png)                                                     |
| :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| _Figure 01: How Flutter builds its UI_ [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative) |

Since widgets are the building blocks of the UI, I assume that they equal the right side of the equation.

They are blueprints for parts of the UI that hold a configuration for a specific state [[@HowCreateStateless]](https://www.youtube.com/watch?v=wE7khGHVkYY).

Let's take a look at how Flutter defines widgets:

| :closed_book: | Widget | A widget is an immutable description of part of a user interface [[@WidgetClassWidgets]](https://api.flutter.dev/flutter/widgets/Widget-class.html) |
| :-----------: | :----: | :-------------------------------------------------------------------------------------------------------------------------------------------------- |


Typically an UI is mutable to reflect changes via, for example, user interaction. _But how can Flutter reflect changes in the user interface, when a widget is by definition immutable?_ The answer is simple: Flutter uses different types of widgets with different behavior.

Let's take a look at the different types of widgets.

### Types of Widgets

Internally, Flutter uses three different types of widgets: _(1) Stateless Widgets, (2) Stateful Widgets, and (3) Inherited Widgets._

#### Stateless Widget

To explain what a Stateless Widget is and how it works, I will summarise the YouTube video "_How to Create Stateless Widgets - Flutter Widgets 101 Ep. 1_" [[@HowCreateStateless]](https://www.youtube.com/watch?v=wE7khGHVkYY). It is the first video of a great series by the Flutter team explaining the different types of widgets used by Flutter.

A Stateless Widget is specified by two concepts: _(1) it has no mutable state it needs to keep track of and (2) it is composed of children_.

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
_Code snippet 02: MyStatelessWidget Example_

The data `_title` that is held by the widget reflects the first concept. It is declared as `final` which means that the attribute can not be changed after it has been initialized.

The `build()` method reflects the second concept. This method has to return at least one widget, which in this example is a Text Widget.

If you want Flutter to use this widget, you have to either declare it as the root of the widget tree or as part of a composition. The following code snippet shows the latter:

```dart
...
	return Center(child: MyStatelessWidget('Hello World'));
...
```
_Code snippet 03: MyStatelessWidget as Part of a Composition_

When Flutter executes _code snippet 03_, it mounts the `Center` widget to the Widget Tree. Then it call its `createElement()` method [[@CreateElementMethodStatelessWidget]](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html).

```dart
...
  @override
  StatelessElement createElement() => StatelessElement(this);
...
```
_Code snippet 04: CreateElement Method [[@CreateElementMethodStatelessWidget]](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)_

In reaction to the `createElement()` method Flutter mounts the `StatelessElement` onto the _Element Tree_. I will explain what the Element Tree is later in the section: [_How does Flutter react to state changes?_](#flutter-does-flutter-react-to-state-changes). For now, please bear with me.

After the `StatelessElement` has been mounted, it asks its referenced `Stateless Widget`, in this case, the `Center` widget, to execute its `build()` method to build its children. The children, in this case, are only one child - `MyStatelessWidget`.

So to summarise these steps:

1. Flutter creates the `Stateless Widget` and mounts it to the Widget Tree.
2. The widget calls its `createElement()` method.
3. Flutter mounts the created element onto the Element Tree.
4. The created element asks its referenced widget to build its children via its `build()` method.

Let's take a look at how this visualizes for the example in _code snippet 03_:

First, the Stateless widget `Center` gets build and therefore mounted to the Widget Tree (_Figure 02_).

| ![Stateless Widget Example](https://i.imgur.com/TtDS96i.jpg) |
| :----------------------------------------------------------: |
|      _Figure 02: Stateless Widget Center gets Mounted_       |

Then the `createElement()` method of `Center` is called and a `StatelessElement` is created, and mounted to the Element Tree (_Figure 03_).

| ![Stateless Widget Example](https://i.imgur.com/PjUWwuq.jpg) |
| :----------------------------------------------------------: |
|          _Figure 03: StatelessElement gets Mounted_          |

Then `StatelessElement` asks `Center` to build its children. In this case, `MyStatelessWidget`, which then gets created and mounted to the Widget Tree, and every step gets repeated.

| ![Stateless Widget Example](https://i.imgur.com/H1zNKQ2.jpg) |
| :----------------------------------------------------------: |
| _Figure 04: Stateless Widget MyStatelessWidget gets Mounted_ |

_Figure 05_ shows the final Widget and Element Tree for the example.

| ![Stateless Widget Example](https://i.imgur.com/EkS1VuT.jpg) |
| :----------------------------------------------------------: |
|           _Figure 05: Final Widget & Element Tree_           |

_With Figure 05_ this part about the widget type `Stateless Widget` is finished. _But what if we want to tell Flutter to display a different text than "*Hello World*"?_ This question will be answered in the next part which introduces the next widget type - `Stateful Widget`.

#### Stateful Widget

To explain what a `Stateful Widget` is and how it works, I will summarise the YouTube video _How Stateful Widgets Are Used Best - Flutter Widgets 101 Ep. 2_ [[@HowStatefulWidgets]](https://www.youtube.com/watch?v=AqCMFXEmf3w&t=0s). It is the second video of a great series by the Flutter team explaining the different types of widgets used by Flutter.

A `Stateful Widget` by itself is, as all widgets are, _immutable_. It holds `immutable configurations` and a `createState()` method.
The `createState()` method creates a `State Object`, which contains mutable configurations and a `build()` method to build the children of the `Stateful Widget`. The state object is held by the `StatefulElement`. It is responsible for mutating its state and notifying Flutter to update the UI to reflect changes whenever the state of the state object changes. The element holding the state object marks itself as `dirty` which triggers Flutter to update the UI rebuilding its children.

The `StatefulElement` marks itself as dirty in two cases: _(1) its method `setState()` has been called, or (2) the widget, it has been referencing, has been removed_.

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

The `ItemCounter` is a Stateful Widget which contains the immutable state `name` and a `createState()` method. `_ItemCounterState` is the state object created by `ItemCounter` which contains the mutable state `count` and a `build()` method.

Now let's walk through what happens when Flutter creates `ItemCounter`:

```dart
	return ItemCounter(name: 'Tom');
```
_Code snippet 06: ItemCounter with String "Tom" is set as Parameter Name gets Build_

The first thing Flutter does after it builds the widget `ItemCounter` is to mount it onto the Widget Tree.

| ![Statelful Widget Example](https://i.imgur.com/eqGJ23O.png) |
| :----------------------------------------------------------: |
|   _Figure 06: ItemCounter gets mounted to the Widget Tree_   |

Then the widgets `createElement()` method is being called, which creates a `StatefulElement` that Flutter mounts onto the Element Tree.

| ![Statelful Widget Example](https://i.imgur.com/sohHp40.png) |
| :----------------------------------------------------------: |
|  _Figure 07: StatefulElement gets mounted to Element Tree_   |

Then the created element asks the `Stateful Widget` to create a `State Object` it.

| ![Statelful Widget Example](https://i.imgur.com/VGSe2EJ.png) |
| :----------------------------------------------------------: |
|    _Figure 08: State Object created for Stateful Element_    |

Finally, the element uses the state object to build the children of the widget.

| ![Statelful Widget Example](https://i.imgur.com/Rs3S2lw.png) |
| :----------------------------------------------------------: |
|        _Figure 08: Finished Widget and Element Tree_         |

As you have noticed, the steps to add a widget to the Widget & Element tree are the same as for a `Stateless Widget`. Only the state object is an additional step.

Now let's take a look at how the Widget and Element tree reacts to the screen being tapped, which calls the `setState()` method as seen in _code snippet 05_.

When the `setState()` method is called, the callback inside the method increases the value of `count` from 0 to 1.

| ![Statelful Widget Example](https://i.imgur.com/2QpvHsW.png) |
| :----------------------------------------------------------: |
|              _Figure 09: Count Value Increased_              |

The call of the `setState()` method triggers the `Stateful Widget` to mark itself as dirty. When an element is marked as dirty, it signals Flutter to rebuild the widget it is referencing. Since the widget itself (`ItemCounter`) has not changed, Flutter can reuse this widget to increase performance. Then Flutter continues the rebuild with the widget's children. A new text widget is being created with a count value of 1.

| ![Statelful Widget Example](https://i.imgur.com/1ge3XR2.png) |
| :----------------------------------------------------------: |
|           _Figure 10: New Child Widget gets Build_           |

Now since the newly created text widget and the old widget are not the same, Flutter removes the old text widget and mounts the new text widget in its place.

| ![Statelful Widget Example](https://i.imgur.com/v1NV0V1.png) |
| :----------------------------------------------------------: |
|           _Figure 11: Child Widget gets Exchanged_           |

Since the new child widget is of the same `runtimeType` as the old child widget (widget type Text), the `Stateless Element` of the old widget can be reused.

| ![Statelful Widget Example](https://i.imgur.com/LkfidRC.png) |
| :----------------------------------------------------------: |
|     _Figure 12: Widget & Element Tree have been Rebuild_     |

That sums up what happens with the Widget and Element Tree when the element is marked as dirty via the state object's `setState()` method. Now let us take a look at what happens with the trees when the `ItemCounter` widget gets exchanged.

In this example, the old `ItemCounter` widget gets removed, and a new `ItemCounter` widget with the `name` attribute _Dan_ has been created to take its place.

| ![Statelful Widget Example](https://i.imgur.com/RvZ5BMB.png) |
| :----------------------------------------------------------: |
|       _Figure 13: Old ItemCounter Widget gets Removed_       |

After the new `ItemCounter` has been mounted to the widget tree, Flutter walks through the same steps as before. First, it checks the widget type to decide if it can reuse parts of its element tree. Since it is also of `runtimeType` `ItemCounter`, the `Stateful Element` can be reused.

|             ![Statelful Widget Example](https://i.imgur.com/RvZ5BMB.png)              |
| :-----------------------------------------------------------------------------------: |
| _Figure 14: New ItemCounter Widget has been mounted and Stateful Element gets Reused_ |

_**Note that the state object is also being reused!**_

Then the children are being rebuilt.

| ![Statelful Widget Example](https://i.imgur.com/LV0Kul8.png) |
| :----------------------------------------------------------: |
|   _Figure 15: New ItemCounter Widget's Children gets Build_    |

The newly built child takes the old child's place in the Widget Tree, and since they are of the same widget type, the `Stateless Element` can be reused.

|          ![Statelful Widget Example](https://i.imgur.com/y15vpxH.png)           |
| :-----------------------------------------------------------------------------: |
| _Figure 16: Widget & element tree has been updated with new ItemCounter Widget_ |

This sums up how the Widget and Element Tree reacts to the `ItemCounter` widget getting exchanged.

In this part, I have covered what a `Stateful Widget` is and how it is used to update the UI. The next part is about `Inherited Widgets`.

#### Inherited Widget

The `Inherited Widget` is the third and last type of widgets I will cover in this section.

To explain what an Inherited Widget is and how it works, I will summarise the YouTube video _Inherited Widgets Explained - Flutter Widgets 101 Ep. 3_ [[@InheritedWidgetsExplained]](https://www.youtube.com/watch?v=Zbm3hjPjQMk&list=PLOU2XLYxmsIJyiwUPCou_OVTpRIn_8UMd&index=4). It is the third video of a great series by the Flutter team explaining the different types of widgets used by Flutter.

When working with widgets in Flutter, it can get cumbersome pretty quickly when a deeply nested child widget needs to access data from an ancestor. The more widgets are in between the ancestor with the data and the child that needs to access the data, the more cumbersome it gets as seen in _Figure 17_.

|                ![Inherited Widget Example](https://i.imgur.com/wFAt9A7.png)                 |
| :-----------------------------------------------------------------------------------------: |
| _Figure 17: Widget Tree where Child that needs Data from Ancestor and Data are Highlighted_ |

To provide the highlighted child widget with the data of an ancestor, the data must be passed down through the widgets in between, even though they may not need access to the data.

That is where `Inherited Widgets` can help. They are widgets that can be accessed from any descendant in the Widget Tree, as highlighted in _Figure 18_.

| ![Inherited Widget Example](https://i.imgur.com/GaoNGIW.png) |
| :----------------------------------------------------------: |
|        _Figure 18: Widget Tree with Inherited Widget_        |

To access the `Inherited Widget`, the `BuildContext` is used.

| :closed_book: | BuildContext | The build context handles the location of the widget in the tree [@BuildContextClassWidgets] |
| :-----------: | :----------: | :------------------------------------------------------------------------------------------- |


An example of an `Inherited Widget` you should be familiar with is `Theme`. Theme as all `Inherited Widgets` can be accessed with its static method `of(context)` as seen in _code snippet 07_:

```dart
...
	@override
	Widget build(BuildContext context){
	...
		final ThemeData _theme = Theme.of(context);
	...
}
```
_Code snippet 07: Example how Theme can be Accessed_

## What Is State?

Contents of the Section

- [Introduction](#introduction-3)
- [Definition](#definition)
- [Ephemeral State](#ephemeral-state)
- [Application State](#application-state)
- [Decision Help](#decision-help)

### Introduction

This section will cover what state in Flutter is. All the information in this section is taken from the official Flutter documentation.

To start this section, let's take a look at the official definition of state in Flutter.

### Definition

| :closed_book: | State | Whatever data you need in order to rebuild your UI at any moment in time [@DifferentiateEphemeralState] |
| :-----------: | :---: | :------------------------------------------------------------------------------------------------------ |


To emphasize its relevance in Flutter, I want to remind you about how Flutter builds its UI with _Figure 01_:

|                                                     ![Equation](https://i.imgur.com/DoY8u5y.png)                                                     |
| :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| _Figure 01: How Flutter builds its UI_ [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative) |

Now let's dive deeper into state in Flutter. State in Flutter is divided into ephemeral state and application state.

### Ephemeral State

Ephemeral state is specified as mutable data which is only relevant to the widget holding this configuration. It is also called local state and can be implemented using a state object of a Stateful Widget as seen in [_It's all widgets_](#its-all-widgets).

### Application State

Application state, in contrast to ephemeral state, is data that is shared by multiple widgets, e.g., user data.

### Decision Help

When working with state in Flutter, there is no clear-cut rule about which type of state you should use. The documentation contains a decision help when it comes to deciding which type of state you should use, as shown in _Figure 19_:

| ![Decision Help](https://i.imgur.com/5ifKgCM.png) |
| :-----------------------------------------------: |
|            _Figure 19: Decision Help_             |

Don't worry too much about what kind of state to use, since it most definitely will change over time and you can change it afterward.

That part covers the part about state in Flutter. The next part will include how Flutter reacts to state changes internally.

## How Does Flutter React to State Changes?

Contents of the Section

- [Introduction](#introduction-4)
- [The Three Core Concepts of Flutter](#the-three-core-concepts-of-flutter)
- [The Three Core Concepts in Action](#the-three-core-concepts-in-action)

### Introduction

In the previous part about widgets, I have covered the widget types `Stateless Widgets` and `Stateful Widgets`, and how Flutter handles them with the use of the Widget Tree and the Element Tree. That has been the way Flutter has been working internally in 2018, when the Flutter team has uploaded the YouTube video series _Widget 101_. Since then, Flutter has evolved, and so has the way Flutter handles widgets internally. In 2019 during the Google Developer Days China, the Flutter team gave a talk about how Flutter renders widgets and uploaded it to YouTube.

So to answer the question, "_How does Flutter react to state changes?_", I will use the content provided by the video _How Flutter renders Widgets_ from the talk by the Flutter team [[@HowFlutterRenders]](https://www.youtube.com/watch?v=996ZgFRENMs).

### The Three Core Concepts of Flutter

Since 2018 the way Flutter works internally has evolved. Additionally, to the Widget and Element tree, Flutter now uses a tree of **RenderObjects**. These trees are the three core concepts of Flutter.

They are deeply connected, and all have different responsibilities as seen in _Figure 20_:

| ![The Three Trees](https://i.imgur.com/gzZ6cVw.png) |
| :-------------------------------------------------: |
| _Figure 20: The Three Concept of Trees in Flutter_  |

You will notice a clear separation of concerns [[@SeparationConcernsSoftware2020]](http://nalexn.github.io/separation-of-concerns/), where each tree has its job in Flutter.

The `Widget tree` contains widgets that, as mentioned earlier, hold the configuration for a piece of the UI. Furthermore, a widget "describes the configuration for an Element" [[@WidgetClassWidgets]](https://api.flutter.dev/flutter/widgets/Widget-class.html).

The `Element tree` contains elements that represent an actual piece of the UI. In Flutter, widgets are the blueprint for an element. Elements are “an instantiation of a Widget at a particular location in the tree” [[@ElementClassWidgets]](https://api.flutter.dev/flutter/widgets/Element-class.html). They are what the user can see on the UI. Furthermore, the element is the manager of the UI. It manages the UI by holding a reference to its widget in the Widget Tree and render-object in the RenderObject Tree. Whenever the UI has to be rebuilt, the element handles the communication with Flutter.

The `RenderObject tree` contains render-objects that handle sizes, layout, and painting [[@RenderObjectElementClassWidgets]](https://api.flutter.dev/flutter/widgets/RenderObjectElement-class.html) of the element on the UI.

I have covered how the Widget and Element tree react to changes in the part about [`Stateful Widgets`](#stateful-widget). Now, let's take the example widget `Foo` from _Figure 21_ and extend our knowledge to include the RenderObject Tree.

### The Three Core Concepts in Action

|   ![Foo Example](https://i.imgur.com/LfP2EBW.png)    |
| :--------------------------------------------------: |
| _Figure 21: The Three Trees with Example Widget Foo_ |

The first action Flutter takes when the `Foo` widget gets called stays the same. It creates an element, to be more precise a `RenderObjectElement` [[@RenderObjectElementClassWidgets]](https://api.flutter.dev/flutter/widgets/RenderObjectElement-class.html), in this case, the `FooElement` which the framework mounts to the Element Tree. When an element is mounted to the Element Tree, it asks the widget to create a render-object, in this case, `RenderFoo`. After `RenderFoo` has been created, the render-object gets mounted by the framework onto the RenderObject Tree.

I have covered how Flutter reacts when it builds a part of the UI. Let's take a look at how the three trees respond to changes with the next example:

In this example, I have a `RichText` widget that has been mounted to the widget tree by the Flutter, and the corresponding element and render-object as, seen in _Figure 22_.

| ![RichText Example](https://i.imgur.com/iG7r4El.png) |
| :--------------------------------------------------: |
|   _Figure 22: The Three Trees when State Changes_    |

The first action that takes place is that a new RichText widget gets created, which is supposed to replace the old RichText widget.

| ![RichText Example](https://i.imgur.com/JaVvq9w.png) |
| :--------------------------------------------------: |
|    _Figure 23: New RichText Widget gets Created_     |

At this point, Flutter asks itself if it can reuse parts of the Element and RenderObject Tree. Therefore it uses the widgets `canUpdate()` method to check if it can reuse these parts.

```dart
static bool canUpdate(Widget oldWidget, Widget newWidget) {
  return oldWidget.runtimeType == newWidget.runtimeType
      && oldWidget.key == newWidget.key;
}
```

_Code snippet 08: canUpdate() method [[@CanUpdateMethodWidget]](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html)_

Since the old widgets and new widgets `runtimeType` are the same, the framework can reuse the element and render-object and replaces the old widget with the new one.

|   ![RichText Example](https://i.imgur.com/HyvRcIJ.png)    |
| :-------------------------------------------------------: |
| _Figure 24: New RichText Widget replaces the old Widget._ |

As you've learned in [Stateful Widget](#stateful-widget), the element now marks itself as dirty because the widget it references has been exchanged.

In response to the change the element calls the widgets `updateRenderObject()` method.

```dart
@protected
void updateRenderObject(BuildContext context, covariant RenderObject renderObject) { }
```

_Code snippet 09: updateRenderObject method [[@UpdateRenderObjectMethodRenderObjectWidget]](https://api.flutter.dev/flutter/widgets/RenderObjectWidget/updateRenderObject.html)_

The render-object gets updated, and the result can be seen in _Figure 25_:

| ![RichText Example](https://i.imgur.com/VmTyHT6.png) |
| :--------------------------------------------------: |
|       _Figure 25: RenderObject gets Updated._        |

This example covered the process of a single widget handled by Flutter with the Widget, Element, and RenderObject Tree. But don't worry, it is the same principle for child widgets.

That covers the part about "_How Flutter renders Widgets_", and you should hopefully understand how Flutter works _under the hood_. To finish up the next and last part of this section will cover what _state management_ is and talk about the basic principle that is used in Flutter to manage state.

## State Management

Contents of the Section

- [Introduction](#introduction-5)
- [Definition](#definition-2)
- [Principle of Lifting State Up](#principle-of-lifting-state-up)

### Introduction

This part will cover state management and introduce the fundamental principle that is used to manage state in Flutter.

### Definition

State management in Flutter is the management of application state changes and making it accessible. This state is used by multiple widgets and has to be consistent throughout the application so that no error as a result of deferred state can occur. Furthermore, since Flutter has a unidirectional data flow from the root of the Widget Tree down to its children, how does the ancestor widget holding the application state can be notified about state changes inside a child widget?

_So how do you access application state from inside our widgets?_

The application state can be accessed by handing it down the Widget Tree. But the problem is, _how do you pass data the other way around to an ancestor?_ Furthermore, _how do different widgets from different subtrees get access to the same data?_ That is where the principle of `Lifting-State-Up` comes into play.

### Principle of Lifting State Up

The principle of lifting-state-up describes that we have to find the lowest common ancestor of two widgets that need access to the state and pass the state down from this ancestor.

Furthermore, this principle is being used in any state management solution you will find.

That finishes [Chapter 1 - Prerequisites](#prerequisites). The next chapter will cover my [methodology](#methodology)

# Methodology

## Introduction

In this chapter, I will walk you through the steps I made to be able to make an educated evaluation of state management solutions in Flutter. The first section of this chapter will cover how different SMS can be compared. The second section will cover the architectural decision process I undertook that led me to my architecture. The third section will include Domain-Driven-Design. The fourth section consists of the architecture I have decided on. The fifth and last section of the chapter will show the application that has been build for this guide.

Contents of the Chapter

- [How can you Compare State Management Solutions to Evaluate Them?](#how-can-you-compare-state-management-solutions-to-evaluate-them)
- [Architectural Decision Process](#architectural-decision-process)
- [Domain-Driven-Design](#domain-driven-design-2)
- [Architecture](#architecture)
- [The State Management Evaluation App](#the-state-management-evaluation-app)

## How Can you Compare State Management Solutions to Evaluate Them?

Contents of the Section

- [Introduction](#introduction-6)
- [Principle of Orthogonality](#principle-of-orthogonality)

### Introduction

To compare different state management solutions, I had to find a scenario in which they can be compared. For this purpose, I have decided to implement each pattern in the same example application.

But this led to another problem: You don’t want to write the application every time from scratch, or to be more precise, rewrite big chunks of the app only to fit in a different SMS.

That is where the _principle of orthogonality_ [@hunt2000pragmatic] is useful.

### Principle of Orthogonality

This principle emphasizes the benefits of _independence or decoupling_ of components. One of the advantages is that changes in one component do not affect any of the other. So, in this case, if you change the state management solution, it does not affect the other parts of our application.

I have shown how the amount of refactoring can be reduced with the principle of orthogonality.

The next challenge is to find an architecture that follows this principle.

## Architectural Decision Process

Contents of the Section

- [Introduction](#introduction-7)
- [Clean Architecture](#clean-architecture)
- [Domain-Driven-Design](#domain-driven-design)

### Introduction

### Clean Architecture

The first architecture I looked at is _Clean Architecture_ by Uncle Bob. [@Martin17]

In Uncle Bob's clean architecture, he shows the benefits of a clean architecture where the focus is on use cases, the central business goals of the application.

He applied the principle of decoupling (orthogonality) with two concepts: _(1) the dependency rule, and (2) the principle of dependency inversion._

The first concept states that source code dependencies are only allowed from outer layers to inner layers. The concept of dependency inversion introduces the use of interfaces on each layer to enable cross-layer communication with the principle of contracts. [@hunt2000pragmatic]

Uncle Bob's clean architecture can be seen in _Figure 26_:

| :closed_book: | Contract | A contract in programming is a definition of methods and attributes that everyone who wants to use mentioned methods and attributes has to follow. A contract does not more or less than what is written in it. |
| :-----------: | :------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |


In software development, an example of a contract is an _interface_.

| ![Clean Architecture](https://i.imgur.com/moPHCbt.png) |
| :----------------------------------------------------: |
|      _Figure 26: Clean Architecture by Uncle Bob_      |

With this onion architecture, he highlights the importance of the _separation of concerns_ [[@SeparationConcernsSoftware2020]](http://nalexn.github.io/separation-of-concerns/).

The business logic represents the core of the onion, and the outer layer represents details. Following the separation of the business logic in your system allows you to be flexible when it comes to adding details. Uncle Bob describes IO-Devices, databases, etc. as details which are not relevant for the business rules. Furthermore, frameworks are tools that can help you with the development of your application and are, therefore, details.

Uncle Bob points out a problem in the creational context of a software application. The problem is that when it comes to developing an app, the tools we use, like Ruby, take away the focus of the most crucial thing in software development, the business rules. Furthermore, they take away how we architect our software.

If we take a look at state management in Flutter, we can assume that state management solutions, e.g., Redux, are only details added on top of the core business logic.

This problem is also addressed by _Domain-Driven-Design_ (DDD). "The developers are too wrapped up with technology and trying to solve problems using technology rather than careful thought and design. This leads developers to constantly chase after new 'shiny objects,' which are the latest fads in technology" [@10.5555/3055897].

I've decided to take a look into DDD when recognizing the same problem when it comes to state management in Flutter.

### Domain-Driven-Design

DDD is the second approach I took to plan my software example. It led me to the Flutter Europe 2020 conference talk about _Strategic Domain-Driven-Design_ by Majid Hajian[[@StrategicDomainDrivenDesign]](https://www.youtube.com/watch?v=lGv6KV5u75k&t=2260s). He proposes an architecture based on the principles of DDD. In his talk, he emphasizes the advantages of Domain-Driven-Design and how it can be used to build scalable and maintainable software. During his architecture presentation, he pointed out that at the layer where BLoC (Business Logic Component) was used as a state management solution, any other SMS can be used instead and how easily refactoring the aftermath will be.

This ease of changeability is what I was looking for.

## Domain-Driven-Design

Contents of the section

- [Introduction](#introduction-8)
- [Why DDD?](#why-ddd)
- [Domain-Driven-Design Principles](#domain-driven-design-principles)
  - [Domain](#domain)
  - [Layered Architecture](#layered-architecture)
  - [Ubiquitous Language](#ubiquitous-language)
  - [Entities](#entities)
  - [Factories](#factories)

### Introduction

Domain-Driven-Design (DDD) is a software development approach introduced by Eric Evans in his book "_Domain-Driven-Design: Tackling Complexity in the Heart of Software_" [@evans2004domaindriven]. DDD is based on the idea that to solve a problem defining the core domain is of utmost importance. The users of the software are the people who are familiar with the domain, and the software is developed to solve a problem they face.

### Why DDD?

Evans answers the question as follows:

> Every software program relates to some activity or interest of its user. The heart of software is its ability to solve domain-related problems for its user. All other features, vital though they may be, support this basic purpose. When the domain is complex, this is a difficult task, calling for the concentrated effort of talented and skilled people. Developers have to steep themselves in the domain to build up knowledge of the business.

He recommends that the best way to do this is to make the software a reflection of the domain, which creates a ubiquitous language that the domain experts and developers can use.

### Domain-Driven-Design Principles

In this part, I will reduce the DDD principles to the ones used in the app.

#### Domain

A `domain` is an abstract area that defines a problem that needs to be solved. It can be composed of smaller subdomains.

#### Layered Architecture

DDD recommends using a _four-layered architecture_ where the domain logic is focused on one layer, the domain layer, and not dependent on another. The other layers are the `infrastructure layer`, the `application layer`, and the `presentation layer`.

#### Ubiquitous Language

DDD refers to the `Ubiquitous language` as a must. The idea is that the developer and the user need to speak the same language, and the developers use it when coming up with class names, modules, variables, etc. This way, the code reads as if a user is speaking.

#### Entities

`Entities` are domain objects that are uniquely defined by a unique identifier, and not by their attributes. They are commonly described as identities and the building blocks of the domain modeling. To put it in simpler words: Entities emphasize who they are rather than what they are.

#### Factories

They are used to create complex objects and ensure that the client has no knowledge of the internal details and functionality of that object manipulation. As advised by Evans, factories provide encapsulation. They also ensure the standardization of object instantiation and ensure the objects do not care about the creation themselves. This helps at keeping the domain clean and ensures boundaries are kept.

## Architecture

Contents of the Section

- [Introduction](#introduction-9)
- [Architecture vs. State Management vs. Folder Structure](#architecture-vs-state-management-vs-folder-structure)
- [My Architecture](#my-architecture)

### Introduction

When looking into how to use the principles of DDD to plan my example application's architecture, I have found the DDD series by Matt Rešetár, a.k.a. Reso Coder [[@FlutterFirebaseDDD2020]](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/). His series has been a significant influence on me and how I've planned my architecture. In the next part, I will present my adaptation of his architecture proposal for my domain.

But before getting into more detail about my architecture, I want to emphasize on a common mistake made by the community when it comes to architecture.

### Architecture vs. State Management vs. Folder Structure

A common mistake made by the community is the use of `architecture`, `state management`, and `folder structure` interchangeably. Most Flutter developers should be familiar with the _Flutter Architecture Samples_ repository [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples) by Brian Egan and contributors. As the name suggests, this repository is supposed to contain different architecture samples of a _Todo App_. Unfortunately, this is not the case. It includes examples of how different patterns, e.g., Redux, can be implemented. The same misunderstanding comes with the folder structure of the project, where it is mistaken for architecture. Folder structure helps to separate your files but not automatically includes an architecture.

Architecture is the topic of a top-level decision when it comes to the planning of the system. It specifies how the system will be implemented, what type of modules it has, and how their relationship is [[@hgracaArchitecturalStylesVs2017]](https://herbertograca.com/2017/07/28/architectural-styles-vs-architectural-patterns-vs-design-patterns/).

Examples for architecture are:

- layered
- service-oriented
- client-server
- etc.

To summarise it, an architecture should _set the outer boundaries of your application_.

### My Architecture

As you can see in _Figure 27_, the architecture is closely related to Reso Coders architecture proposal.

| ![Application Architecture](https://i.imgur.com/JeebkGs.jpg) |
| :----------------------------------------------------------: |
|            _Figure 27: Application Architecture_             |

The main difference is my lack of a value object and the focus on the entities.

The `presentation layer` represents the dumb UI, which is used to interact with the user. Depending on the state management solution, some sort of `ViewModel` is used in the layer, e.g., events and states in flutter_bloc.

The `application layer` contains the state management solution. It is the only layer communicating with the presentation layer. It depends on entities to represent the domain's relevant data models and interfaces, which are a typical contract to communicate with the infrastructure layer.

The `domain layer` contains the core logic of the business. It is intended to be a standalone layer. Due to the simplicity of this example and the focus on the state management part in the application layer, I’ve decided to leave out `ValueObjects`.

The `infrastructure layer` contains repositories. It is the layer that communicates with APIs and other services, e.g., databases. The repositories implement the provided interface of the domain layer to specify how to manage API calls, and thereby fulfills its contract. The dependency on the models is used to define data transfer objects [[@BlikiLocalDTO]](https://martinfowler.com/bliki/LocalDTO.html) which are used to transfer the raw data from the API/database into objects.

## The State Management Evaluation App

Contents of the Section

- [Introduction](#introduction-10)
- [Weather App](#weather-app)

### Introduction

To evaluate multiple state management solutions, I had to find a way to compare them. For this purpose, I choose to build an app with _predefined functionalities_. That sets a goal to achieve and requirements that SMSs had to fulfill. By having an app with predefined functionalities/requirements, the state management solutions can be directly compared in a specified scenario.

### Weather App

Since I want to focus on the SMS part, I don’t want to spend a lot of time planning an app. So I have chosen to use the Weather App, build in the tutorial by Felix Angelov, as my foundation [[@WeatherBloc]](https://bloclibrary.dev/#/flutterweathertutorial).

The reason for this example app is that I have started the project with previous knowledge about the flutter_bloc [[@FlutterBlocFlutter]](https://pub.dev/packages/flutter_bloc) package, which was also created by Felix. And furthermore, because I like the app’s UI.

Take a look at the .gif of the weather app at bloclibrary [[@Bloc]](https://bloclibrary.dev/#/) to get a first glimpse at what will be built:

| ![Weather App](https://i.imgur.com/cgB1wse.gif) |
| :---------------------------------------------: |
|          _Figure 28: Weather App .gif_          |

From the .gif, you can take the four key features our application offers:

1. Fetch weather from an API on the search page
2. Update the app theme to match the weather condition
3. Toggle the temperature measurement unit on the settings page
4. Refresh the weather by using a pull-down gesture on the weather page

These four features have to be implemented by each state management solution, including their side effects [[@ProgrammingLanguagesWhat]](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect) like the loading indicator when weather data is being fetched.

Since I already knew how to implement the BLoC pattern with the help of flutter_bloc, I’ve decided to start the evaluation process by rewriting the example app to use Flutter’s own state management solution - stateful widgets. From that point forward, the rewritten example app, in this context vanilla app, has been used as a foundation to rewrite the application using a different state management solution.

A simplified version of our example apps widget tree can be seen in _Figure 29_:

| ![Weather App Widget Tree](https://i.imgur.com/uM2ab31.jpg) |
| :---------------------------------------------------------: |
|            _Figure 29: Weather App Widget Tree._            |

The application consists of three screens: _(1) WeatherPage, (2) LocationSearchPage, and (3) SettingsPage_.

### Additional Packages that Will Be Used

Before I finish this chapter, I want to mention some additional packages used to create the examples. These packages are:

- Freezed [[@FreezedDartPackage]](https://pub.dev/packages/freezed)
  - Generates code to help to deal with immutable classes and provides a simple API to use.
- Injectable [[@InjectableDartPackage]](https://pub.dev/packages/injectable)
  - a convenient code generator for the get_it package
- GetIt [[@GetItDart]](https://pub.dev/packages/get_it)
  - "Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App". It is used for Dependecy Injection.
- Dartz [[@DartzDartPackage]](https://pub.dev/packages/dartz)
  - adds functional programming principles to dart
- build_runner [[@BuildRunnerDart]](https://pub.dev/packages/build_runner)
  - a build system to generate dart files
- injectable_generator [[@InjectableGeneratorDart]](https://pub.dev/packages/injectable_generator)
  - a generator to create code for injectable related annotations

Reso Coder's DDD example motivated me to use of these packages. It provides our application with the criteria: _How does the state management solution work with the other packages used by the application_.

This covers the methodology chapter. The next chapter - [Results](#results) covers the results of the implementation.

# Results

## Contents of the Chapter

- [Introduction](#introduction-11)
- [Principles in State Management Solutions](#principles-in-state-management-solutions)
- [Implemented Examples](#implemented-examples)

## Introduction

This chapter will show the results I have collected after the implementation of each state management solution in the SME app. The first section will cover the two different principles upon each SMS is built. The second section contains the implemented SMS. It shows how the SMS is implemented in my architecture and covers its advantages and disadvantages.

## Principles in State Management Solutions

Contents of the Section

- [Introduction](#introduction-12)
- [Principle of Mutable State](#principle-of-mutable-state)
- [Principle of Immutable State](#principle-of-immutable-state)

### Introduction

As you have noticed by now, state management is a hot topic in the Flutter community. Therefore it is not surprising that a lot of people try to provide valid information about state management.
In his article _State Management Explained_, Reso Coder did a great job in explaining the core principles of state management approaches.
In the following part, I am going to summarise his article:

State management solutions can be divided into one out of two principles:
_(1) mutable state and (2) immutable state_.

### Principle of Mutable State

Mutability is specified by its characteristic that object values can change over time [[@Mutable]](https://developer.mozilla.org/en-US/docs/Glossary/Mutable).

Mutable state management solutions are categorized by their lack of separation of concerns and the loose of beneficial immutable state management concepts for state history to achieve an easy undo/redo.

The lack of separation of concerns can be seen in the following _code snippet_ of the MobX example:

```dart
...
class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({@required SettingsEntity settingsEntity})
      : super(settingsEntity);
}

abstract class _SettingsStore with Store {
  _SettingsStore(this.settingsEntity);

  @observable
  SettingsEntity settingsEntity;

  @computed
  bool get value {
    return settingsEntity == SettingsEntity.celsius();
  }

  @action
  void toggleTemperatureUnit() {
    settingsEntity == SettingsEntity.celsius()
        ? settingsEntity = SettingsEntity.fahrenheit()
        : settingsEntity = SettingsEntity.celsius();
  }
}
...
```
_Code snippet 10: SettingsStore in MobX Example._

The code snippet illustrates the collection of state data and state mutating methods in a single file. This use of a single file can get bloated pretty quickly; the more complex the subdomain is.

To approach this problem with a solution, you can split the file into multiple files and annotate them as _parts_. But a problem with this approach is the non-present best practice, which could leave you and others with confusion.

Mutable state management also requires to find a solution to handle **initial** or **empty** **state**, which is, in most cases, a decision between null-checks in the UI or creating a `state enum` to handle the states. The latter approach comes closer to the clean separation in immutable solutions like BLoC.

The last disadvantage is the difficult challenge of managing the state's history. If you have a store with more data than `SettingsEntity`, you will find correlating methods to mutate each data property. Since you then have different data that can change over time without the change of other data properties, it gets much more difficult to track these changes.

On the other hand, mutable state management solutions shine with their lack of boilerplate code and are easy to learn and implement.

### Principle of Immutable State

Immutability is defined by its characteristic that object values cannot be changed after its initializing [@JavaConcurrencyInPractice].

Immutable state management solutions, in contrary, tackle each of the disadvantages of mutable solutions

The following code snippets show how the immutable state management solution BLoC addresses each disadvantage.

```dart
...
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.toggleTemperatureUnit(bool value) = ToggleTemperatureUnit;
}
...
```

_Code snippet 11: SettingsEvent in flutter_bloc example._

```dart
@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({@required TemperatureUnit temperatureUnit}) = _SettingsState;
  factory SettingsState.celcius() => const SettingsState(temperatureUnit:TemperatureUnit.celsius);
  factory SettingsState.fahrenheit() => const SettingsState(temperatureUnit:TemperatureUnit.fahrenheit);
}
...
```

_Code snippet 12: SettingsState in flutter_bloc example._

```dart
...
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => SettingsState.celcius();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is ToggleTemperatureUnit) {
      yield event.value ? SettingsState.celcius() : SettingsState.fahrenheit();
    }
  }
}
...
```
_Code snippet 13: SettingsBloc in flutter_bloc Example._

The separation of concerns is achieved with the three concepts of BLoC: _(1) events, (2) states, and (3) Bloc_.

Each concept has its concern. Events are triggered when the user interacts with the UI and signals the BLoC that the UI needs to update. States are representations of the UI. BLoCs are the glue in the middle between events and states where the business logic of a BLoC lives. The concern of the BLoC is to map each event to its counterpart state.
As you can see in _code snippet 13_ of the BLoC class, the disadvantage of the `initial state` is addressed by providing an initial state out of the box.

The last disadvantage can be addressed by another class of the bloc package - _Transition_ [[@BlocLibraryDart]](https://pub.dev/documentation/bloc/latest/bloc/bloc-library.html). This class consists of the `currentState`, the `event` which was added, and the `next state`. A transition occurs whenever an event is added and after it has been handled by `mapEventToState`. But before the state gets updated.
Another advantage is that with the clear separation of concerns, the **testability** of these components is easier.

Even though immutable state solutions address the disadvantages of mutable state solutions, they come with a drawback - boilerplate. For example, the simplest functionality implemented in BLoC requires quite a lot of overhead.

## Implemented Examples

Contents of the Section

- [Introduction](#introduction-13)
- [Stateful Widget](#stateful-widget-1)
- [Inherited Widget](#inherited-widget-1)
- [ChangeNotifierProvider](#changenotifierprovider)
- [Vanilla BLoC](#vanilla-bloc)
- [BLoC with Flutter_bloc](#bloc-with-flutter_bloc)
- [Redux](#redux)
- [MobX](#mobx)
- [States Rebuilder](#states-rebuilder)

### Introduction

In this section, I will present the state management solutions I have implemented in my architecture. To make it easier for you to follow, I have split each example into five parts:

- Introduction
  - A short introduction to the example, including which type of state management principle is implemented
- Concepts
  - The concepts upon the SMS is built
- Implementation
  - The implementation of the solution in the architecture separated in application layer and presentation layer
- Advantages
  - A list of some advantages
- Disadvantages
  - A list of some disadvantages

### Stateful Widget

#### Introduction

In this example, I am going to show you how to use the `Stateful Widget` option to manage your application state. Stateful Widget is one of Flutter's three widget types. The implementation of this example is inspired by _Flutter Architecture Samples_ [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples).

This solution mutates the application data and then tells Flutter to update the UI. Therefore it follows the mutatable state principle.

#### Concept

In chapter 1 - [Prerequisites](#prerequisites), I have explained how Stateful Widgets work in detail. Therefore, I am keeping the explanation short in this chapter and advice you to revisit chapter one if you need more information.

Whenever you change data and want the UI to rebuild, you have to call the `setState()` method of the corresponding state object, which signals Flutter to rebuild the UI.

#### Implementation

Do you remember _the principle of lifting state up_? It is the fundamental principle to manage app state with Stateful Widgets in Flutter. The common lowest ancestor in this example is the `WeatherApp` itself because you have to update the theme set in `MaterialApp` to display weather changes.

You can see how this looks like in the Widget Tree in _Figure 30_.

| ![Stateful Example Widget Tree](https://i.imgur.com/E0CQYoz.jpg) |
| :--------------------------------------------------------------: |
|   _Figure 30: Simplified Stateful Widget Example Widget Tree_    |

To keep the code as lean as possible in the UI, I have created the `AppState` class, which handles the state changes. This class finds its place in the application layer.

##### Application Layer

```dart
...
class AppState {
  final IWeatherFacade _weatherFacade;
  WeatherEntity weatherEntity;
  ThemeEntity themeEntity;
  SettingsEntity settingsEntity;

  AppState(
    this._weatherFacade, {
    @required this.weatherEntity,
    @required this.themeEntity,
    @required this.settingsEntity,
  });

  void indicateLoading() {
    weatherEntity = WeatherEntity.loading();
  }

  Future<void> fetchWeather({@required String location}) async {
  	try {
      	final WeatherResponse _wr = await _weatherFacade.getWeatherForLocation(location: location);
      	weatherEntity = weatherEntity.copyWith(
        	weatherResponse: some(_wr),
        	city: location,
        	lastUpdated: some(DateTime.now()),
        	isLoading: false,
      	);
      updateThemeToMatchWeatherCondition(weatherResponse: _wr);
    } catch (e) {
      weatherEntity = WeatherEntity.loadingFailure();
    }
  }

  void updateThemeToMatchWeatherCondition({@required WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherCondition weatherCondition =
        _weatherFacade.getWeatherConditionForWeather(weather: _weather);
    themeEntity = themeEntity.updateThemeToMatchWeatherCondition(condition: weatherCondition);
  }

  void toggleTemperatureUnit() {
    settingsEntity = settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? SettingsEntity.fahrenheit()
        : SettingsEntity.celsius();
  }
}
```
_Code snippet 14: AppState Class in Application Layer_

To connect our state management solution to the UI in a lean way, I am using the `AppStateContainer`. It is a ViewModel, which contains a reference to our `AppState` class and methods that change our data and call the state’s `setState()` method. These functions trigger the Stateful Widget to rebuild its children and are passed down the Widget Tree as a reference.

##### Presentation Layer

```dart
...
class AppStateContainer extends StatefulWidget {
  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState appState = getIt<AppState>();

  @override
  Widget build(BuildContext context) {
    return VanillaApp(
      appState: appState,
      toggleTemperatureUnit: toggleTemperatureUnit,
      fetchWeatherForLocation: fetchWeatherForLocation,
      refreshWeatherData: refreshWeatherData,
    );
  }

  Future<void> refreshWeatherData({@required String location}) async {
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.fetchWeather(location: location);
    setState(() {});
  }

  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
```
_Code snippet 15: AppStateContainer_

So if you need to access the state and a method to change the state, you have to pass both down the Widget Tree. The following _code snippet_ shows the content of the Weather Page:

```dart
...
class Weather extends StatelessWidget {
  final AppState _appState;
  final Future<void> Function({@required String location}) _onRefresh;

  const Weather(this._appState, this._onRefresh);

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI());
  }

  Widget _buildUI() {
    if (_appState.weatherEntity.weatherResponse.isSome()) {
      return _buildWeather();
    }
    if (_appState.weatherEntity.hasError) {
      return _buildError();
    }
    if (_appState.weatherEntity.isLoading) {
      return _buildLoading();
    }
    return _buildIdle();
  }

  Widget _buildWeather() {
    return GradientContainer(
      color: _appState.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(location: _appState.weatherEntity.city),
	...
```
_Code snippet 16: Weather Widget in Presentation Layer_

As you can see in _code snippet 16_, the app state and the `refresh()` method have been passed down the Widget Tree into the `Weather` widget. In the method `_buildUI()`, the app state is accessed to determine which content to build. Further down the code snippet, when the `RefreshIndicator` widget has been implemented, you will find the `refresh()` method getting assigned.

#### Advantages

- very easy to understand and implement
- tightly coupled to the widget
  - suitable for the ephemeral state

#### Disadvantages

- has to be passed down each widget in the widget tree from ancestor to child
- difficult to maintain due to the previous point
- tightly coupled to the widget
  - mixes logic with UI and therefore breaks clean code principles [[@FlutterTutorialPros2019]](https://blog.codemagic.io/flutter-tutorial-pros-and-cons-of-state-management-approaches/)
- the full tree is getting rebuilt when data changes

### Inherited Widget

#### Introduction

In this example, I am going to show you how I used the `Inherited Widget` option to manage the application state. Inherited Widget is one of Flutter's three widget types.

This state management solution is an improvement to the Stateful Widget option. It removes the need to pass down the app state and state mutation methods by its nature of easy accessibility inside the Widget Tree.

The implementation of this example is inspired by _Flutter Architecture Samples_ [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples), the official documentation for Inherited Widgets [[@InheritedWidgetClassWidgets]](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) and the YouTube video about Inherited Widgets in the Widgets 101 series [[@InheritedWidgetsExplained]](https://www.youtube.com/watch?v=Zbm3hjPjQMk&list=PLOU2XLYxmsIJyiwUPCou_OVTpRIn_8UMd&index=4).

As well as the Stateful Widget, this one follows the mutable state principle.

#### Concepts

In chapter 1 - [Prerequisites](#prerequisites), I have explained how Inherited Widgets work in detail. Therefore, I am keeping the explanation short in this chapter and advice you to revisit chapter one if you need more information.

The Inherited Widget sits above the lowest common ancestor and can be accessed in any descendant because of its nature.

#### Implementation

The Inherited Widget example is at first a bit complex and overwhelming, but don’t worry. We will walk through it together.

| ![Inherited Widget Example Widget Tree](https://i.imgur.com/LVUHn7C.jpg) |
| :----------------------------------------------------------------------: |
|       _Figure 31: Simplified Inherited Widget Example Widget Tree_       |

##### Application Layer

```dart
...
/// Is a container class that holds the state of different `app states` used in multiple part of the app.
@lazySingleton
class AppState {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;
  WeatherEntity weatherEntity;
  ThemeEntity themeEntity;
  SettingsEntity settingsEntity;

  AppState(
    this._weatherFacade, {
    @required this.weatherEntity,
    @required this.themeEntity,
    @required this.settingsEntity,
  });

  /// Sets the app state of weather data to [WeatherEntity.loading()]
  void indicateLoading() {
    weatherEntity = WeatherEntity.loading();
  }

  /// Returns an app state with loaded weather data that indicates
  /// that the weather has been loaded successfully.
  ///
  /// Otherwise it returns an app state that indicates a loading failure.
  Future<void> getWeatherForLocation({@required String location}) async {
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      weatherEntity = weatherEntity.copyWith(
        weatherResponse: some(_wr),
        city: location,
        lastUpdated: some(DateTime.now()),
        isLoading: false,
      );
      updateThemeToMatchWeatherCondition(weatherResponse: _wr);
    } catch (e) {
      weatherEntity = WeatherEntity.loadingFailure();
    }
  }

  /// Triggers the process to update the theme related to the `WeatherCondition`
  /// which is provided by the `WeatherEntity`.
  void updateThemeToMatchWeatherCondition(
      {@required WeatherResponse weatherResponse}) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherCondition weatherCondition =
        _weatherFacade.getWeatherConditionForWeather(weather: _weather);
    themeEntity = themeEntity.updateThemeToMatchWeatherCondition(
        condition: weatherCondition);
  }

  /// Toggles the temperature unit between `celsius` and `fahrenheit`.
  void toggleTemperatureUnit() {
    settingsEntity = settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? SettingsEntity.fahrenheit()
        : SettingsEntity.celsius();
  }
}
```
_Code snippet 17: AppState Class_

The code snippet above shows the implementation of the `AppState` class.

##### Presentation Layer

```dart
...
/// This widget is a wrapper for an `Inherited Widget` in this case [InheritedAppStateContainer].
///
/// It holds a reference to [AppState]
/// and methods to manipulate the data in [appState].
class AppStateContainer extends StatefulWidget {
  final AppState appState;
  final Widget child;

  const AppStateContainer({
    @required this.child,
    this.appState,
  });

  /// Returns `AppStateContainer` object as [data].
  static AppStateContainerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedAppStateContainer>()
        .data;
  }

  @override
  State<StatefulWidget> createState() => AppStateContainerState();
}

class AppStateContainerState extends State<AppStateContainer> {
  AppState appState;

  @override
  void initState() {
    if (widget.appState != null) {
      appState = widget.appState;
    } else {
      appState = getIt<AppState>();
    }
    super.initState();
  }

  /// Wrap `AppStateContainer` with `InheritedWidgetAppStateContainer`.
  @override
  Widget build(BuildContext context) {
    return InheritedAppStateContainer(
      data: this,
      child: widget.child,
    );
  }

  /// Refreshes the weather data by making a new API call for the given [location]
  /// by calling [appState.getWeatherForLocation(location: location)].
  ///
  /// When a response from the API is received the method signals
  /// the widget to trigger an update of the UI.
  Future<void> refreshWeatherData({@required String location}) async {
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  /// Loads the weather data by calling [appState.getWeatherForLocation(location: location)].
  ///
  /// Signals the UI to display a loading indicator by calling
  /// [appState.indicateLoading()].
  Future<void> fetchWeatherForLocation({@required String location}) async {
    appState.indicateLoading();
    setState(() {});
    await appState.getWeatherForLocation(location: location);
    setState(() {});
  }

  /// Switches the temperature unit from celcius to fahrenheit by calling [appState.toggleTemperatureUnit()].
  void toggleTemperatureUnit() {
    setState(() {
      appState.toggleTemperatureUnit();
    });
  }
}
```

_Code snippet 18: AppStateContainer_

The code snippet above shows the _ViewModel_ - `AppStateContainer`.

It has the same relevance as in the previous examples with some minor changes. Whenever Flutter builds this widget, the widget wraps its child with `InheritedAppStateContainer` - the Inherited Widget - and passes itself down as data. So, whenever the ViewModel changes due to state manipulation, Flutter rebuilds the Inherited Widget.

```dart
...
/// The Inherited Widget used in this example.
class InheritedAppStateContainer extends InheritedWidget {
  const InheritedAppStateContainer(
      {Key key, @required Widget child, @required this.data})
      : super(key: key, child: child);

  final AppStateContainerState data;

  static InheritedAppStateContainer of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedAppStateContainer>();
  }

  @override
  bool updateShouldNotify(InheritedAppStateContainer oldWidget) => true;
}
```
_Code snippet 19: InheritedAppStateContainer_

The code snippet above shows the implementation of our InheritedAppStateContainer. In this example, Inherited Widget provides access to the `ViewModel` with its static method `of(context)`. The method `updateShouldNotify()` notifies widgets, that inherit data from this widget, to rebuild [[@UpdateShouldNotifyMethodInheritedWidget]](https://api.flutter.dev/flutter/widgets/InheritedWidget/updateShouldNotify.html).

The Inherited widget provides access to its data with its static `of(context)` method, as seen in _code snippet 20_.

```dart
...
@override
  Widget build(BuildContext context) {
    AppStateContainerState _container = AppStateContainer.of(context);
    AppState _appState = _container.appState;

    return Center(child: _buildUI());
  }

...

  Widget _buildWeather() {
    return GradientContainer(
      color: _appState.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () => _container.refreshWeatherData(
          location: _appState.weatherEntity.city,
        ),
...
```
_Code snippet 20: Weather Widget_

#### Advantages

- does not rely on third-party libraries
- the amount of rebuild can be reduced by specifying conditions in the `updateShouldNotify()` method. For example, that only widgets related to the settings entity should be rebuild.
- allows descendants to access data and methods without the need to pass it down

#### Disadvantages

- has been overly complicated during the first implementation
- tightly coupled to the widget
  - mixes logic with UI and therefore breaks clean code principles
- unnecessary complicated to implement
- full tree rebuilds when data changes

### ChangeNotifierProvider

#### Introduction

This state management solution has been endorsed by the Flutter team at the Google I/O 2019 [[@PragmaticStateManagement]](https://www.youtube.com/watch?v=d_m5csmrf7I). Furthermore, they show an example [[@SimpleAppState]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple) of how to use the _provider_ [[@ProviderFlutterPackage]](https://pub.dev/packages/provider) package in combination with `ChangeNotifier` [[@ChangeNotifierClassFoundation]](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html).

The provider package by itself is no state management solution. Provider is a tool for dependency injection. It is a wrapper around the _Inherited Widget_.

Provider’s `ChangeNotifierProvider` [[@ChangeNotifierProviderClassProvider]](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html) class, in combination with ChangeNotifier, can be used to manage the state of an application.

ChangeNotifierProvider follows the mutable state principle.

#### Concepts

##### ChangeNotifier

`ChangeNotifier` can be extended or mixed in with a `model` class to provide a Change Notification API. With the API, the method `notifyListeners()` can be used, which notifies its listeners that the state has been mutated and should be rebuilt.

##### ChangeNotifierProvider

`ChangeNotifierProvider` is a widget, from the provider package, which injects a `ChangeNotifier` into the Widget Tree, and provides it to the descendants. `ChangeNotifierProvider` rebuilds descendants that depend on the `ChangeNotifier` whenever the method `notifyListeners()` inside the `ChangeNotifier` is called.

##### Consumer [[@ConsumerClassProvider]](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html)

`Consumer<T>` is a widget from the provider package. It is used to access the instance of the corresponding `Provider<T>`, and passes the value of the provider to its `build()` method.

`Consumer<T>` is a listener to the `ChangeNotifier` provided by the `ChangeNotifierProvider`. Whenever `ChangeNotifierProvider` receives a `notifyListeners()` call, the consumer’s build function runs and rebuilds the descendant Widget.

#### Implementation

For the implementation, I have followed the blog post _Flutter Architecture — My Provider Implementation Guide_ by Dane Mackier [[@mackierFlutterArchitectureProvider2019]](https://medium.com/flutter-community/flutter-architecture-provider-implementation-guide-d33133a9a4e8), as well as the example from the Flutter documentation [[@SimpleAppState]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

Let’s take a look at the implementation. As always, first comes the implementation inside the application layer and then the presentation layer.

##### Application Layer

`WeatherNotifier` is used as a `ChangeNotifier` for the weather logic in the application. It contains `WeatherEntity`, which is is the weather data. Furthermore, it contains a reference to `ThemeNotifier` and the interface `WeatherFacade`.

```dart
...
/// Extends [ChangeNotifier] to be used by [ChangeNotifierProvider].
///
/// Handles weather data related logic.
@lazySingleton
class WeatherNotifier extends ChangeNotifier {
  WeatherNotifier(
      this._weatherEntity, this._themeNotifier, this._weatherFacade);
  final ThemeNotifier _themeNotifier;
  final IWeatherFacade _weatherFacade;
  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  /// Calls the [ThemeNotifier]'s method [mapWeatherCondition()] for a given [WeatherCondition].
  void weatherChanged() {
    final WeatherCondition condition = getWeatherCondition();
    _themeNotifier.mapWeatherCondition(condition: condition);
  }

  /// Returns a [WeatherCondition] with the help of the local [WeatherEntity].
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

  /// Updates our local [WeatherEntity] with a new [WeatherEntity] when the weather data for a given [location] has been refreshed successfully.
  ///
  /// Updates our local [WeatherEntity] with a [WeatherEntity.loadingFailure()] when an error occured while refreshing the weather data for a given [location].
  ///
  /// Calls [weatherChanged()] to delegate the updating of the theme.
  ///
  /// Notifies the listeners of [WeatherNotifier] after the local [WeatherEntity] has been updated.
  Future<void> refreshWeatherForLocation({String location}) async {
    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _weatherEntity = _weatherEntity.copyWith(
        weatherResponse: some(_wr),
        lastUpdated: some(DateTime.now()),
      );
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _weatherEntity = WeatherEntity.loadingFailure();
      notifyListeners();
    }
  }

  /// Updates our local [WeatherEntity] with a new [WeatherEntity] when the weather data for a given [location] has been fetched successfully.
  ///
  /// Updates our local [WeatherEntity] with a [WeatherEntity.loadingFailure()] when an error occured while fetching the weather data for a given [location].
  ///
  /// Calls [weatherChanged()] to delegate the updating of the theme.
  ///
  /// Notifies the listeners of [WeatherNotifier] after the local [WeatherEntity] has been updated.
  Future<void> fetchWeatherForLocation({String location}) async {
    _weatherEntity = WeatherEntity.loading();
    notifyListeners();

    try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(location: location);
      _weatherEntity = WeatherEntity(
        weatherResponse: some(_wr),
        city: location,
        hasError: false,
        lastUpdated: some(DateTime.now()),
        isLoading: false,
      );
      notifyListeners();
      weatherChanged();
    } catch (err) {
      _weatherEntity = WeatherEntity.loadingFailure();
      notifyListeners();
    }
  }
}
```
_Code snippet 21: WeatherNofitifer inside Application Layer_

Whenever `WeatherEntity` changes, due to the methods `fetchWeatherForLocation()` or `refreshWeatherForLocation()`, the method `notifyListeners()` is called, which signals the `ChangeNotifierProvider` to update the UI by telling its descendants to run their builder callback.

##### Presentation Layer

To access `WeatherNotifier` inside the presentation layer, it needs to be injected inside the lowest common ancestor with the help of `ChangeNotifierProvider` .

```dart
...
class ChangeNotifierProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherNotifier>(
          create: (_) => getIt<WeatherNotifier>(),
        ),
        ChangeNotifierProvider<SettingsNotifier>(
          create: (_) => getIt<SettingsNotifier>(),
        ),
      ],

      /// Consumes the [ThemeNotifier] and rebuilds the MaterialApp whenever it receive a `change notification`.
      child: Consumer<ThemeNotifier>(
        builder: (context, data, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: data.theme,
          home: WeatherPage(),
        ),
      ),
    );
  }
}
```
_Code snippet 22: ChangeNotifierProviderApp Widget in Presentation Layer_

After `WeatherNotifier` has been injected into the Widget Tree inside `ChangeNotifierProvider`, it can be accessed inside the `Weather` widget.

```dart
...
  WeatherNotifier _weatherNotifier;

...

  @override
  Widget build(BuildContext context) {
    // Gets the weather ChangeNotifier.
    _weatherNotifier = Provider.of<WeatherNotifier>(context, listen: false);
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    /// Consumes the [WeatherNotifier] and rebuilds the weather content whenever it receives a `change notification`.
    return Consumer<WeatherNotifier>(
        builder: (context, weatherNotifier, child) {
      if (weatherNotifier.weatherEntity.isLoading) {
        return _buildLoading();
      }
      if (weatherNotifier.weatherEntity.hasError) {
        return _buildError();
      }
      if (weatherNotifier.weatherEntity.weatherResponse.isNone()) {
        return _buildIdle();
      }
      _refreshCompleter?.complete();
      _refreshCompleter = Completer<void>();
      return _buildWeather(context);
    });
  }
...
```
_Code snippet 23: Weather Widget in Presentation Layer_

It is essential to set the `listen` parameter inside `Provider.of<WeatherNotifier>` to false. Otherwise, it tries to reassign `WeatherNotifier` whenever `notifyListeners()` is being emitted.

#### Advantages

- easy to implement
- almost no boilerplate
- simple

#### Disadvantages

- difficult to keep track of state history
- no state that represents the current status of the notifier
  - an enum has to be created and maintained
- you need to keep track when not to listen for `notifyListeners()`

### Vanilla BLoC

#### Introduction

The BLoC (**B**usiness **Lo**gic **C**omponent) pattern was first introduced at the Google I/O 2018 [[@BuildReactiveMobile]](https://www.youtube.com/watch?v=RS36gBEp8OI). So to explain this pattern, I am going to keep it close to the information provided in the talk.

The BLoC pattern provides a reactive approach to handle state changes in Flutter. It is based on `Streams` [[@StreamClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/Stream-class.html), which are a core concept of _asynchronous programming_ in Dart.[[@AsynchronousProgrammingStreams]](https://dart.dev/tutorials/language/streams) The BLoC takes in events, runs the needed business logic if necessary, and outputs the resulting data.

The BLoC pattern can be used as a _mutable or immutable_ state management solution. You can either add mutated data to the stream or a new data object. In this example, the immutable approach has been implemented.

#### Concept

To understand the concept of BLoC, you will have to get familiar with the concept of streams in Dart.

| ![Stream Concept](https://i.imgur.com/J4ohiiR.jpg) |
| :------------------------------------------------: |
|           _Figure 32: Concept of Stream_           |

Think about water running through a rain gutter, which you want to use to flush down toy soldiers from the roof of your house. On your roof, at one side of the pipe, you have your **sink**. The sink is the location where your comrade puts in the little soldiers. At the other end of your pipe, you want to **react** to toy soldiers being flushed down the gutter. To be able to react to the toy soldiers being flushed down, you use a strainer. But without clear communication, you don't know when a toy soldier is being flushed down the pipe. And you don't want to stand there all day and waste your time waiting. So you start to **listen** for your comrade's signal to prepare yourself.

This example includes all the core principles of streams in Dart.

- `StreamSink` [[@StreamSinkClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/StreamSink-class.html) which is for event input
- `Stream` [[@StreamClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/Stream-class.html) which is used for the data output

To put these concepts together, you will need one more thing - the `StreamController` [[@StreamControllerClassDart]](https://api.dart.dev/stable/2.8.1/dart-async/StreamController-class.html) - which handles the input, output, and more. The `StreamController` in our example is the rain gutter itself.

By default, the `StreamController` only supports a _single-subscription stream_. To allow multiple listeners to subscribe, you can use the `StreamController.broadcast()` constructor.

| ![StreamController Concept](https://i.imgur.com/w6cYnYQ.jpg) |
| :----------------------------------------------------------: |
|            _Figure 33: StreamController Concept_             |

When the concepts of reactive programming are combined, the result is the BLoC. _Figure 34_ shows a Widget Tree and how a BLoC works:

|                                    ![Bloc concept](https://i.imgur.com/Uter9X7.png)                                     |
| :---------------------------------------------------------------------------------------------------------------------: |
| _Figure 34: Image taken from the Google I/O 2018 [[@BuildReactiveMobile]](https://www.youtube.com/watch?v=RS36gBEp8OI)_ |

The light blue arrows indicate events that have been added by a widget to the `StreamSink`. These **events** are handled inside the BLoC. The output is then emitted via `Stream`. The widgets with the speaker-icon are listening to a stream inside the BLoC. As you can see by the purple arrow, the orange widget is receiving data through a stream and can react to it.

#### Implementation

For the implementation of the BLoC pattern. I have adapted two tutorials: _(1) Reactive Programming - Streams - BLoC_ [[@boelensFlutterReactiveProgramming]](https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/) _and (2) Getting Started with the BLoC Pattern_ [[@GettingStartedBLoC]](https://www.raywenderlich.com/4074597-getting-started-with-the-bloc-pattern).

When working with StreamControllers in Flutter, you can run into a problem: _Broadcast streams_ do not buffer events when there is no listener [[@DartFlutterBad]](https://stackoverflow.com/questions/51396769/flutter-bad-state-stream-has-already-been-listened-to). Adding an initial value to the sink inside the BLoC's constructor won't be possible anymore. And each BLoC implementation, in the example, is adding an initial value inside its constructor.

As a workaround for the problem, I am recommending `BehaviourSubject` [[@BehaviorSubjectClassRx]](https://pub.dev/documentation/rxdart/latest/rx/BehaviorSubject-class.html) provided by `rxdart` [[@RxdartDartPackage]](https://pub.dev/packages/rxdart).
A `BehaviourSubject` is a special `StreamController`, which is by default a **broadcast stream** and sends the latest item, added to the sink, to new listeners. Therefore it also works without listeners, which in the constructor case is from an advantage.

Let's take a look at how the weather data logic is implemented with the `WeatherBloc`.

To specify the types of events that can be added to the weather bloc sink, an interface - _weather_event.dart_ - has been created. We specified `WeatherEvent.fetchWeatherForLocation` and `WeatherEvent.refreshWeatherForLocation` as events.

```dart
part of 'weather_bloc.dart';

/// An interface to specify weather events.
@freezed
abstract class WeatherEvent with _$WeatherEvent {
  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocation({String location}) =
      FetchWeather;

  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation({String location}) =
      RefreshWeather;
}
```
_Code snippet 24: WeatherEvent Class_

Inside the `WeatherBloc` class, the interface `Bloc` has been implemented.

This interface specifies that the method `dispose()` has to be added for each BLoC. This has to be done to prevent memory leaks in the future.

```dart
/// An interface to implement a dispose contract for blocs to prevent memory leaks.
abstract class Bloc {
  void dispose();
}
```
_Code snippet 25: Bloc Interface_

The WeatherBloc can be separated into two part:

1. StreamController, Streams, Sinks
2. Logic related methods

In the first part, the _BehaviourSubject_ `_weatherEntityStateController` of type `WeatherEntity` is declared, as well as getters for its **_sink_** `_inWeatherEntity` and **_stream_** `weatherEntity`. Additionally a **_StreamController_** `_weatherEventController` for `WeatherEvents` is declared. As soon as the BLoC is created, it starts to **_listen_** to the stream inside `_weatherEventController`.

The second part contains the method `mapEventToState()`, which is used as a callback whenever a new weather event is emitted by the `_weatherEventController.stream`. Depending on the event we either call the method `fetchWeatherForLocation(location: event.location)` or `refreshWeather(location: event.location)` with the location inside the event as parameter.

The method `dispose()` has been overwritten, and closes the `StreamController` inside `WeatherBloc` whenever the BLoC is disposed of.

##### Application Layer

```dart
...
class WeatherBloc implements Bloc {
  WeatherBloc(
    this._weatherFacade,
    this._themeBloc,
  ) {
    // Start to listen to the weather event stream to be able to react to events.
    _weatherEventController.stream.listen(_mapEventToState);
  }

  final IWeatherFacade _weatherFacade;
  final ThemeBloc _themeBloc;

  /// Uses the `BehaviourSubject` from `rxdart` to create an advanced [StreamController].
  final _weatherEntityStateController = BehaviorSubject<WeatherEntity>();

  /// A reference to the `stream sink` of the `BehaviourSubject`.
  StreamSink<WeatherEntity> get _inWeatherEntity =>
      _weatherEntityStateController.sink;

  /// A reference to the `stream` of the `BehaviourSubject`.
  Stream<WeatherEntity> get weatherEntity =>
      _weatherEntityStateController.stream;

  /// Creates an instance of a `weather event Streamcontroller`.
  final _weatherEventController = StreamController<WeatherEvent>();

  /// A reference to the `event StreamController's sink`.
  Sink<WeatherEvent> get weatherEventSink => _weatherEventController.sink;

  /// Map the asynchronous `event` to an asynchronous `reaction` to the event.
  Future<void> _mapEventToState(WeatherEvent event) async {
    if (event is FetchWeather) {
      await _fetchWeatherForLocation(location: event.location);
    }
    if (event is RefreshWeather) {
      await _refreshWeather(location: event.location);
    }
  }
...
 /// Closes all [StreamController] inside the weather bloc when it gets disposed.
  @override
  void dispose() {
    _weatherEventController.close();
    _weatherEntityStateController.close();
  }
}
```
_Code snippet 26: WeatherBloc Class_

In the UI, the `WeatherBloc` is implemented inside the `Weather` widget. You get a reference to the BLoC by using `getIt`. For the representation of the UI depending on the `WeatherBloc state`, a `StreamBuilder` [[@StreamBuilderClassWidgets]](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) is used.

`StreamBuilder` is a widget that takes in a Stream, in this case, `_weatherBloc.weatherEntity` and builds the UI whenever a value is emitted by the stream. The new value is represented by an `AsyncSnapshot`[[@AsyncSnapshotClassWidgets]](https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html).

An `AsyncSnapshot` is a representation of the current state of the asynchronous data. Depending on the asynchronous data, the UI is built.

##### Presentation Layer

```dart
...
  @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    // Gets the reference to the WeatherBloc instance.
    _weatherBloc = getIt<WeatherBloc>();
    // Rebuilds the weather content whenever a new WeatherEntity is received in the stream.
    return StreamBuilder<WeatherEntity>(
      stream: _weatherBloc.weatherEntity,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildIdle();
        } else {
          if (snapshot.data.isLoading) {
            return _buildLoading();
          }
          if (snapshot.data.hasError) {
            return _buildError();
          }
          _refreshCompleter?.complete();
          _refreshCompleter = Completer<void>();
          return _buildWeather(snapshot.data);
        }
      },
    );
  }
...
```
_Code snippet 27: Weather Widget in Presentation Layer_

#### Advantages

- clear separation of concerns
  _ no business logic inside the UI
  _ easier to test
- can be accessed from anywhere in the tree
- plays well with Flutter's reactivity
- reduces the number of builds compared to `setState()`

#### Disadvantages

- reactive programming is not straightforward
  - people have it difficult to understand reactive programming
- a lot of boilerplate
- the concepts take some time to get your head around

### Bloc with Flutter_bloc

#### Introduction

Bloc [[@BlocDartPackage]](https://pub.dev/packages/bloc) is a package developed by Felix Angelov. It extends the core principles of BLoC and provides a simple API, which reduces the amount of boilerplate code to work with Streams.

Additionally, the package flutter_bloc [[@FlutterBlocFlutter]](https://pub.dev/packages/flutter_bloc) is used, which provides a collection of widgets for Flutter to handle Blocs.

It has been developed with three core values in mind: [[@WhyBlocBloc]](https://bloclibrary.dev/#/whybloc)

1. Simple
   - easy to understand and can be used by developers with varying skill levels
2. Powerful
   - help make amazing, complex applications by composing them of smaller components
3. Testable
   - easily test every aspect of an application so that we can iterate with confidence

Bloc follows the immutable state principle.

#### Concepts

To understand how Bloc differentiates from the Vanilla BLoC example, you have to take a look at the two principles in this example's implementation.

##### Concept of Bloc [[@BlocBloc]](https://bloclibrary.dev/#/coreconcepts)

| ![Concept of Bloc](https://i.imgur.com/cOtE6aE.jpg) |
| :-------------------------------------------------: |
|            _Figure 35: Concept of Bloc_             |

- Events
  - Events are the input to a Bloc, provided via interaction with the user interface.
- States
  - States are the output of a Bloc and represent a part of the application’s state. They are used inside the UI to build the representative UI state and redraw it when the state changes.
- Streams
  - As previously explained in the Vanilla BLoC example, streams are a continuous flow of asynchronous data.
- Blocs
  - Are the essential part of the pattern. They convert a stream of incoming events into a stream of outgoing states.

For more concepts like _Transitions_ and _BlocDelegate_ visit bloclibrary.

##### Concepts of Flutter_bloc [[@FlutterBlocBloc]](https://bloclibrary.dev/#/flutterbloccoreconcepts)

- BlocBuilder
  - A widget, which requires a `Bloc` and a `builder()` function. It is very similar to a StreamBuilder but with a _more straightforward API_ and _less amount of boilerplate_ needed. The builder function **_needs to return a widget in response to the state_**. The builder function can be called multiple times.
- BlocProvider
  - A widget that uses the provider [[@ProviderFlutterPackage]](https://pub.dev/packages/provider) package by Rémi Rousselet for its dependency injection to inject a Bloc inside the Widget Tree and provide it to descendants.
- BlocListener
  - A widget that is used to handle logic that **should only happen once** when the state changes. Such logic can be navigation. Its listener method is only called once for each state change in comparison to the BlocBuilder’s builder method, which is called multiple times.
- BlocConsumer
  - A widget that combines a `BlocListener` and a `BlocBuilder` with less amount of boilerplate.

For more concepts like _MultiBlocProvider_, _MultiBlocListener_, _RepositoryProvider_ and _MultiRepositoryProvider_ visit bloclibrary.

#### Implementation

Let’s walk through the implementation of the WeatherBloc inside the application layer and how it can be accessed in the presentation layer.

##### Application Layer

Inside the application layer, the `WeatherBloc` is specified with its three essential concepts: _(1) events, (2) states, and (3) Bloc_.

`Weather Event` is an interface to specify two events:

1. fetchWeatherForLocation
2. refreshWeatherForLocation

```dart
...
abstract class WeatherEvent with _$WeatherEvent {
  /// Specifies a weather event to fetch weather data for a given [location].
  const factory WeatherEvent.fetchWeatherForLocation(String location) =
      FetchWeather;

  /// Specifies a weather event to refresh weather data for a given [location].
  const factory WeatherEvent.refreshWeatherForLocation(String location) =
      RefreshWeather;
}
```
_Code snippet 28: WeatherEvent Class_

`Weather State` is an interface to specify the states the Bloc can output, which the UI uses to represent its state. It contains four states:

1. Initial
2. Loading
3. LoadingFailure
4. Loaded (contains a `WeatherEntity`)

```dart
...
abstract class WeatherState with _$WeatherState {
  /// Specifies a weather state that indicates the initial state.
  const factory WeatherState.initial() = Initial;

  /// Specifies a weather state that indicates the loading state.
  const factory WeatherState.loading() = Loading;

  /// Specifies a weather state that indicates a loading failure state.
  const factory WeatherState.loadingFailure() = LoadingFailure;

  /// Specifies a weather state that indicates a successful loading state.
  const factory WeatherState.loaded(WeatherEntity weatherEntity) = Loaded;
}
```
_Code snippet 29: WeatherState Class_

Inside the WeatherBloc class resides the logic of the weather functionality.

Each Bloc contains a getter for the `initial state` which, in this case, returns `WeatherState.initial()`. Furthermore, each Bloc contains the method `mapEventToState(WeatherEvent event)`, which is responsible to output a stream of `WeatherState` for the corresponding `WeatherEvent`.

To keep the method `mapEventToState()` as lean as possible, you have to delegate the logic, when a `FetchWeather` event is emitted, to the method `_mapFetchWeatherToState()`. Inside this method, an asynchronous call is made, and depending on the result, either `WeatherState.loaded()` with a WeatherEntity or `WeatherState.loadingFailure()` is yielded. During the asynchronous call, the WeatherState `WeatherState.loading()` is yielded to indicate that an asynchronous call is taking place.

```dart
...
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherFacade _weatherFacade;

  WeatherBloc(this._weatherFacade);

  @override
  WeatherState get initialState => const WeatherState.initial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
    if (event is RefreshWeather) {
      yield* _mapRefreshWeatherToState(event);
    }
  }

  /// Yields [WeatherState.loaded(weatherEntity)] with a newly created [WeatherEntity] when the weather data has been fetched successfully.
  ///
  /// Yields [WeatherState.loadingFailure()] when an error occured while fetchibg the weather data.
  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    yield const WeatherState.loading();
    try {
      final WeatherResponse _weatherResponse =
          await _weatherFacade.getWeatherForLocation(location: event.location);
      yield WeatherState.loaded(WeatherEntity(
          weatherResponse: some(_weatherResponse),
          city: event.location,
          lastUpdated: some(DateTime.now())));
    } catch (err) {
      yield const WeatherState.loadingFailure();
    }
  }
...
```
_Code snippet 30: WeatherBloc Class_

Now, let’s take a look at how the Bloc can be accessed in the UI.

##### Presentation Layer

The first step to access the Bloc is to use `BlocProvider` to inject an instance of the Bloc to the Widget Tree. Since multiple Blocs need to be injected at this level of the Widget Tree, a `MultiBlocProvider` is used. The injection happens inside the `WeatherApp` widget, which in this example, is named `FlutterBlocApp`.

```dart
...
class FlutterBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuilds the MaterialApp whenever the ThemeState changes.
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (_) => getIt<WeatherBloc>(),
            ),
            BlocProvider<SettingsBloc>(
              create: (context) => getIt<SettingsBloc>(),
            )
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: themeState.themeEntity.themeData,
              home: WeatherPage()),
        );
      },
    );
  }
}
```
_Code snippet 31: FlutterBlocApp Widget_

Inside the `Weather` widget, the Bloc is accessed using the widget `BlocConsumer`. `BlocConsumer` is a simplified version of a `BlocListener` with nested `BlocBuilder`.

In the listener callback, the side-effect of adapting the theme, when the weather changes, is being handled. When the weather changes, which is represented by the WeatherState `Loaded`, an event is added to the `ThemeBloc`, which is accessed via `context.bloc<ThemeBloc>()`.

Inside the builder callback, the corresponding UI representation for the states `LoadingFailure, Loading, Loaded` is specified.

```dart
...
 @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    // Rebuilds the weather content whenever a new WeatherState is received.
    return BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
      if (state is Loaded) {
        final model.Weather _weather = state.weatherEntity.weatherResponse
            .getOrElse(() => null)
            .weatherCollection
            .first;
        // Adds the ThemeEvent weatherChanged to the event stream when the WeatherState is loaded.
        context.bloc<ThemeBloc>().add(
              ThemeEvent.weatherChanged(
                _weather.mapConditionToWeatherCondition(_weather.condition),
              ),
            );
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      }
    }, builder: (context, state) {
      if (state is LoadingFailure) {
        return _buildError();
      }
      if (state is Loading) {
        return _buildLoading();
      }
      if (state is Loaded) {
        return _buildWeather(context, state);
      }
      return _buildIdle();
    });
  }
...
```
_Code snippet 32: Weather Widget in Presentation Layer_

#### Advantages

- unidirectional data flow
- simple API
- separation of concerns
- reusable
- implementation of the initial state
- side-effects handled in listeners

#### Disadvantages

- still a lot of boilerplate
- too much overhead for small examples
- it takes time to understand

### Redux

#### Introduction

For this example, I have used the Redux example by Brian Egan at Flutter Samples [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples) as a reference. The example uses the packages _redux_ [[@ReduxDartPackage]](https://pub.dev/packages/redux) and _flutter_redux_ [[@FlutterReduxFlutter]](https://pub.dev/packages/flutter_redux).

Redux is based upon three principles [[@Redux]](https://redux.js.org/introduction/three-principles):

1. Single source of truth
   - The global state of the application is stored in an object tree within a single store.
2. State is read-only
   - the only way to change state is to emit an action, an object describing what happened.
3. Changes are made with pure functions
   - To specify how the state is transformed by actions, you write pure reducers.

Redux follows the immutable state principle. The state object is read-only and can only be changed by returning a new state object inside a reducer.

#### Concept

##### Concepts of Redux

The explanation of the following concepts is taken from the Redux example from Flutter Architecture Samples by Brian Egan [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples):

###### State

The state is an immutable Object that lives at the top of your Widget hierarchy within a `Store`. To create a new `State` an `Action` must be dispatched.

###### Store

The store is passed down to all descendants via an `InheritedWidget`, the `StoreProvider`.

###### Action

`Actions` will be picked up by a `Reducer`, which is a function that builds and returns a new `State` based on the previous `State` and the `Action` that was dispatched.

###### Reducer

Reducers are pure functions.

###### Middleware

`Middlewares` run in response to an `Action` that is dispatched and executed before the `Reducer`. This allows you to intercept an `Action` and fetch data in response.

###### Selector

To read data from the `State` use `selector` functions.

Let’s take a look at _Figure 36_ to see Redux in action.

| ![Concept of Redux](https://i.imgur.com/YWH4pOa.jpg) |
| :--------------------------------------------------: |
|            _Figure 36: Concept of Redux_             |

The UI is a representation of the current `State`. It listens to events from the user and dispatches an `Action` corresponding to the event.

The `Action` gets processed by a `Reducer`. Since a reducer is a pure function, it can not handle asynchronous calls. This is where the `Middleware` comes into play.

The `Middleware` intercepts an action and can be used to process an asynchronous call. When the middleware is finished with the asynchronous call, it dispatches a new `Action` which is being processed by a reducer.

The `Reducer` returns a new state object with the data provided by the action. With the new state object, the UI rebuilds to represent that state.

##### Concepts of flutter_redux

###### StoreProvider

The `StoreProvider` injects the store into the Widget Tree and provides it to all descendants in need.

###### StoreConnector

`StoreConnector` is a descendant widget that gets the store from the nearest `StoreProvider` ancestor and converts the store into a `ViewModel`. Whenever the store emits a change event, the widget will be rebuilt.

###### StoreBuilder

`StoreBuilder` passes down the store to a widget’s `builder()` function.

#### Implementation

Let’s walk through the implementation of the Redux example.

This walkthrough will cover the implementation inside the presentation layer as well as the implementation inside the application layer.

##### Application Layer

To keep the implementation part _lean_, only the weather relevant Redux components are shown.

##### State

###### App State

```dart
...
abstract class AppState with _$AppState {
  const factory AppState(
      {@required WeatherState weatherState,
      @required ThemeState themeState,
      @required SettingsState settingsState,
      @required bool isLoading}) = _AppState;

  /// Represents the initial state of the app.
  @factoryMethod
  factory AppState.initial({
    @required WeatherState weatherState,
    @required ThemeState themeState,
    @required SettingsState settingsState,
  }) =>
      AppState(
        weatherState: weatherState,
        themeState: themeState,
        settingsState: settingsState,
        isLoading: false,
      );
}
```
_Code snippet 33: AppState Class_

The app state consists of multiple smaller state objects to have a separation in concern inside the store. For example, `WeatherState`. This makes it easy to split the state visually into separate components.

###### Weather State

```dart
...
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @required WeatherEntity weatherEntity,
    bool isRefreshing,
  }) = _WeatherState;

  /// Represents the initial state of the weather data.
  @factoryMethod
  factory WeatherState.initial({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: false);

  /// Represents the state of weather data when it is refreshing.
  factory WeatherState.isRefreshing({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: true);
}
```
_Code snippet 34: WeatherState Class_

`WeatherState` is an interface that represents the states that the `WeatherState` can be: _(1) initial and (2) isRefreshing_. The `WeatherEntity` contains data related to the weather, whereas `isRefreshing` is a flag to mark if the weather data is being fetched or refreshed.

##### Actions

```dart
...
abstract class WeatherActions with _$WeatherActions {
  /// A `WeatherAction` that signals Redux to fetch weather.
  const factory WeatherActions.fetchWeatherAction({@required String location}) =
      FetchWeatherAction;

  /// A `WeatherAction` that signals Redux that the weather has been loaded.
  const factory WeatherActions.weatherLoadedAction(
      {@required WeatherResponse weatherResponse}) = WeatherLoadedAction;

  /// A `WeatherAction` that signals Redux that the weather could not be loaded.
  const factory WeatherActions.weatherNotLoadedAction() =
      WeatherNotLoadedAction;

  /// A `WeatherAction` that signals Redux that the weather data is refreshing.
  const factory WeatherActions.setIsRefreshingAction() = SetIsRefreshingAction;

  /// A `WeatherAction` that signals Redux to refresh the weather data.
  const factory WeatherActions.refreshWeatherAction() = RefreshWeatherAction;
}
```
_Code snippet 35: WeatherActions Class_

The interface `WeatherActions` specifies which types of actions can be dispatched to start a process to update the weather state. Since the state is read-only, it can only be changed by an action. Therefore, all actions need to be specified here.

##### Middleware

```dart
/// This middleware takes care of the asynchronous portion of
/// weather reducers.
List<Middleware<AppState>> createWeatherMiddleware(
  IWeatherFacade _weatherFacade,
) {
  final fetchWeather = _createFetchWeather(_weatherFacade);
  final refreshWeather = _createRefreshWeather(_weatherFacade);

  return [
    TypedMiddleware<AppState, FetchWeatherAction>(fetchWeather),
    TypedMiddleware<AppState, RefreshWeatherAction>(refreshWeather),
  ];
}

void Function(
  Store<AppState> store,
  FetchWeatherAction action,
  NextDispatcher next,
) _createFetchWeather(IWeatherFacade weatherFacade) {
  return (
    Store<AppState> store,
    FetchWeatherAction action,
    NextDispatcher next,
  ) {
    weatherFacade
        .getWeatherForLocation(location: action.location)
        .then((weatherResponse) {
      store.dispatch(WeatherLoadedAction(weatherResponse: weatherResponse));
    }).catchError(
      (_) => store.dispatch(
        const WeatherNotLoadedAction(),
      ),
    );
    next(action);
  };
}

void Function(
  Store<AppState> store,
  RefreshWeatherAction action,
  NextDispatcher next,
) _createRefreshWeather(IWeatherFacade weatherFacade) {
  return (
    Store<AppState> store,
    RefreshWeatherAction action,
    NextDispatcher next,
  ) {
    store.dispatch(
      const SetIsRefreshingAction(),
    );
    weatherFacade
        .getWeatherForLocation(location: citySelector(store.state))
        .then(
          (model.WeatherResponse weatherResponse) => store.dispatch(
            WeatherLoadedAction(weatherResponse: weatherResponse),
          ),
        )
        .catchError(
          (_) => store.dispatch(
            const WeatherNotLoadedAction(),
          ),
        );
    next(action);
  };
}
```
_Code snippet 36: Weather Middleware_

Since the functionalities to fetch the weather and refresh the weather require an API call, they are asynchronous.

Due to the Redux concept, that reducers are pure functions, the action to fetch/refresh the weather data needs to be intercepted by a `Middleware`. The middleware intercepts the action and makes the asynchronous call.

Depending on the result of the asynchronous call, a new `Action` is being dispatched. The Action then gets processed by its responding `Reducer`.

##### Reducers

###### AppReducer

```dart
...
/// Returns the `AppState` which has all reducers combined into one.
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    weatherState: weatherReducer(state.weatherState, action),
    settingsState: settingsReducer(state.settingsState, action),
    themeState: themeReducer(state.themeState, action),
    isLoading: loadingReducer(state.isLoading, action),
  );
}
```
_Code snippet 37: AppReducer Function_

`Reducers` return a new state, that represents the updated UI.

Since we can have multiple app states, the `AppState` is represented by the result of a `Reducer`.
And since there are multiple reducers for different actions, a collection of reducers, e.g., `weatherReducer`, is assigned to `weatherState`.

###### WeatherReducer

```dart
...
/// Is a collection of weather related reducers.
final Reducer<WeatherState> weatherReducer = combineReducers<WeatherState>([
  TypedReducer<WeatherState, WeatherLoadedAction>(_setWeather),
  TypedReducer<WeatherState, WeatherNotLoadedAction>(_setNoWeatherState),
  TypedReducer<WeatherState, RefreshWeatherAction>(_setIsRefreshingWeather),
]);

/// Returns a `WeatherState` which indicates that we are in a refreshing process.
WeatherState _setIsRefreshingWeather(WeatherState state, action) {
  return WeatherState.isRefreshing(weatherEntity: state.weatherEntity);
}

/// Returns a `WeatherState` after the action `WeatherLoadedAction` has been called and
/// the loaded weather data has been set.
WeatherState _setWeather(
    WeatherState weatherState, WeatherLoadedAction action) {
  return WeatherState(
    weatherEntity: WeatherEntity(
      weatherResponse: some(action.weatherResponse),
      city: action.weatherResponse.title,
      hasError: false,
      lastUpdated: some(DateTime.now()),
    ),
    isRefreshing: false,
  );
}

/// Returns a `WeatherState` to indicate that there has been an error
/// when trying to load weather data.
WeatherState _setNoWeatherState(
    WeatherState weatherState, WeatherNotLoadedAction action) {
  return WeatherState.initial(
    weatherEntity: WeatherEntity.loadingFailure(),
  );
}
```
_Code snippet 38: WeatherReducer Function_

The `weatherReducer` is a collection of reducers related to `WeatherState`.

##### Selectors

```dart
...
/// Returns the `WeatherResponse` of the current weather state or null
/// if none is present.
WeatherResponse weatherResponseSelector(AppState state) =>
    state.weatherState.weatherEntity.weatherResponse.getOrElse(() => null);

/// Returns the `DateTime` when the weather data was loaded last or null if it has not been yet.
DateTime lastUpdatedSelector(AppState state) =>
    state.weatherState.weatherEntity.lastUpdated.getOrElse(() => null);

/// Returns the name of the city weather data was loaded for last.
String citySelector(AppState state) => state.weatherState.weatherEntity.city;

/// Returns the `WeatherState` of the current state.
WeatherState weatherStateSelector(AppState state) => state.weatherState;
```
_Code snippet 38: Weather State related Selectors_

Sometimes it is necessary to access only single attributes from a state. This is where `Selectors` come into play. `Selectors` are pure functions, that return the specified attribute.

##### Presentation Layer

To implement Redux to a Flutter application, it needs to be initialized at the beginning of the application - _the main_. This is the result of its principle as a single source of truth.

```dart
...
void main() {
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  // Initialise the Redux store.
  final store = Store<AppState>(
    appReducer,
    initialState: getIt<AppState>(),
    middleware: createWeatherMiddleware(
      getIt<IWeatherFacade>(),
    ),
  );

  runApp(
    StoreProvider(
      store: store,
      child: ReduxApp(),
    ),
  );
}
```
_Code snippet 40: Redux Store Initialization_

Let’s take a look at the `Weather` widget:

```dart
...
@override
  Widget build(BuildContext context) {
    return Center(
      child: StoreConnector<AppState, bool>(
          converter: (store) => store.state.isLoading,
          builder: (context, isLoading) {
            if (isLoading) {
              return _buildLoading();
            }
            return _buildUI(context);
          }),
    );
  }

  Widget _buildUI(BuildContext context) {
    return StoreConnector<AppState, WeatherState>(
      builder: (BuildContext context, WeatherState weatherState) {
        if (weatherState.weatherEntity.hasError) {
          return _buildError();
        }
        if (weatherState.weatherEntity.weatherResponse.isNone()) {
          return _buildIdle();
        }
        if (weatherState.isRefreshing) {
          return _buildWeather(context, weatherState);
        }
        _refreshCompleter?.complete();
        _refreshCompleter = Completer<void>();
        return _buildWeather(context, weatherState);
      },
      converter: (Store<AppState> store) => weatherStateSelector(store.state),
    );
  }
...
```
_Code snippet 41: Weather Widget_

Due to Redux's strict separation of concerns, the `ProgressLoadingIndicator` had to be moved from the method `_buildUI()` to the widget's `build()` method. The `converter` callback from `StoreConnector` looks for the _store_ from the nearest `StoreProvider` and returns the `isLoading` attribute. The value of `isLoading` is then used to build either a `ProgressLoadingIndicator` or the weather UI.

In the method `_buildUI()`, a `StoreConnector` is used to connect the UI to the Redux store. The `converter` callback returns the `WeatherState`, which is used to determine which UI to build.

#### Advantages

- a clear separation of concerns
- a single source of truth
- easy to test
- immutability

#### Disadvantages

- very complex
- difficult to learn
- a lot of boilerplate
- simple functionalities require overhead to implement

### MobX

#### Introduction

This example has been build with the help of Reso Coder’s written MobX tutorial [[@FlutterMobXTutorial2019]](https://resocoder.com/2019/12/26/flutter-mobx-tutorial-transparent-reactive-state-management/).

> MobX is a battle tested library that makes state management simple and scalable by transparently applying functional reactive programming (TFRP). The philosophy behind MobX is very simple: _Anything that can be derived from the application state, should be derived. Automatically._ This includes the UI, data serialization, server communication, etc. [[@IntroductionMobX]](https://mobx.js.org//index.html)

Similar to Redux or Bloc, MobX has a unidirectional data flow. Furthermore, MobX also uses the concept of a `Store` for its state and `Actions`. But different from Redux, more than one store can be used.

|           ![MobX Data Flow](https://i.imgur.com/jLbZ564.png)           |
| :--------------------------------------------------------------------: |
| _Figure 37: Data Flow of MobX from the Official Mobx.js Documentation_ |

`Actions` are fired via `Events`, which can be user interactions or reactions. Actions are the only way to change the `State`. If `Computed Values` are derived from the `State` they are updated. The `State` modification automatically triggers `Reactions` if specified.

MobX follows the mutable state principle.

#### Concepts

MobX consists of three core concepts: _(1) Observables, (2) Actions and (3) Reactions_ [[@CoreConcepts]](https://mobx.netlify.app/concepts).

| ![MobX concepts](https://i.imgur.com/Go2v3hq.png) |
| :-----------------------------------------------: |
|           _Figure 38: Concepts of MobX_           |

`Observables` are the representatives of the reactive application state. This means that when the data of the `Observable` changes, it sends a notification to its _listeners_ (Observers).

`Computed Observables` are derived from `Observables`. They are based on the philosophy of MobX.

The `Application State` is the combination of `Observables` and `Computed Observables`. To be more precise, the application state is the combination of _core-state_ and _derived-state_, where `Observables` mirror the core-state and `Computed Observables` the derived-state.

An `Action` has to be used to change the data of an `Observable`. Therefore, similar to Redux, MobX uses the principle of a single source of truth.

`Actions` can be triggered by `events` from the user via user interaction or fired by a `Reaction`. An example, for a user-triggered action, is the tap of a button.

`Reactions` have a special place in the MobX implementation. They are not necessarily needed in an application when the application has no requirements to handle side effects.

Side effects are modifications of the state [[@ProgrammingLanguagesWhat]](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect). In Flutter, an example for a side effect, is the automatic navigation to a `Home` page after a successful login.

`Reactions` can also be used to fire `Actions` to start a specified process.

#### Implementation

For the implementation of the MobX example, three packages have to be downloaded:

1. mobx [[@MobxDartPackage]](https://pub.dev/packages/mobx)
2. flutter_mobx [[@FlutterMobxFlutter]](https://pub.dev/packages/flutter_mobx)
3. mobx_codegen [[@MobxCodegenDart]](https://pub.dev/packages/mobx_codegen)

The package `mobx` provides the concepts, logic, and interaction of MobX to the project.

The package `flutter_mobx` provides access to the Observable widget. This widget can be used to listen to Observables and rebuild automatically after the observables have been mutated.

The package `mobx_codegen` provides annotations that can be added to the MobX code to reduce the amount of boilerplate needed. The added annotations are:

- @observable
- @computed
- @action

As usual, the code implementation will be separated into the application layer and presentation layer for the weather function.

##### Application Layer

To be able to use `mobx_codegen`, the `WeatherStore` class needs to be mixed with the `Store` class. With the help of the `Store Mixin`, the `WeatherStore` is treated as a store, and the annotations can be used.

```dart
...
part 'weather_store.g.dart';

/// Helps to represent the state of the WeatherStore
/// for network requests.
enum StoreState { initial, loading, hasData, hasError }

/// Used in MobX to manage the state of weather related data.
@lazySingleton
class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore({
    @required IWeatherFacade weatherFacade,
    @required ThemeStore themeStore,
    @required WeatherEntity weatherEntity,
  }) : super(
          weatherFacade,
          themeStore,
          weatherEntity,
        );
}

abstract class _WeatherStore with Store {
  final IWeatherFacade _weatherFacade;
  final ThemeStore _themeStore;
  _WeatherStore(
    this._weatherFacade,
    this._themeStore,
    this.weatherEntity,
  );

  /// A MobX observable future to help represent the state of the store
  @observable
  ObservableFuture<WeatherResponse> _weatherResponseFuture;

  /// A MobX observable for `WeatherEntity`.
  @observable
  WeatherEntity weatherEntity;

  /// A MobX computed value that computes the current `location` provided by
  /// the weather entity or `null` if none is present.
  @computed
  String get location {
    return weatherEntity.weatherResponse.getOrElse(() => null).title;
  }

  /// A MobX computed value that computes the `lastUpdated` property provided by
  /// the weather entity or `null` if none is present.
  @computed
  DateTime get lastUpdated {
    return weatherEntity.lastUpdated.getOrElse(() => null);
  }

  /// A MobX computed value that computes the current `state` of the store
  /// with the current state of weather response observable future.
  @computed
  StoreState get state {
    if (_weatherResponseFuture == null) {
      return StoreState.initial;
    }
    if (_weatherResponseFuture.status == FutureStatus.rejected) {
      return StoreState.hasError;
    }
    if (_weatherResponseFuture.status == FutureStatus.pending) {
      if (weatherEntity.weatherResponse.isSome()) {
        return StoreState.hasData;
      }
      return StoreState.loading;
    }
    return StoreState.hasData;
  }

  /// A MobX computed value that computes the current `WeatherCondition` provided by
  /// the weather entity.
  @computed
  WeatherCondition get weatherCondition {
    final Weather _weather = weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

  /// A MobX action that signals MobX to fetch new weather data.
  ///
  /// It updates [_weatherEntity] and [_weatherResponseFuture] to match the progress.
  ///
  /// After updating the progress it calls [weatherChanged] to signal MobX that the
  /// weather has been changed and the theme needs to be updated.
  @action
  Future getWeather(String location) async {
    weatherEntity = WeatherEntity.initial();
    _weatherResponseFuture = ObservableFuture(
      _weatherFacade.getWeatherForLocation(location: location),
    );
    final WeatherResponse _wr = await _weatherResponseFuture;
    weatherEntity = WeatherEntity(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
    _weatherChanged();
}
...
```
_Code snippet 42: MobX WeatherStore Class_

As most mutable state management solutions, MobX does not implement a way to handle _initial state_, and the developer has to decide how to handle it himself. In this example, an `enum` has been created to represent the state of the store.

##### Presentation Layer

The `WeatherStore` has to be injected into the Widget Tree to access it in the application. The injection is done with the help of the `provider` package inside the `WeatherApp` widget.

```dart
...
class MobxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeStore _themeStore = Provider.of<ThemeStore>(context);
    return MultiProvider(
      providers: [
        Provider<WeatherStore>(
          create: (context) => getIt<WeatherStore>(),
        ),
        Provider<SettingsStore>(
          create: (context) => getIt<SettingsStore>(),
        )
      ],
      child: Observer(
        builder: (_) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _themeStore.theme,
            home: WeatherPage(),
          );
        },
      ),
    );
  }
}
```
_Code snippet 43: MobxApp Widget_

After the `WeatherStore` has been injected, it can be accessed in any descendant in the tree.

In the method `_buildUI()` the `Observable` widget, provided by `flutter_mobx,` comes into action.

```dart
...
 WeatherStore _weatherStore;

...

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    _weatherStore = Provider.of<WeatherStore>(context);
    return Observer(builder: (_) {
      if (_weatherStore.state == StoreState.initial) {
        return _buildIdle();
      }
      if (_weatherStore.state == StoreState.hasError) {
        return _buildError();
      }
      if (_weatherStore.state == StoreState.loading) {
        return _buildLoading();
      }
      _refreshCompleter?.complete();
      _refreshCompleter = Completer<void>();
      return _buildWeather();
    });
  }
...
```
_Code snippet 44: MobX Weather Widget_

The `builder()` function of the `Observable` widget will be monitored by MobX. It tracks all observables and computed observables inside it, which, in this example, is the computed observable `state`. Whenever a tracked observable or computed observable changes, the widget gets rebuilt.

#### Advantages

- no unnecessary boilerplates
  - focus on the key features
  - more “magic”
- easy to learn
- easy to use

#### Disadvantages

- no mutation history for undo/redo
- more “magic”
  - a lot of logic happens in MobX internally
  - difficult to debug

### States Rebuilder

#### Introduction

The example has been build following the written tutorial _States Rebuilder - ZERO Boilerplate Flutter State Management_ by Reso Coder [[@StatesRebuilderZERO2019]](https://resocoder.com/2019/12/30/states-rebuilder-zero-boilerplate-flutter-state-management/).

`States Rebuilder` is a state management solution, that is purely written in Dart and comes with an integrated `Dependency Injection` approach.

States Rebuilder can be used as a mutable or immutable state management solution. Therefore, it follows both principles. In this example, it is used as a mutable state management solution.

#### Concept

The concepts of States Rebuilder are taken out of the _README.md_ of the official dart package [[@StatesRebuilderFlutter]](https://pub.dev/packages/states_rebuilder).

States Rebuilder implements the **Observer-Observable-Pattern**.

The Observer-Observable-Pattern is a design pattern in object-oriented software that specifies a distinct behavior. The behavior is a one-to-many relationship, where the change of the _one (Observable)_ notifies the _many (Observers)_, which triggers an automatic update [[@gamma1994design]](http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1).

`ReactiveModel` is the representation of the `Observable`, which multiple `Observers` can listen to.

##### ReactiveModel

`ReactiveModel` is an abstract class, which id wrapped around a `singleton`. A singleton “ensure a class only has one instance, and provide a global point of access to it” [[@gamma1994design]](http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1).

The `ReactiveModel` exposes specified getters to obtain the **last state** of the singleton (`state`, `value`) and getters to track **the state** of the singleton (`isIdle`, `isWaiting`, `hasError` and `hasData`). Furthermore, it exposes two methods to **mutate the state** of the singleton (`setState`, `setValue`).

The singleton can also be accessed as a simple model without the provided getters and methods of the ReactiveModel.

##### StateBuilder

_Is one out of four Observer Widgets_, which can be used to connect the UI to a `ReactiveModel`. The other three Observer Widgets are:

- WhenRebuilder
- WhenRebuilderOr
- OnSetStateListener

`WhenRebuilder` enforces the implementation of UI-response for each of the four state states, e.g., `isIdle`.

`WhenRebuilderOr`, in contrast to `WhenRebuilder`, enforces the implementation of a `builder()` function and optional parameters for `isIdle` etc.

`OnSetStateListener` is used to react to _side-effects_. It reacts to notifications from its defined `Observables` like any other `Observer` in States Rebuilder. It differs from the others by having a `child` parameter instead of a `builder` parameter. The difference in these parameters is that `child` will not be rebuilt when the `Observer` receives notifications from its `Observables`.

##### Injector

`Injector` is a `Stateful Widget` that is used to register and unregister `Models/ReactiveModels`, interfaces and flavors. It provides getters to access a registered instance in any descendant in the Widget Tree.

#### Implementation

For the example the package `states_rebuilder` [[@StatesRebuilderFlutter]](https://pub.dev/packages/states_rebuilder) has to be added to the pubspec.yaml file.

As usual, the code implementation will be separated into the application layer and presentation layer for the weather function.

##### Application Layer

In States Rebuilder, the model is usually named `store`. Therefore, in the example, the model for weather-related functionality is called `WeatherStore`.

Inside the `WeatherStore` class, no extension or mixin has to be implemented since a `ReactiveModel will wrap it`.

```dart
...
/// Used by the reative model in by states_provider.
class WeatherStore {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;
  WeatherStore(this._weatherFacade, this._weatherEntity);

  WeatherEntity _weatherEntity;
  WeatherEntity get weatherEntity => _weatherEntity;

  /// Fetches the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Future<void> fetchWeatherForLocation(String location) async {
    _weatherEntity = WeatherEntity.initial();
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
  }

  /// Refreshes the weather for given [location]. It handles the
  /// updating of the [WeatherEntity] and delegates the
  /// updating of the theme to the `ThemeStore`.
  Future<void> refreshWeatherForLocation(String location) async {
    final WeatherResponse _wr =
        await _weatherFacade.getWeatherForLocation(location: location);
    _weatherEntity = _weatherEntity.copyWith(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
  }

  /// Returns the `WeatherCondition` for the current weather.
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }
}
```
_Code snippet 45: States Rebuilder WeatherStore Class_

In the method `_weatherChanged()`, the method `setState()` provided by the `ReactiveModel` class is used to mutate the state of the store and imply a notification to its `Obse

##### Presentation Layer

To access the `WeatherStore` inside the application, it needs to be injected into the Widget Tree.

This injection takes place inside the `StatesRebuilderApp` widget a.k.a. `WeatherApp` widget.

```dart
...
/// Injects the widget tree with a `ReactiveModel` to manage
/// the `weather` state and `settings` state.
class StatesRebuilderApp extends StatelessWidget {
  final _themeStore = Injector.getAsReactive<ThemeStore>();
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject<WeatherStore>(
          () => WeatherStore(
            getIt<IWeatherFacade>(),
            getIt<WeatherEntity>(),
          ),
        ),
        Inject<SettingsStore>(
          () => SettingsStore(
            getIt<SettingsEntity>(),
          ),
        )
      ],
...
```
_Code snippet 46: StatesRebuilderApp Widget_

The `Injector` widget is used to get the instance of `WeatherStore` as `ReactiveModel`, to access the `WeatherStore` inside the `Weather` widget.

```dart
...
class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  final ReactiveModel<ThemeStore> _reactiveThemeStoreModel =
      Injector.getAsReactive<ThemeStore>();
  final ReactiveModel<WeatherStore> _reactiveWeatherStoreModel =
      Injector.getAsReactive<WeatherStore>();

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return OnSetStateListener<WeatherStore>(
      models: [_reactiveWeatherStoreModel],
      onData: (context, _) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
        return _reactiveThemeStoreModel.setState((store) =>
            store.mapWeatherConditionToTheme(
     _reactiveWeatherStoreModel.state.getWeatherCondition()));
      },
      child: Center(
        child: _buildUI(context),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return StateBuilder<WeatherStore>(
        models: [_reactiveWeatherStoreModel],
        builder: (context, reactiveModel) {
          return reactiveModel.whenConnectionState(
              onIdle: () => _buildIdle(),
              onWaiting: () {
                return reactiveModel.state.weatherEntity.weatherResponse
                        .isSome()
                    ? _buildWeather()
                    : _buildLoading();
              },
              onData: (store) {
                _refreshCompleter?.complete();
                _refreshCompleter = Completer();
                return _buildWeather();
              },
              onError: (_) => _buildError());
        });
  }
...
```
_Code snippet 47: States Rebuilder Weather Widget_

The `Observer` widget `StateBuilder` is implemented inside the method `_buildUI()`.

The `ReactiveModel` `_reactiveWeatherStoreModel` is registered as the only `Observable` with the parameter `models`. Therefore the UI gets rebuilt whenever `StateBuilder` receives a notification from `WeatherStore`.

Inside the `builder` parameter, the attribute `whenConnectionState` of `reactiveModel` (in this case, the `ReactiveModel` registered in `models`) is used to handle different connections states, e.g., `isIdle`, and build the corresponding UI.

#### Advantages

- all-in-one package
- easy to use
- easy to learn
- no unnecessary boilerplate

#### Disadvantages

- strongly coupled to its own `Dependency Injection`
  - all-or-nothing solution
- hard to master

# Evaluation

## Contents of the Chapter

- [Introduction](#introduction-23)
- [Evaluation Criteria](#evaluation-criteria)
- [Evaluation Results](#evaluation-results)
- [Recommendations](#recommendations)

## Introduction

I first want to remove the state management solutions `InheritedWidget` and `Vanilla BLoC` from the following evaluation.

The reason for this decision is that with `Provider`, a solution has been developed, which wraps the `Inherited Widget` and provides a simplified API. The same advantages come with `flutter_bloc` which provides the BLoC pattern with a simplified API and less overhead to worry about.

The state management solutions will be rated from a scale from 1-3. The rating value is defined as follows:

- 1 represents a rating where the criterion is somehow matched or not matched at all
- 2 represents a rating where the criterion is matched but does not “feel” good
- 3 represents a rating where the criterion is matched better than "normal"

Furthermore, I will add a comment to ratings of 1 and 3 to add more information to the score.

The chapter is separated into three sections: _(1) Evaluation Criteria, (2) Evaluation Results, and (3) Recommendations_.

## Evaluation Criteria

Contents of the Section

- [Introduction](#introduction-24)
- [Quality Attribute Criteria](#quality-attribute-criteria)
- [Personal Chosen Criteria](#personal-chosen-criteria)

### Introduction

The criteria that were chosen to evaluate the different state management solutions are a mixture of quality attributes and personally chosen criteria, which I will explain in the upcoming part.

### Quality Attribute Criteria

The quality attributes are taken from “_Characterizing Architecturally Significant Requirements_” by Chen et al. [[@chenCharacterizingArchitecturallySignificant2013]](http://ieeexplore.ieee.org/document/6365165/):

- Maintainability
- Extendability
- Modularity
- Reusability
- Testability

#### Maintainability

`Maintainability` is defined as “the ease with which a software system or component can be modified to correct faults, improve performance or other attributes, or adapt to a changed environment” [[@159342]](https://ieeexplore.ieee.org/document/159342).

To put it in simpler terms: The state management solution implementation is evaluated based on changes to improve the application and their effect on other components.

#### Extendibility

`Extendibility` is defined as “the ease with which a system or component can be modified to increase its storage or functional capacity” [[@159342]](https://ieeexplore.ieee.org/document/159342).

For the evaluation, the focus is on the functional capacity part. How easy is it to add more features with the state management solution?

#### Modularity

`Modularity` is defined as “the degree to which a system or computer program is composed of discrete components such that a change to one component has minimal impact on other components” [[@159342]](https://ieeexplore.ieee.org/document/159342).

This criterion will be similarly rated as maintainability since they modularity impacts the other quality attribute criteria.

#### Reusability

`Reusability` is defined as “the degree to which a software module or other work product can be used in more than one computer program or software system” [[@159342]](https://ieeexplore.ieee.org/document/159342).

For the evaluation, reusability will be evaluated by the reusability of the state management solution in non-Flutter applications.

#### Testability

`Testability` is defined as “the degree to which a system or component facilitates the establishment of test criteria and the performance of tests to determine whether those criteria have been met” [[@159342]](https://ieeexplore.ieee.org/document/159342).

This criterion will be evaluated based on the simplicity of writing unit tests.

### Personal Chosen Criteria

The personally chosen criteria are:

- Synergy
- Time to learn
- Ressources
- Amount of Boilerplate
- Side-effect handling
- Debugging

#### Synergy

In the context of the evaluation, `Synergy` is defined as how well the state management solution fits into the architecture. Furthermore, how well it interacts with the other packages used to develop the application.

#### Time-To-Learn

In the context of the evaluation, `Time-To-Learn` is defined as the time it takes the developer to learn the concepts of the state management solution and implement them successfully in an example application. This criterion is based on the time it took to learn enough about the state management solution to implement it myself.

#### Sources

`Sources` in the context of the evaluation is defined as the number of sources you will find when you search the Internet for examples and tutorials for the state management solution. Furthermore, if the SMS has documentation and how well the documentation is written.

#### Boilerplate

`Boilerplate` in the context of the evaluation is defined as how much boilerplate is being used by the SMS.

#### Side-Effect-Handling

`Side-Effect-Handling` in the context of the evaluation is defined as how well the SMS handles side-effects. To be more precise, does the SMS provide a guideline on how to handle side-effects, how easily it can be implemented, and how well it works.

#### Debugging

`Debugging` in the context of the evaluation is defined as how easy bugs can be debugged with the SMS. To be more precise, how difficult is it to track the bug inside the implementation of the SMS.

## Results

Contents of the Section

- [Introduction](#introduction-25)
- [Quality Attribute Criteria Results](#quality-attribute-criteria-results)
- [Personal Chosen Criteria Results](#personal-chosen-criteria-results)
- [Overall Results](#overall-results)

### Introduction

This section contains the results of the evaluation of the SMS. First, the results for the quality attribute criteria will be presented. Then the personal chosen criteria results. And finally, finished with the overall results will be displayed.

### Quality Attribute Criteria Results

#### Maintainability

| Criteria        | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Maintainability | 1               | 2                      | 2    | 2    | 2                | 2     |

_Table 01: Maintainability Scores_

- Stateful Widget: State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.

#### Extendability

| Criteria      | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Extendability | 1               | 2                      | 2    | 2    | 2                | 2     |

_Table 02: Extendability Scores_

- Stateful Widget: The extendability of the application with this SMS is provided. In maintainability, the need to pass down the state through all widgets in between makes it worse, which is the same case here.

#### Modularity

| Criteria   | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ---------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Modularity | 1               | 2                      | 2    | 2    | 2                | 2     |

_Table 03: Modularity Scores_

- Stateful Widget: State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.

#### Reusability

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Reusability | 1               | 1                      | 2    | 2    | 1                | 2     |

_Table 04: Reusability Scores_

- Stateful Widget: Flutter specific.
- ChangeNotifierProvider: Flutter specific.
- States Rebuilder: Flutter specific.

#### Testability

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Testability | 2               | 2                      | 3    | 2    | 2                | 3     |

_Table 05: Testability Scores_

- Bloc: Has the package `bloc_test` [[@BlocTestDart]](https://pub.dev/packages/bloc_test), which makes it easier to write tests for Blocs.
- Redux: Since most of the components in Redux are pure functions, they are easy to test without mocking.

### Personal Chosen Criteria Results

#### Synergy

| Criteria | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| -------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Synergy  | 1               | 2                      | 2    | 2    | 1                | 2     |

_Table 06: Synergy Scores_

- Stateful Widget: Breaks the principle of decoupling by having logic in the U.I.
- States Rebuilder: States Rebuilder is an all-in-one package where a solution for state management via Observer pattern and dependency injection via `Injector` is provided. In the architecture, the package combination of `getIt` and `injector` has been chosen to handle D.I., and State Rebuilder's dependency injection does not play well with the architecture's D.I. solution.

#### Time-To-Learn

| Criteria        | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Time\-To\-Learn | 3               | 3                      | 1    | 3    | 2                | 1     |

_Table 07: Time-To-Learn Scores_

- Stateful Widget: One of Flutter's three types of widgets, which everyone using Flutter had to learn.
- ChangeNotifierProvider: Endorsed by the Flutter Team and is easy to learn because of its popularity and tutorials
- Bloc: Even though Bloc's concept is well documented, it took me one day to understand the concepts and implement them in my first application.
- MobX: Easy to learn since MobX encapsulates most logic and handles the U.I. updates and notifications about state manipulations internally. The developer only has to implement the three mentioned packages in the MobX example and add decorators to the business logic.
- Redux: Without previous knowledge about Redux and it not being a popular solution for state management in Flutter, it took me between 2 and 3 days to implement it in the example application. Furthermore, I stopped the implementation of the example without fully following the concepts of Redux. As you may have noticed in the middleware to handle asynchronous calls, the reducers are dispatching more than one action. At that time, I knew that Redux is powerful, and to understand how to implement the notification to display a `ProgressLoadingIndicator`, it would take me even more time.

#### Sources

| Criteria | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| -------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Sources  | 3               | 3                      | 3    | 2    | 2                | 2     |

_Table 08: Sources Scores_

- Stateful Widget: Everyone comparing state management solutions includes an explanation about state management with a stateful widget. Furthermore, it is one of Flutter's three widget types and the simplest state management solution.
- ChangeNotifierProvider: Provider is a very popular package in Flutter, and there are many examples of how to use its ChangeNotifierProvider in an application.
- Bloc: Bloclibrary [[@Bloc]](https://bloclibrary.dev/#/) is one of the best documentation I have seen so far. It contains multiple examples of how to implement the bloc pattern in different scenarios and much more. Furthermore, there are tons of examples and tutorials on how to implement the bloc pattern.

#### Boilerplate

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Boilerplate | 2               | 2                      | 1    | 2    | 3                | 1     |

_Table 09: Boilerplate Scores_

- Bloc: To add a feature at least one event, one state and the bloc itself has to be added.
- States Rebuilder: ReactiveModel provides a lot of access to getters that are common when it comes to state management, e.g., idle state handling.
- Redux: The strict combination of concepts includes at least one action, one reducer, and one state to add a feature.

#### Side-Effect-Handling

| Criteria               | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ---------------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Side\-Effect\-Handling | 1               | 1                      | 3    | 2    | 3                | 2     |

_Table 10: Side-Effect-Handling Scores_

- Stateful Widget: No recommendation about how to handle side-effects.
- ChangeNotifierProvider: No recommendation about how to handle side-effects.
- Bloc: Emphasises a specific widget (BlocListener) to handle side-effects.
- MobX: I have to make an exception to add a comment for MobX for this criteria. Even though MobX uses reactions to handle side-effects, I was not able to add the completion of the RefreshIndicator or the notification of the ThemeStore that the weather has changed as reactions and make it work.
- States Rebuilder: Emphasises a specific Observer Widget to handle side-effects.

#### Debugging

| Criteria  | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Debugging | 2               | 2                      | 3    | 1    | 2                | 2     |

_Table 11: Debugging Scores_

- Bloc: The immutability allows for tracking state changes via history and enables redo/undo functionalities that come in handy when debugging. The tracking history is supported by a specific class in the bloc package.
- MobX: Since MobX is handling a lot of logic internally, it is difficult to track down a bug.

### Overall Results

| Criteria               | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ---------------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Maintainability        | 1               | 2                      | 2    | 2    | 2                | 2     |
| Extendability          | 1               | 2                      | 2    | 2    | 2                | 2     |
| Modularity             | 1               | 2                      | 2    | 2    | 2                | 2     |
| Reusability            | 1               | 1                      | 2    | 2    | 1                | 2     |
| Testability            | 2               | 2                      | 3    | 2    | 2                | 3     |
| Synergy                | 1               | 2                      | 2    | 2    | 1                | 2     |
| Time\-To\-Learn        | 3               | 3                      | 1    | 3    | 2                | 1     |
| Sources                | 3               | 3                      | 3    | 2    | 2                | 2     |
| Boilerplate            | 2               | 2                      | 1    | 2    | 3                | 1     |
| Side\-Effect\-Handling | 1               | 1                      | 3    | 2    | 3                | 2     |
| Debugging              | 2               | 2                      | 3    | 1    | 2                | 2     |
| Total                  | 18              | 22                     | 24   | 22   | 22               | 21    |

_Table 12: Overall Scores_

## Recommendations

Contents of the Section

- [Introduction](#introduction-26)
- [Variation in Priorities](#variation-of-priorities)
- [Recommendations](#recommendations-1)

### Introduction

I want to use this section to give you a personal recommendation on which state management solutions, in my opinion, are suited to be _the right tool for the jop._ This principle is something that you most likely have heard multiple times on different occasions. In this guide, the right tool for the job applies to the variation in priorities when it comes to applications, from examples to large-scale applications and their coverage.

I am going to start the section by pointing out the change of priorities and finish it with my recommendation, for example, small-scale, medium-scale, and large-scale applications.

### Variation in Priorities

As I have shown in [chapter 3](#results), state management solutions have different advantages and disadvantages based on the core principles of mutable and immutable state. Because of the distinct nature of these solutions, they vary in some criteria and therefore received different scores, as shown in [chapter 4](#evaluation).

The top score in the evaluation does not imply that it is automatically the _silver bullet_ for your application state management concerns. Furthermore, it changes from situation to situation.

Depending on whether you want to build an example, a small-scale application, a medium-sized application, or a large-scale application, you have different requirements and a shifted prioritization on criteria the application has to match.

For example, when it comes to showcasing examples, you want to build your example as quickly as possible and focus on the problem it solves at hand rather than using a SMS that makes it easy to handle side-effects or allow maintainability in the long run.

On the other hand, when it comes to large-scale application development, your focus shifts from a quick execution of your logic to the focus on the bigger picture, e.g., that the application is easy to maintain, easy to extend, and robust. You focus on quality attributes.

### Recommendations

#### Example

When you want to create a small example to showcase how a problem can be fixed or how something works, you usually priorities quick execution and simplicity over maintainability and other quality criteria. I mean, what is an example worth if not everyone can understand it without having to know what a Redux store works. Therefore my recommendation for state management solutions when it comes to creating examples has to be something every Flutter developer knows.

My recommendation for examples is: **Stateful Widget**

#### Small-scale Application

When your goal is to build a small-scale application, you priorities a state management solution that is easy to learn and minimizes the amount of boilerplate. Thus, your focus can be on the problem at hand. Furthermore, it should provide the opportunity to scale-up the application at a later point, which means that it also has to provide some level of extendibility.

My recommendations for small-scale applications are: **ChangeNotifierProvider & MobX**

#### Medium-scale Application

When your goal is to build a medium-scale application, you will find yourself in a dilemma where you have to decide between state management solutions that are easy to learn and SMS that bring long-term advantages. Therefore you will not be surprised to see a mix between my small-scale and large-scale recommendations.

My recommendations for medium-scale applications are: **Bloc, MobX, States Rebuilder, Redux**

#### Large-scale Application

When your goal is to build a large-scale application, your priorities shift from criteria like easy to learn and a minimal amount of boilerplate to long-term impacts like maintainability and other quality attributes as well as synergy with the application architecture and ease of debugging.

My recommendations for large-scale applications are **Bloc, Redux (and States Rebuilder)**

To explain my optional recommendation of States Rebuilder: The drawback with this state management solution is that because of its nature of state management and dependency injection in one package, you have to choose your other packages around States Rebuilder rather than the other way around. Nonetheless, when you want to build a large-scale Flutter application and are not fixed on specifics, it is a valid SMS.

You have reached the end of this chapter. The next chapter [_Conclusion_](#conclusion) is going to contain my personal evaluation of this guide and what I intend to do in the future.

# Conclusion

Contents of the Chapter

- [Introduction](#introduction-27)
- [Evaluation of the Guide](#evaluation-of-the-guide)
- [What is Planned for the Future?](#what-is-planned-for-the-future)

## Introduction

This chapter concludes the guide about the evaluation of state management solutions in Flutter. First, I will give my evaluation of the guide. _What did I accomplish? Was it as expected, or did it differ?_ Then I will finish this chapter with a section about the future of this guide and my future work.

## Evaluation of the Guide

The creation of this guide has been a voyage with its ups and downs. There were times when I thought that I would not finish it on time. Or times when I felt that I would finish too early and, therefore, had missed something. 

Looking back at the result, I can proudly say that I have finished in time and most definitely did not miss an important part. With around 60 pages exported as pdf without images, I have to admit that I went overboard with the guide's quantity. Nonetheless, I believe that the quality did not suffer regarding the quantity. 

All in all, I am pretty happy with the guide. I have accomplished my goal to provide recommendations for different application sizes and provided simple example implementations for each SMS in a DDD focused architecture.

## What Is Planned for the Future?

The second iteration of this guide will be coming in the future. It will include additional state management solutions, e.g., fish_redux [[@FishReduxFlutter]](https://pub.dev/packages/fish_redux), and compare it to the other results. 

Furthermore, this guide will be the fundament for my upcoming bachelor thesis. The thesis will compare bloc and states rebuilder as solutions for large-scale application development. The bachelor thesis plan is to add additional features to the SME-app and "scale it up." The bachelor thesis code will be accessible on my GitHub, and a summary of the thesis results will be included. 

The reason for the change from Git Wiki to a summary results in my wish to write the bachelor thesis as an academic paper. With the thesis, I hope to become a part of Flutter related literature to the academic community.

# References
