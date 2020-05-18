# Meta information

## What is the purpose of this guide?

The goal of this guide is to set an entry point for state management in Flutter.

This guide helps Flutter developers and Flutter development teams that have to decide which state management solution (SMS) to choose for their app to determine which SMS is most likely the right tool for the job.

It should provide a reference about which state management solution is likely the right one to choose to build an example, small-scale, middle-scale, or large-scale application.
Or at least show the advantages and disadvantages of each solution so that you can make an educated decision yourself.

## Who is this guide for?

This guide is for Flutter developers and Flutter development teams that are planning their next Flutter project.

It is for people who are overwhelmed by the amount of state management solutions provided by the community. For people who are searching for information about which SMS is in line with their requirements and why they should think about choosing it.

## How is this guide written?

This guide has been written for developers. So I want to keep it informal - from developer to developers. Throughout the guide, I will use the pronoun "we" and "you" to keep it that way.

## What resources were used to create this guide?

For the creation of this guide a collection of books, blog posts, journal article, official documentations and youtube videos has been used.

# 1. Basic knowledge

This chapter will cover the fundamental knowledge we will need to understand how Flutter works internally. It will include what state is in Flutter and how Flutter manages state in general.

## Flutter under the hood

Before we take a look at Flutter under the hood, we should get acquainted with some definitions.

So, what is Flutter?

| :closed_book: | Flutter | Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.[[@FlutterBeautifulNative]](https://flutter.dev/) |
| ------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |


From the official Flutter documentation we learn that Flutter is declarative.

> Flutter builds its user interface to reflect the current state of your app. [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative)

Therefore we can assume that Flutter follows the declarative programming paradigm. Declarative programming focuses on specifying the result of an operation rather than the computational processes it has to do to achieve the desired result. [@10.5555/895948] Let's take a look at the theory of declarative programming in practice.

```dart
void main() => Center(child: Text('Hello World'));
```

_Code snippet 01: declarative programming example_

Code snippet 1 shows an example of Flutter declarative nature. As you can see, a `main()` method is declared, which returns a `Center` Widget, which holds a `Text` Widget. These declarations are all we need to tell Flutter to build a text in the center of the screen. No specification of what it needs to do to get the text to the screen had to be written.

I have mentioned Widgets a couple of times in the previous paragraph. So let's take a look at what widgets are in the next section.

### It's all widgets

To explain what widgets are and their role in Flutter I will reference the official Flutter documentation. [[@TechnicalOverview]](https://flutter.dev/docs/resources/technical-overview)

In Flutter everything's a widget.

Widgets are the basic building blocks of an application's user interface (UI). Custom widgets can be composed of smaller widgets and the overall composition of all widgets represents the UI. The relationship of widgets is handled by the widget tree. The concept of the widget tree helps Flutter to layout the UI. Figure 01 is a visualization of how the user interface is build:

|                                                     ![equation](https://i.imgur.com/DoY8u5y.png)                                                     |
| :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| _Figure 01: How Flutter builds its UI_ [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative) |

Since widgets are the building blocks of the UI we can assume that they equal the right side of the equation.

They are blueprints for parts of the UI that hold a configuration for a specific state. [[@HowCreateStateless]](https://www.youtube.com/watch?v=wE7khGHVkYY)

Let's take a look at how Flutter defines widgets:

| :closed_book: | Widget | A widget is an immutable description of part of a user interface. [[@WidgetClassWidgets](https://api.flutter.dev/flutter/widgets/Widget-class.html) |
| ------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |


Typically a UI is mutable to reflect changes via for example user interaction. But how can Flutter reflecht changes in the user interface, when a widget is by definition immutable? The answer is simple. Flutter uses different types of widgets with different behaviour. Let's take a look at the different types of widgets.

### Types of Widgets

This section will cover the three different types of widget in Flutter. I will start with the Stateless Widget, then move on to the Stateful Widget and finish the section with the Inherited Widget.

#### Stateless widgets

To explain what a Stateless Widget is and how it works I will summarise the youtube video "How to Create Stateless Widgets - Flutter Widgets 101 Ep. 1". [[@HowCreateStateless]](https://www.youtube.com/watch?v=wE7khGHVkYY) It is the first video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

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

_Code snippet 04: createElement method [[@CreateElementMethodStatelessWidget]](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)_

In reaction to the createElement method the StatelessElement gets mounted on the Element tree. I will explain what the Element tree is later in section 1.3 "How does Flutter react to state changes?" so bear with me.

After the StatelessElement has been mounted it tells its referenced Stateless Widget, in this case the Center Widget, to execute its build method to build its children. The children in this case is only one child - MyStatelessWidget.

So to summarise these steps:

1. Stateless Widget gets called and mounted to the widget tree
2. The widget calls its createElement method
3. The created element gets mounted to the element tree
4. The created element tells its referenced widget to build its children via its build method.

Let's take a look at how this visualises for the example in code snippet 03:

First the Stateless widget Center gets build and therefore mounted to the widget tree (Figure 02).

| ![Stateless Widget example](https://i.imgur.com/TtDS96i.jpg) |
| :----------------------------------------------------------: |
|      _Figure 02: Stateless widget Center gets mounted_       |

Then the createElement method of Center is called and a StatelessElement is created and mounted to the Element tree (Figure 03).

| ![Stateless Widget example](https://i.imgur.com/PjUWwuq.jpg) |
| :----------------------------------------------------------: |
|          _Figure 03: StatelessElement gets mounted_          |

Then StatelessElement tells Center to build its children. In this case MyStatelessWidget which then gets created and mounted to the widget tree and every step gets repeated.

| ![Stateless Widget example](https://i.imgur.com/H1zNKQ2.jpg) |
| :----------------------------------------------------------: |
| _Figure 04: Stateless widget MyStatelessWidget gets mounted_ |

Figure 05 shows the final widget and element tree for the example.

| ![Stateless Widget example](https://i.imgur.com/EkS1VuT.jpg) |
| :----------------------------------------------------------: |
|           _Figure 05: Final widget & element tree_           |

With Figure 05 this part about the widget type Stateless Widget is finished. But what if we want to tell Flutter to display a different text than "Hello World"? This question will be answered in the next part which introduces the next widget type - Stateful Widget.

#### Stateful Widget

To explain what a Statelful Widget is and how it works I will summarise the youtube video "How Stateful Widgets Are Used Best - Flutter Widgets 101 Ep. 2". [[@HowStatefulWidgets]](https://www.youtube.com/watch?v=AqCMFXEmf3w&t=0s) It is the second video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

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

| ![Statelful Widget example](https://i.imgur.com/eqGJ23O.png) |
| :----------------------------------------------------------: |
|   _Figure 06: ItemCounter gets mounted to the widget tree_   |

Then the widgets createElement() method is being called which creates an StatefulElement that gets mounted to the element tree.

| ![Statelful Widget example](https://i.imgur.com/sohHp40.png) |
| :----------------------------------------------------------: |
|  _Figure 07: StatefulElement gets mounted to element tree_   |

Then the created Element tells the Stateful Widget to create a State Object for the element.

| ![Statelful Widget example](https://i.imgur.com/VGSe2EJ.png) |
| :----------------------------------------------------------: |
|    _Figure 08: State Object created for Stateful Element_    |

Finally, the element uses the state object to build the children of the widget.

| ![Statelful Widget example](https://i.imgur.com/Rs3S2lw.png) |
| :----------------------------------------------------------: |
|        _Figure 08: Finished widget and element tree_         |

As you have noticed the steps to add a widget to the widget & element tree are the same as for a Stateless Widget. Only the state object is an additional step.

Now let's take a look at how the widget and element tree react to the screen being tapped which calls the `setState()` method as seen in code snippet 05.

When the `setState()` method is called the callback inside the method increases the value of `count` from 0 to 1.

| ![Statelful Widget example](https://i.imgur.com/2QpvHsW.png) |
| :----------------------------------------------------------: |
|              _Figure 09: Count value increased_              |

The call of the `setState()` method triggers the Stateful Widget to mark itself as dirty. When an element is marked as dirty it signals Flutter to rebuild the widget it is referencing. Since the widget itself (ItemCounter) is still the same Flutter can reuse this widget to increase performance. Then Flutter continues the rebuild with the widgets children. A new text widget is being created with the count value of 1.

| ![Statelful Widget example](https://i.imgur.com/1ge3XR2.png) |
| :----------------------------------------------------------: |
|           _Figure 10: New child widget gets build_           |

Now since the newly created text widget and the old widget are not the same, Flutter removes the old text widget and mounts the new text widget in its place.

| ![Statelful Widget example](https://i.imgur.com/v1NV0V1.png) |
| :----------------------------------------------------------: |
|           _Figure 11: Child widget gets exchanged_           |

Since the new child widget is of the same widget type as the old child widget (widget type Text) the Stateless Element of the old widget can be reused.

| ![Statelful Widget example](https://i.imgur.com/LkfidRC.png) |
| :----------------------------------------------------------: |
|     _Figure 12: Widget & element tree have been rebuild_     |

This sums up what happens with the widget and element tree when the element is marked as dirty via the state objects `setState()` method. Now let us take a look at what happens with the trees when the `ItemCounter` widget gets exchanged.

In this example the old ItemCounter widget gets removed and a new ItemCounter widget with the name attribute "Dan" has been created to take its place.

| ![Statelful Widget example](https://i.imgur.com/RvZ5BMB.png) |
| :----------------------------------------------------------: |
|       _Figure 13: Old ItemCounter Widget gets removed_       |

After the new ItemCounter has been mounted to the widget tree Flutter walks through the same steps as before. First it checks the widget type to decide if it can reuse parts of its elememt tree. Since it is also of type ItemCounter the Stateful Element can be reused.

|              ![Statelful Widget example](https://i.imgur.com/RvZ5BMB.png)              |
| :------------------------------------------------------------------------------------: |
| _Figure 14: New ItemCounter Widget has been mounted and Stateful Element gets reused._ |

(Note that the state object is also being reused!)

Then the children are being rebuild.

| ![Statelful Widget example](https://i.imgur.com/LV0Kul8.png) |
| :----------------------------------------------------------: |
|   _Figure 15: New ItemCounter Widget children gets build._   |

The newly build child takes the place of the old child in the widget tree and since they are of the same widget type the Stateless Element can be reused.

|           ![Statelful Widget example](https://i.imgur.com/y15vpxH.png)           |
| :------------------------------------------------------------------------------: |
| _Figure 16: Widget & element tree has been updated with new ItemCounter Widget._ |

This sums up how the widget and element tree react to the ItemCounter Widget getting exchanged.

In this part I have explained what a Stateful Widget is and how it is used to update the UI. The next part is about Inherited Widgets the last type of widgets used in Flutter and the last part of this section.

#### Inherited Widget

The Inherited Widget is the third and last type of Widgets I will talk about.

To explain what an Inherited Widget is and how it works I will summarise the youtube video "Inherited Widgets Explained - Flutter Widgets 101 Ep. 3". [[@InheritedWidgetsExplained]](https://www.youtube.com/watch?v=Zbm3hjPjQMk&list=PLOU2XLYxmsIJyiwUPCou_OVTpRIn_8UMd&index=4) It is the third video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

When working with widgets in Flutter it can get cumbersome pretty quickly when a deeply nested child widget needs to access data from an ancestor. The more widgets are in between the ancestor with the data and the child that needs to access the data the more cumbersome it gets as seen in Figure 17.

|                 ![Inherited Widget example](https://i.imgur.com/wFAt9A7.png)                 |
| :------------------------------------------------------------------------------------------: |
| _Figure 17: Widget tree where child that needs data from ancestor and data are highlighted._ |

To provide the highlighted child widget with the data of an ancestor the data has to be passed down through the widgets in between even though they may not need access to the data.

This is where Inherited Widgets can help. They are widgets that can be accessed from any descendant in the widget tree as highlighted in Figure 18.

| ![Inherited Widget example](https://i.imgur.com/GaoNGIW.png) |
| :----------------------------------------------------------: |
|       _Figure 18: Widget tree with Inherited Widget._        |

To access the Inherited Widget the BuildContext is used.

| :closed_book: | BuildContext | The build context handles the location of the widget in the tree. [@BuildContextClassWidgets] |
| ------------- | ------------ | --------------------------------------------------------------------------------------------- |


An example of an Inherited Widget you should be familiar with is Theme. Theme as all Inherited Widgets can be accessed with its static method `of(context)` as seen in code snippet 07:

```dart
...
	@override
	Widget build(BuildContext context){
	...
		final ThemeData _theme = Theme.of(context);
	...
}
```

_Code snippet 07: Example how Theme can be accessed._

With this part the section about types of widgets in Flutter is finished. The next section will cover what state in Flutter is.

## What is state?

This section will cover what state in Flutter is. All the information in this section is taken from the official Flutter documenation.

So, to start this section let's take a look at the official definition of state in Flutter.

### Definition

| :closed_book: | State | Whatever data you need in order to rebuild your UI at any moment in time. [@DifferentiateEphemeralState] |
| ------------- | ----- | -------------------------------------------------------------------------------------------------------- |


To remind you about its impact on Flutter I want to remind you about how Flutter builds its UI with Figure 01:

|                                                     ![equation](https://i.imgur.com/DoY8u5y.png)                                                     |
| :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| _Figure 01: How Flutter builds its UI_ [[@StartThinkingDeclaratively]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/declarative) |

Now let's dive deeper into state in Flutter. It can be divided into ephemeral state and application state.

### Ephemeral state

Ephemeral state is specified as mutable data which is only relevant to the widget holding this configuration. It is also called local state and can be implemented using a state object of a Stateful Widget as seen in Section 1.1 It's all widgets.

### Application State

Application state in constrast to ephemeral state is data that is shared by mutliple widgets, e.g. user data.

### Decision help

When working with state in Flutter there is no clear-cut rule about which type of state you should use. The documentation contains a decision help when it comes to decide which type of state you should use which is shown in Figure 19:

| ![decision help](https://i.imgur.com/5ifKgCM.png) |
| :-----------------------------------------------: |
|            _Figure 19: Decision help_             |

Don't worry to much about what kind of state to use since it most definitely will change over time and you can simply change it afterwards.

This part is the finish of the section about state in Flutter. The next section will cover how Flutter reacts to state changes internally.

## How does flutter react to state changes?

In the previous section about widgets I have covered the widget types Stateless widget and Stateful widgets and how Flutter handles them with the use of the widget tree and the element tree. This has been the way Flutter has been working internally in 2018, when the youtube video series "Widget 101" has been uploaded by the Flutter team. Since then Flutter has evolved and so has the way Flutter handles widgets internally. In 2019 during the Google Developer Days China the Flutter team gave a talk about how Flutter renders widgets and uploaded the talk to youtube.

So to answer the question "How does Flutter react to state changes" I will use the content provided by the video "How Flutter renders Widgets" from the talk by the Flutter team. [[@HowFlutterRenders]](https://www.youtube.com/watch?v=996ZgFRENMs)

Since 2018 the way Flutter works internally has evolved. Additionally to the widget and element tree Flutter now uses a tree of RenderObjects. These trees are the three core concepts of Flutter.

They are deeply connected and all have different responsibilities as seen in Figure 20:

| ![the three trees](https://i.imgur.com/gzZ6cVw.png) |
| :-------------------------------------------------: |
| _Figure 20: The three concept of trees in Flutter_  |

You will notice a clear separation of concerns where each tree has its own job in Flutter.

The Widget tree contains widgets that as mentioned earlier hold the configuration for a piece of the UI. Furthermore, a widget "describes the configuration for an Element." [[@WidgetClassWidgets]](https://api.flutter.dev/flutter/widgets/Widget-class.html)

The Element tree contains elements that represent an actual piece of the UI. In Flutter widgets are the blueprint for an element, thus,“an instantiation of a Widget at a particular location in the tree.”[[@ElementClassWidgets]](https://api.flutter.dev/flutter/widgets/Element-class.html) and what the user actually can see on the UI. Furthermore, the element is the manager of the UI by holding a reference to its widget in the widget tree and render object in the element tree and managing the communication with Flutter to rebuild the UI if needed.

The RenderObject tree contains Render Objects which handle sizes, layout and painting [[@RenderObjectElementClassWidgets]](https://api.flutter.dev/flutter/widgets/RenderObjectElement-class.html) of the element on the UI.

If you remember the section about Stateful widget, I have covered how the widget and element tree react to changes. Now lets take the example Widget `Foo` from Figure 21 and extend our knowledge to include the RenderObject tree.

|   ![Foo example](https://i.imgur.com/LfP2EBW.png)    |
| :--------------------------------------------------: |
| _Figure 21: The three trees with example Widget Foo_ |

The first action Flutter takes when the `Foo` widget gets called is the same. It creates an element, to be more precise a RenderObjectElement [[@RenderObjectElementClassWidgets]](https://api.flutter.dev/flutter/widgets/RenderObjectElement-class.html), in this case the FooElement which the Framework mounts to the element tree. When an element is mounted to the element tree the element asks the widget to create a Render Object, in this case RenderFoo. After RenderFoo has been created the Render Object gets mounted by the framework onto the RenderObject tree.

Now we have covered how Flutter reacts when it is told to build a part of the UI with a widget. Let's take a look at how the three trees react to changes with the next example:

In this example we have a RichText widget which has been mounted to the widget tree by the Framework and the corresponding element and Render Object as seen in Figure 22.

| ![text example](https://i.imgur.com/iG7r4El.png) |
| :----------------------------------------------: |
| _Figure 22: The three trees when state changes._ |

The first action that takes place is that a new RichText widget gets created which is supposed to replace the old RichText widget.

| ![text example](https://i.imgur.com/JaVvq9w.png) |
| :----------------------------------------------: |
|  _Figure 23: New RichText widget gets created._  |

At this point Flutter asks itself if it can reuse parts of the element and RenderObject tree. Therefore it uses the widgets `canUpdate()` method to check if it can reuse these parts.

```dart
static bool canUpdate(Widget oldWidget, Widget newWidget) {
  return oldWidget.runtimeType == newWidget.runtimeType
      && oldWidget.key == newWidget.key;
}
```

_Code snippet 08: canUpdate() method. [[@CanUpdateMethodWidget]](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html)_

Since the old widgets and new widgets `runtimeType` are the same, the framework can reuse the element and Render Object and replaces the old widget with the new one.

|     ![text example](https://i.imgur.com/HyvRcIJ.png)      |
| :-------------------------------------------------------: |
| _Figure 24: New RichText widget replaces the old widget._ |

As you've learned in the section about Stateful Widget the element now marks itself as dirty because the widget it references has been exchanged.

In response to the change the element calls the widgets `updateRenderObject()` method.

```dart
@protected
void updateRenderObject(BuildContext context, covariant RenderObject renderObject) { }
```

_Code snippet 09: updateRenderObject method. [[@UpdateRenderObjectMethodRenderObjectWidget]](https://api.flutter.dev/flutter/widgets/RenderObjectWidget/updateRenderObject.html)_

The Render Object gets updated and the result can be seen in Figure 25:

| ![text example](https://i.imgur.com/VmTyHT6.png) |
| :----------------------------------------------: |
|     _Figure 25: RenderObject gets updated._      |

This example covered the process of a single widget handled by Flutter with the widget, element and RenderObject tree. But don't worry, child widgets it is the same principle.

This covers the section about "How Flutter renders Widgets" and you should hopefully have an understanding of how Flutter works under the hood. To finish up the next and last section of this chapter will cover what state management is and talk about the basic principle that is used in Flutter to manage state.

## state management

This section will cover what state management is and introduce the basic principle that is used to manage state in Flutter.

What is state management

State management in Flutter is the management of application state changes and making it accessable. This state is used by multiple widgets and has to be consistent throughout the application so that no error as a result of deferred state can occur. Furthermore, since Flutter has an unidirectional data flow from the root of the widget tree down to its children, how does the ancestor widget holding the application state get notified about state changes inside a child widget?

So how do we access application state from inside our widgets?

To access the app state it can be accessed through handing it down the widget tree. But the problem is, how do we pass data the other way around to an ancestor? And furthermore, how do different widgets from different subtrees access the same data? This is where the principle of lifting state up comes into play.

### principle of lifting state up

This principle of lifting state up describes that we have to find the lowest common ancestor of two widgets that need access to the state and pass the state down from this ancestor.

And this principle is being used in any state management solution you will find.

# Methodology (sets boundaries for part 3: Results)

In this chapter I walk you through the steps I made to be able to make an educated evaluation about state manamgement solutions.

## Challenge How can we manage to compare state management solutions to evaluate them?

To be able to compare the different state management solutions, we have to find a scenario in which they can be compared. For this purpose I’ve decided to implement each pattern in the same example application.
But this leads us to another problem: We don’t want to write the application every time from scratch or to be more precise rewrite big chunks of the application only to fit in a different SMS.

This is where the principle of orthogonality [@hunt2000pragmatic] is useful. This principle emphasises on the benefits of ~independence or decoupling~ of components. One of the benefits is that changes in one component do not affect any of the other. So in our case, if we change the state management solution it does not affect the other parts of our application.

Now I have shown how the amount of refactoring can be reduced with the principle of orthogonality. The next challenge is to find an architecture which follows this principle.

## Architectural Decision process

The first architecture I looked at is Clean Architecture by Uncle Bob.[@Martin17]

In Uncle Bob’s clean architecture he shows the benefits of a clean architecture where the focus is on use cases, the central business goals of the application.

He applied the principle of decoupling with two concepts: (1) the dependency rule and (2) the principle of dependency inversion.
The first concept states that source code dependencies are only allowed from outer layers to inner layers. The concept of dependency inversion introduces the use of interfaces on each layer to allow cross layer communication with the principle of contracts. [@hunt2000pragmatic]

A contract in programming is a definition of methods and attributes that everyone who wants to use mentioned methods and attributes has to follow. A contract does not more or less than what is written in it. In software development an example for a contract is an interface.

An image Uncle Bob's Clean architecture can be seen in Figure 26:

| ![clean architecture](https://i.imgur.com/moPHCbt.png) |
| :----------------------------------------------------: |
|            _Figure 26: Clean architecture._            |

With this onion architecture he highlights the importance of the separation of concerns. [[@SeparationConcernsSoftware2020]](http://nalexn.github.io/separation-of-concerns/)

The business logic represents the core of the onion and the outer layer represents details. Following the separation of the business logic in your system allows you to be flexible when it comes to adding details. He describes IO-Devices, databases, etc. as details which are not relevant for the business rules. Furthermore, Frameworks are tools that can help you with the development of your application and are therefore also details.

Uncle Bob points out a problem in the creational context of a software application. The problem is that when it comes to developing an application the tools we use, like Ruby, take away the focus of the most important thing in software development, the business rules and therefore how we architect our software.

If we take a look at state management in Flutter, we can assume that state management solutions, e.g. Redux, are only details added on top of the core business logic.

This problem is also addressed by Domain-Driven-Design (DDD). “The developers are too wrapped up with technology and trying to solve problems using technology rather than careful though and design. This leads developers to constantly chase after new ‘shiny objects’, which are the latest fads in technology”. [@10.5555/3055897]

Recognizing the same problem when it comes to state management in Flutter I’ve decided to take a look into DDD.

DDD is the second approach I took to plan my software example. It led me to the Flutter Europe 2020 conference talk about Strategic Domain-Driven-Design by Majid Hajian.[[@StrategicDomainDrivenDesign]](https://www.youtube.com/watch?v=lGv6KV5u75k&t=2260s) He proposes an architecture based on the principles of DDD. In his talk he emphasises on the advantages of Domain-Driven-Design and how it can be used to build scalable and maintainable software. During the presentation of his architecture he pointed out that at the layer where BLoC was used as a state management solution any other state can be used instead and how easily refactoring the aftermath will be.
This ease of changability is exaclty what I was looking for.

## Domain-Driven-Design

Domain-Driven-Design (DDD) is a software development approach introduced by Eric Evans in his book "Domain-Driven-Design: Tackling Complexity in the Heart of Software".[@evans2004domaindriven] DDD is based on the idea that to solve a problem defining the core domain is from utmost importance. The users of the software are the people who are familiar with the domain and the software is developed to solve a problem they face.

### Why DDD?

Evans answers this question as follows:

> Every software program relates to some activity or interest of its user. The heart of software is its ability to solve domain-related problems for its user. All other features, vital though they may be, support this basic purpose. When the domain is complex, this is a difficult task, calling for the concentrated effort of talented and skilled people.Developers have to steep themselves in the domain to build up knowledge of the business.

He recommends that the best way to do this is to make software a reflection of the domain which creates an ubiquitous language that the domain experts and developers can use.

### Domain-Driven-Design principles

In this part I will reduce the DDD principles to the ones used in our application.

#### Domain

A domain is an abstract area that defines a problem that needs to be solved. It can be compose of smaller subdomain.

#### Layered Architecture

DDD recommends to use a four-layered architecture where the domain logic is focused on one layer and not dependent on another layer. The other layers are the infrastructure layer, the application layer and the presentation layer.

#### Ubiquitous Language

DDD refers to the Ubiquitous language as a must. The idea is that the developer and the user need to speak the same language, and the developers use this language when coming up with class names, modules, variables etc. This way, the code reads as if a user is speaking.

#### Entities

Entities are domain objects that are uniquely defined by a unique identifier, and not by their attributes. They are commonly described as identities and the building blocks of the domain modelling. To put it in simpler words: Entities emphasise on the who or they are rather than the what they are.

#### Factories

They are used to create complex objects and ensure that the client has no knowledge of the internal details and functionality of that object manipulation. As advised by Evans, factories provide encapsulation.They also ensure standardisation of object instantiation and ensure the objects do not care about the creation themselves. This helps at keeping the domain clean and ensures boundaries are kept.

## Architecture

When looking into how to use the principles of DDD to plan my example application's architecture I’ve found the DDD series by Matt Rešetár a.k.a. Reso Coder.[[@FlutterFirebaseDDD2020]](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/) His series has been a big influence to me and how I've planned my architecture. In the next section I will present my adaptation of his architecture proposal for my domain.

But before getting into more detail about my architecture I want to emphasise on a common mistake made by the community when it comes to architecture.

### Architecture vs. state management vs. folder structure

A common mistake made by the community is the use of architecture, state management and folder structure interchangeably. Most Flutter developers should be familiar with the Flutter Architecture Samples repository [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples) by Brian Egan and contributors. As the name suggests this repository is supposed to contain different architecture samples of a Todo App. Unfortunately, this is not the case. It contains samples of how different patterns, e.g. Redux, can be implemented. The same misunderstanding comes with the folder structure of the project where it is mistaken for architecture. Folder structure helps to separate your files but not automatically includes an architecture.

Architecture is the topic of a top-level decision when it comes to the planning of the system. It specifies how the system will be implemented, what type of modules it has and how their relationship is. [[@hgracaArchitecturalStylesVs2017]](https://herbertograca.com/2017/07/28/architectural-styles-vs-architectural-patterns-vs-design-patterns/)
Examples for architecture are:

- layered
- service-oriented
- client-server
- etc.

To summarise, an architecture should set the outer boundaries of your application.

### My architecture

As you can see in Figure 27 the architecture is closely related to Reso Coders architecture proposal.

| ![application architecture](https://i.imgur.com/JeebkGs.jpg) |
| :----------------------------------------------------------: |
|            _Figure 27: Application architecture._            |

The main difference is my lack of a value object and the focus on the entities.

The presentation layer represents the dumb UI which is used to interact with the user. Depending on the state management solution some sort of ViewModel is used in the layer, e.g. events and states in flutter_bloc.

The application layer contains the state management solution. It is the only layer communicating with the presentation layer. It depends on entities to represent the domain's relevant data models and interfaces which are a common contract to communicate with the infrastructure layer.

The domain layer contains the core logic of the business. It is intended to be a standalone layer. Due to the simplicity of this example and the focus on the state management part in the application layer, I’ve decided to leave out ValueObjects.

The infrastructure layer contains repositories. It is the layer that communicates with APIs and other services, e.g. databases. To specify how to manage API calls, the repositories implement the provided interface of the domain layer and thereby fulfills its contract. The dependency to the models is used to specify data transfer objects [[@BlikiLocalDTO]](https://martinfowler.com/bliki/LocalDTO.html) which are used to transfer the raw data from the API/database into objects.

### Weather App Example

In order to evaluate multiple state management solutions I had to find a way to compare them. For this purpose I choose to build an app with predefined functionalities. This sets a goal to achieve and requirements which the SMSs had to fulfill. By having an app with predefined functionalities/requirements the state management solutions can directly be compared in a specified scenario.

Since I want to focus on the SMS part I don’t want to spend a lot of time in planning an application. So I have chosen to use the Weather App build in the tutorial by Felix Angelov as my foundation. [[@WeatherBloc]](https://bloclibrary.dev/#/flutterweathertutorial)
The reason for this example app is that I have started the project with previous knowledge about the flutter_bloc [[@FlutterBlocFlutter]](https://pub.dev/packages/flutter_bloc) package which was also created by Felix. And furthermore, because I like the app’s UI.

Take a look at the .gif of the weather app at bloclibrary [[@Bloc]](https://bloclibrary.dev/#/) to get a first glimps at what will be build:

| ![weather app](https://i.imgur.com/cgB1wse.gif) |
| :---------------------------------------------: |
|         _Figure 28: Weather app .gif._          |

From the .gif we can take the four key features our application offers:

1. Fetch weather from an API on the search page
2. Update the app theme to match the weather condition
3. Toggle the temperature measurement unit on settings page
4. Refresh the weather by using a pull down gesture on the weather page

These four features have to be implemented by each state management solution including their side effects [[@ProgrammingLanguagesWhat]](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect) like the loading indicator when weather data is being fetched.

Since I already knew how to implement the BLoC pattern with the help of flutter_bloc I’ve decided to start the evaluation process by rewriting the example app to use Flutter’s own state management solution - stateful widgets. From that point forward the rewritten example app, in this context vanilla app, has been used as a foundation to rewrite the application using a different state management solution.

A simplified version of our example apps widget tree can be seen in Figure 29:

| ![weather app widget tree](https://i.imgur.com/uM2ab31.jpg) |
| :---------------------------------------------------------: |
|            _Figure 29: Weather app widget tree._            |

The application consists of three screens: (1) WeatherPage, (2) LocationSearchPage and (3) SettingsPage.

### Additional packages that will be used

Before I finish this chapter I want to mention some additional packages that were used to create the examples. These packages are:

- Freezed [[@FreezedDartPackage]](https://pub.dev/packages/freezed)
  - Generates code to help to deal with immutable classes and provides a simple API to use.
- Injectable [[@InjectableDartPackage]](https://pub.dev/packages/injectable)
  - a convenient code generator for the get_it package
- GetIt [[@GetItDart]](https://pub.dev/packages/get_it)
  - "Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App"
- Dartz [[@DartzDartPackage]](https://pub.dev/packages/dartz)
  - adds functinonal programming principles to dart
- build_runner [[@BuildRunnerDart]](https://pub.dev/packages/build_runner)
  - a build system to generate dart files
- injectable_generator [[@InjectableGeneratorDart]](https://pub.dev/packages/injectable_generator)
  - a generator to create code for injectable related annotations

The use of these packages is influence by Reso Coder's DDD example and provide our application with a criteria to evaluate with: "How does the state management solution work with the other packages used by the application".

This covers the methodology chapter. The next chapter covers the results of the implementation.

# Results

This chapter will show the results I have collected after the implementation of each state management solution in the example app. The chapter is structure as follows:

- The first section will present the two different patterns each state management solution is build upon
- The second section contains the implemented state management solutions and how they are implemented in the architecture
- The third and last section will cover the evaluation of the SMS. This section will cover the criteria that we chosen to evaluate the SMS, the result of the SMS and my personal recommendation on which state management solution is useful when it comes to developing large-scale applications, etc.

## Patterns in state management solutions (mutable/immutable)

As you’ve noticed by now state management is a hot topic in the Flutter community. Therefore it is not surprising that a lot of people try to provide valid information about state management.
In his article “State Management Explained” Reso Coder did a great job in explaining the core principles of state management approaches.
In the following part I am going to summarise his article:

State management solutions can be divided into one out of two principles:
(1) mutable state and (2) immutable state.

Mutability is specified by its characteristic that object values can change over time.[[@Mutable]](https://developer.mozilla.org/en-US/docs/Glossary/Mutable)
Immutability on the contrary is defined by its characteristic that object values cannot be changed after its initialising. [@JavaConcurrencyInPractice]

Mutable state management solutions are categorised by their lack of separation of concerns and the loose of beneficial immutable state management concepts for state history to achieve an easy undo/redo.
The lack of separation of concerns can be seen in the following code snippet of the mobs example:

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

_Code snippet 10: SettingsStore in MobX example._

The code snippet illustrates the collection of state data and state mutating methods in a single file. This use of a file can get bloated pretty quickly the more complex the subdomain is. To approach this problem with a solution you can split the file into multiple files and annotate them as “parts”. But a problem with this approach is the non present best practice which could leave you with confusion.
Mutable state management also requires to find a solution to handle initial or empty state which is in most cases a decision between null checks in the UI or creating a state enum to handle the states. This approach comes closer to she clean separation in immutable solutions like bloc.
They last disadvantage is the difficult challenge to manage the states history. If we would have a store with more data than settingsEntity we would find correlating methods to mutate each data property. Since we then have different data that can change over time without the change of other data properties it gets much more difficult to track these changes.
On the other hand mutable state management solutions shine with their lack of boilerplate code and ease to learn and implement.

Immutable state management solutions in contrary to mutable solutions tackle each the three disadvantages.

The following code snippets show how the immutable state management solution Bloc addresses each disadvantage.

```dart
...
@freezed
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

_Code snippet 13: SettingsBloc in flutter_bloc example._

The separation of concerns is achieve by the three concepts of bloc: (1) events, (2) states and (3) Bloc.

Each concept has its own concern. Events are triggered when the user interacts with the UI and signals the bloc that the UI needs to update. States are representations of the UI. Blocs are the glue in the middle between events and states where the business logic of a bloc lives. The concern of the bloc is to map each event to its counterpart state.
As you can see in snippet X of the bloc class, the disadvantage of the initial state is addressed by providing an initial state out of the box.

The last disadvantage can be addressed by another class of the bloc package Transition [[@BlocLibraryDart]](https://pub.dev/documentation/bloc/latest/bloc/bloc-library.html). This class consist of the currentState, the event which was added, and the next state. A transition occurred whenever an event is added and after it has been handled by mapEventToState but before the states gets updated.
Another advantage is that with the clear separation of concerns the testability of these components is easier.

Even though immutable state solutions address the disadvantages of mutable state solutions they come with the drawback of boilerplate. Even the simplest function implemented in Bloc requires quite a lot of overhead.

Each example consist of 5 paragraphs:

- (1) Introduction,

- (2) mutable/immutable,

- (3) pattern/concept,

- (4) code implementation in app,

- (5) benefits/challenges/outcomes

## Examples

### Stateful Widget

In this example I am going to show you how to use the stateful widget option to manage your application state. Stateful widget is one of Flutters three widget types. The implementation of this example is inspired by Flutter architecture samples [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples).

This solution mutates the application data and then tells the UI to update. Therefore it can be categorised to the mutable state management solutions.

#### Concept

In chapter 1 I have explained how stateful widgets work in detail. Therefore I am keeping the explanation short in this chapter and advice you to revisit chapter one if you encounter any problems.
Whenever you change data and want the UI to rebuild you have to call the setState method of the corresponding state object which signals the UI to rebuild.

#### Implementation

Do you remember the principles of lifting state up? It is the key principle to manage app state with stateful widgets in Flutter. The common lowest ancestor in this example is the WeatherApp itself because we have to update the theme set in MaterialApp to display weather changes. You can see how this looks like in our widget tree in Figure 30.

| ![Stateful example widget tree](https://i.imgur.com/E0CQYoz.jpg) |
| :--------------------------------------------------------------: |
|   _Figure 30: Simplified Stateful widget example widget tree._   |

To keep the code as lean as possible in the UI I have create the AppState class which handles the state changes. This class finds its place in the application layer.

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

_Code snippet 14: AppState class in application layer._

To connect our state management solution to the UI in a lean way, we are using the AppStateContainer. It can be described as a ViewModel which contains a reference to our AppState class and methods that change our data and call the state’s setState method. These functions trigger the stateful widget to rebuild its children and are a reference is passed down the widget tree.

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

So if we need to access the state and a method to change the state we have to pass both down the widget tree. The following code snippet that shows the content of our weather page:

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

_Code snippet 16: Weather widget in presentation layer_

As you can see in the code snippet we have passed our app state and our refresh method down the widget tree into the Weather widget. In the method `_buildUI()` we are accessing the app state to determine which content to build. Further down the snippet when we implement the RefreshIndicator widget you’ll find our refresh method getting assigned.

Advantages:

- very easy to understand and implement
- tightly coupled to the widget \* good for ephemeral state

Disadvantages:

- has to be passed down each widget in the widget tree from ancestor to child
- difficult to maintain due to previous point
- tightly coupled to widget \* mixes logic with UI and therefore breaks clean code principles [[@FlutterTutorialPros2019]](https://blog.codemagic.io/flutter-tutorial-pros-and-cons-of-state-management-approaches/)
- full tree is getting rebuild when data changes

### Inherited Widget

In this example I am going to show you how I used the inherited widget option to manage the application state. Inherited widget is one of Flutters three widget types.

This state management solution is an improvement to the stateful widget option. It removes the need to pass down the app state and state mutation methods by its nature of easily accessibility inside the widget tree.

The implementation of this example is inspired by Flutter architecture samples [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples), the official documentation for InheritedWidgets [[@InheritedWidgetClassWidgets]](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) and the YouTube video about Inherited Widgets in the Widgets 101 series [[@InheritedWidgetsExplained]](https://www.youtube.com/watch?v=Zbm3hjPjQMk&list=PLOU2XLYxmsIJyiwUPCou_OVTpRIn_8UMd&index=4).

As well as the stateful widget this one can be categorised to the mutable state management solutions.

#### Concept

In chapter 1 I have explained how inherited widgets work in detail. Therefore I am keeping the explanation short in this chapter and advice you to revisit chapter one if you encounter any problems.
The Inherited Widget sits above the lowest common ancestor and can be accesses in any descendant because of its nature.

#### Implementation

The Inherited Widget example is at first a bit complex and overwhelming, but don’t worry. We will walk through it together.

| ![Inherited widget example widget tree](https://i.imgur.com/LVUHn7C.jpg) |
| :----------------------------------------------------------------------: |
|      _Figure 31: Simplified Inherited widget example widget tree._       |

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

_Code snippet 16: AppStateContainer_

The code snippet above show the ViewModel - AppStateContainer.
It has the same relevance as in the previous examples with some minor changes. Whenever this widget is build, it wraps its child with InheritedAppStateContainer - our Inherited Widget - and passes itself down as data. So, whenever our ViewModel changes due to state manipulation, the Inherited Widget is rebuild.

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

_Code snippet 17: InheritedAppStateContainer_

The code snippet above shows the implementation of our InheritedAppStateContainer. It is the Inherited Widget in this example and provides the static method `of(context)` to access our ViewModel. The method `updateShouldNotify()` notifies widget that inherit data from this widget to rebuild.[[@UpdateShouldNotifyMethodInheritedWidget]](https://api.flutter.dev/flutter/widgets/InheritedWidget/updateShouldNotify.html)

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

_Code snippet 18: AppState class_

The code snippet above shows our implementation of the AppState class.

The Inherited widget allows us to access its data with its static `of(context)` method as seen in the following code snippet.

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

_Code snippet 19: Weather widget_

Advantages

- does not rely on third party libraries
- the amount of rebuild can be reduced by specifying conditions in the updateShouldNotify() method. For example, that only widgets related to the settings entity should rebuild.
- allows descendants to access data and methods without the need to pass it down

Disadvantages

- has been overly complicated during the first implementation
- tightly coupled to widget \* mixes logic with UI and therefore breaks clean code principles
- unnecessary complicated to implement
- full tree rebuilds when data changes

### ChangeNotifierProvider

This state management solution has been endorsed by the Flutter team at the Google I/O 2019. [[@PragmaticStateManagement]](https://www.youtube.com/watch?v=d_m5csmrf7I) Furthermore they show an example [[@SimpleAppState]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple) of how to use the provider [[@ProviderFlutterPackage]](https://pub.dev/packages/provider) package in combination with ChangeNotifier. [[@ChangeNotifierClassFoundation]](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)

The provider package by itself is no state management solution. Provider is a tool for dependency injection. It is a wrapper around the _Inherited Widget_.

Provider’s ChangeNotifierProvider [[@ChangeNotifierProviderClassProvider]](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html) class in combination with ChangeNotifier can be used to manage the state of an application.

This is a mutable state management solution.

#### Concepts

##### ChangeNotifier

ChangeNotifier can be extend or mixed in a model class to provide a change notification API. With the API the method `notifyListeners()` can be used which notifies its listeners that the state has been mutated.

##### ChangeNotifierProvider

ChangeNotifierProvider is a widget from the provider package which injects a ChangeNotifier into the widget tree and provides it to the descendants. ChangeNotifierProvider rebuilds descendants that depend on the ChangeNotifier whenever the method `notifyListeners()` inside the ChangeNotifier is called.

##### Consumer [[@ConsumerClassProvider]](https://pub.dev/documentation/provider/latest/provider/Consumer-class.html)

`Consumer<T>`is a widget from the provider package. It is used to access the instance of the corresponding `Provider<T>` and passes the value of the provider to its `build()` method. Consumer is a listener to the `ChangeNotifier` provided by the `ChangeNotifierProvider`. Whenever ChangeNotifierProvider receives a `notifyListeners` call, the consumer’s build function runs and rebuild the descendant Widget.

#### Implementation

For the implementation I’ve followed the blog post “Flutter Architecture — My Provider Implementation Guide” by Dane Mackier [[@mackierFlutterArchitectureProvider2019]](https://medium.com/flutter-community/flutter-architecture-provider-implementation-guide-d33133a9a4e8) as well as the example from the flutter documentation. [[@SimpleAppState]](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

Let’s take a look at the implementation. As always we take a look at the implementation of the state management solution inside the application layer and how it is accessed in the presentation layer.

##### Application Layer

WeatherNotifier is used as a ChangeNotifier for the weather logic in our application. It contains WeatherEntity which is our weather data. Furthermore it contains a reference to ThemeNotifier and the WeatherFacade interface.

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

_Code snippet 20: WeatherNofitifer inside application layer._

Whenever WeatherEntity changes due to the methods `fetchWeatherForLocation()` or `refreshWeatherForLocation()` the method `notifyListeners()` is called which signals our ChangeNotifierProvider to update the UI by telling its descendants to run their builder callback.

#### Presentation Layer

To access WeatherNotifier inside our presentation layer it needs to be injected with the help of ChangeNotifierProvider inside the lowest common ancestor.

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

_Code snippet 21: ChangeNotifierProviderApp widget in presentation layer._

After WeatherNotifier has been injected into the widget tree inside ChangeNotifierProvider, it can be accessed inside the weather Widget.

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

_Code snippet 22: Weather widget in presentation layer._

It is important to set the `listen` parameter inside `Provider.of<WeatherNotifier>` to false. Otherwise it tries to reassign WeatherNotifier whenever `notifyListeners` is being emitted.

Advantages:

- easy to implement
- almost no boilerplate
- simple

Disadvantages:

- difficult to keep track of state history
- no state that represents the current status of the notifier \* an enum has to be created and maintained
- you need to keep track when not to listen for `notifyListeners`

### Vanilla Bloc

The Bloc (**B**usiness **Lo**gic **C**omponent) pattern was first introduced at the Google I/O 2018.[[@BuildReactiveMobile]](https://www.youtube.com/watch?v=RS36gBEp8OI) So to explain this pattern I am going to keep it close to the information provided in the talk.
The Bloc pattern provides a reactive approach to handle state changes in Flutter. It is based on Streams [[@StreamClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/Stream-class.html) which are a core concept of asynchronous programming in Dart.[[@AsynchronousProgrammingStreams]](https://dart.dev/tutorials/language/streams) The Bloc takes in events, runs the needed business logic if necessary and outputs the resulting data.

The Bloc pattern can be used as a mutable or immutable state management solution. You can either add mutated data to the stream or a new data object. In this example the immutable approach is implemented.

#### Concept

To understand the concept of Bloc you’ll have to get familiar with the concept of streams in Dart.

| ![Stream concept](https://i.imgur.com/J4ohiiR.jpg) |
| :------------------------------------------------: |
|          _Figure 32: Concept of stream._           |

Think about water running through a rain pipe which you want to use to flush down toy soldiers from the roof. On your roof the at the on side of the pipe you have your _sink_. The sink is the location where your comrade puts in the little soldiers. At the other end of your rain pipe you want to _react_ to the toy soldiers that are being flushed down the pipe. To be able to react to the toy soldiers being flushed down, you use a strainer. But without clear communication you don’t know when a toy soldier is being flushed down the pipe. And you don’t want to stand there all day and waste your time. So you start to _listen_ to your comrade and start to place the strain as soon as he gives you a signal.

This example includes all the core principles of streams in Dart.

- StreamSink [[@StreamSinkClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/StreamSink-class.html) which is for event input
- Stream [[@StreamClassDart]](https://api.dart.dev/stable/2.8.2/dart-async/Stream-class.html) which is used for the data output

To put these concepts together you’ll need one more thing - the StreamController [[@StreamControllerClassDart]](https://api.dart.dev/stable/2.8.1/dart-async/StreamController-class.html) - which handles the input, output and more. The StreamController in our example is the rain pipe itself.

By default the StreamController only supports a single-subscription stream. To allow multiple listeners to subscribe you can use the StreamController.broadcast constructor.

| ![StreamController concept](https://i.imgur.com/w6cYnYQ.jpg) |
| :----------------------------------------------------------: |
|            _Figure 33: StreamController concept._            |

When the concepts of reactive programming are combined the result is the Bloc. Figure shows a widget tree and how a bloc works:

|                                     ![Bloc concept](https://i.imgur.com/Uter9X7.png)                                     |
| :----------------------------------------------------------------------------------------------------------------------: |
| _Figure 34: Image taken from the Google I/O 2018 [[@BuildReactiveMobile]](https://www.youtube.com/watch?v=RS36gBEp8OI)._ |

The light blue arrows indicate events that have been added by a widget to the StreamSink. These events are handled inside the bloc. The output is then emitted via a Stream. The widgets with the speaker icons are listening to a stream inside the bloc. As you can see by the purple arrow the orange widget is receiving data through a stream and can react to it.

#### Implementation

For the implementation of the bloc pattern I’ve adapted two tutorials: (1) Reactive Programming - Streams - BLoC [[@boelensFlutterReactiveProgramming]](https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/) and (2) Getting Started with the BLoC Pattern. [[@GettingStartedBLoC]](https://www.raywenderlich.com/4074597-getting-started-with-the-bloc-pattern)

When working with StreamControllers in Flutter we can run into a problem: Broadcast streams do not buffer events when there is no listener. [[@DartFlutterBad]](https://stackoverflow.com/questions/51396769/flutter-bad-state-stream-has-already-been-listened-to) Adding an initial value to the sink inside the bloc’s constructor won’t be possible anymore. And each bloc implementation is adding an initial value inside its constructor.

As a workaround for the problem I am recommending BehaviourSubject [[@BehaviorSubjectClassRx]](https://pub.dev/documentation/rxdart/latest/rx/BehaviorSubject-class.html) provided by rxdart. [[@RxdartDartPackage]](https://pub.dev/packages/rxdart)
A BehaviourSubject is a special StreamController which is by default a broadcast stream and sends the latest item added to the sink to new listeners. Therefore it also works without listeners which in our constructor case is from advantage.

Let’s take a look at how the weather data logic is implemented with the WeatherBloc.

To specify the types of events that can be added to the weather bloc sink, an interface - weather_event.dart - has been created. We specified `WeatherEvent.fetchWeatherForLocation` and `WeatherEvent.refreshWeatherForLocation` as events.

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

_Code snippet 23: WeatherEvent class._

Inside the WeatherBloc class the interface Bloc has been implemented.
This interface specifies that the method `dispose()` has to be added for each bloc. This has to be done to prevent memory leaks in the future.

```dart
/// An interface to implement a dispose contract for blocs to prevent memory leaks.
abstract class Bloc {
  void dispose();
}
```

_Code snippet 24: Bloc interface._

The WeatherBloc can be separated into two part:

1. StreamController, Streams, Sinks
2. Logic related methods

In the first part the _BehaviourSubject_ `_weatherEntityStateController` of type WeatherEntity is declared as well as getters for its _sink_ `_inWeatherEntity` and _stream_ `weatherEntity`. Additionally a the StreamController `_weatherEventController` for WeatherEvents is declared. As soon as the Bloc is created it starts to _listen_ to the stream inside `_weatherEventController`.

The second part contains the method `mapEventToState()`, which is used as a callback whenever a new weather event is emitted by the `_weatherEventController.stream`. Depending on the event we either call the method `fetchWeatherForLocation(location: event.location)` or `refreshWeather(location: event.location)` with the location inside the event as parameter.

The method `dispose()` has been overwritten and closes the StreamController inside weather bloc whenever the bloc is disposed of.

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

_Code snippet 25: WeatherBloc class._

In the UI the weather bloc is implemented inside the weather widget. We get a reference to the Bloc by using getIt. For the representation of the UI depending on the weather bloc state a StreamBuilder [[@StreamBuilderClassWidgets]](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) is used. StreamBuilder is a widget that takes in a Stream, in this case `_weatherBloc.weatherEntity` and builds the UI whenever a value is emitted by the stream. The new value is represented by an AsyncSnapshot.[[@AsyncSnapshotClassWidgets]](https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html) An AsyncSnapshot is a representation of the current state of the asynchronous data. Depending on the asynchronous data the UI is build.

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

_Code snippet 26: Weather widget in presentation layer._

Advantages:

- clear separation of concerns
  _ no business logic inside UI
  _ easier to test
- can be accessed from anywhere in the tree
- plays well with Flutters reactivity
- reduces the amount of builds compared to setState()

Disadvantages:

- reactive programming is not straightforward \* people have it difficult to understand reactive programming
- a lot of boilerplate
- the concepts take some time to get the head around

### Bloc with flutter_bloc

Bloc [[@BlocDartPackage]](https://pub.dev/packages/bloc) is a package developed by Felix Angelov. It extends the core principles of bloc and provides a simple API which reduces the amount of boilerplate code to work with Streams.

Additionally the package flutter_bloc [[@FlutterBlocFlutter]](https://pub.dev/packages/flutter_bloc) is used which provides a collection of widgets for Flutter to handle blocs.

It has been developed with three core values in mind: [[@WhyBlocBloc]](https://bloclibrary.dev/#/whybloc)

1. Simple
   - easy to understand and can be used by developers with varying skill levels
2. Powerful
   - help make amazing, complex applications by composing them of smaller components
3. Testable
   - easily test every aspect of an application so that we can iterate with confidence

Bloc is an immutable state management solution.

#### Concepts

To understand how Bloc differentiates from the vanilla bloc example we have to take a look at the two principles in this package.

##### Concept of Bloc [[@BlocBloc]](https://bloclibrary.dev/#/coreconcepts)

| ![Concept of bloc](https://i.imgur.com/cOtE6aE.jpg) |
| :-------------------------------------------------: |
|            _Figure 35: Concept of Bloc._            |

- Events \* Events are the input to a Bloc provided via interaction with the user interface.
- States \* States are the output of a bloc and represent a part of the application’s state. They are used inside the UI to build the representative UI state and redraw it when the state changes.
- Streams \* As previously explained in the vanilla bloc example, streams are a continuous flow of asynchronous data.
- Blocs \* Are the essential part of the pattern. They convert a stream of incoming event into a stream of outgoing states.

For more concepts likeTransitions and BlocDelegate visit bloclibrary.

##### Concepts of flutter_bloc [[@FlutterBlocBloc]](https://bloclibrary.dev/#/flutterbloccoreconcepts)

- BlocBuilder \* Is a widget which requires a bloc and a builder function. It is very similar to a StreamBuilder but with a simpler API and less amount of boilerplate needed. The builder functions needs to return a widget in response to the state. The builder function can be called multiple times.
- BlocProvider \* Is a widget that yses the provider [[@ProviderFlutterPackage]](https://pub.dev/packages/provider) package by Rémi Rousselet for its dependency injection to inject a bloc inside the widget tree and provide it to descendants.
- BlocListener \* Is a widget that is used to handle logic that should only happen once when the state changes. Such logic can be navigation. Its listener method is only called once for each state change in comparison to the BlocBuilder’s builder method which is called multiple times.
- BlocConsumer \* Is a widget which combines a BlocListener and a BlocBuilder with less amount of boilerplate.

For more concepts like MultiBlocProvider, MultiBlocListener, RepositoryProvider and MultiRepositoryProvider visit bloclibrary.

#### Implementation

Let’s walk through the implementation of the weather bloc inside the application layer and how it can be accessed in the presentation layer.

##### Application Layer

Inside the application layer the weather bloc is specified with its three essential concepts: (1) events, (2) states and (3) bloc.

Weather Event is an interface to specify two events:

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

_Code snippet 27: WeatherEvent class._

Weather State is an interface to specify the states our bloc can output which our UI can use to represent its state. It contains four states:

1. Initial
2. Loading
3. loadingFailure
4. Loaded (which contains a WeatherEntity)

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

_Code snippet 28: WeatherState class._

Inside our weather bloc class resides the logic of our weather functionality.
Each bloc contains a getter for the initial state which in our case returns `WeatherState.initial()`. Furthermore each bloc contains the method `mapEventToState(WeatherEvent event)` which is responsible to output a stream of `WeatherState` for the corresponding `WeatherEvent`. To keep the method `mapEventToState()` as lean as possible we delegate the logic when a `FetchWeather` event is emitted to the method `_mapFetchWeatherToState()`. Inside this method an asynchronous call is made and depending on the result either `WeatherState.loaded()` with a WeatherEntity or `WeatherState.loadingFailure()` is yielded. During the asynchronous call the WeatherState `WeatherState.loading()` is yielded to indicate that an asynchronous call is taking place.

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

_Code snippet 29: WeatherBloc class._

Not let’s take a look at how the bloc can be accessed in the UI.

##### Presentation layer

The first step to access the bloc is to use BlocProvider to inject an instance of the bloc to the widget tree. Since multiple blocs need to be injected at this level of the widget tree a MultiBlocProvider has to be used. The injection happens inside the weather app widget which in this example is named FlutterBlocApp.

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

_Code snippet 30: FlutterBlocApp widget._

Inside the weather widget the bloc is accessed by using the widget `BlocConsumer`. BlocConsumer is a simplified version of a BlocListener with nested BlocBuilder. In the listener callback the side effect to adapt the theme when the weather changes is being handled. When the weather changes which is represented by the WeatherState `Loaded` an event is added to the `ThemeBloc` which is accessed via `context.bloc<ThemeBloc>()`.
Inside the builder callback the corresponding UI representation for the states `LoadingFailure, Loading, Loaded` is specified.

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

_Code snippet 31: Weather widget in presentation layer._

- Advantages:

      	* unidirectional data flow
      	* simple API
      	* separation of concerns
      	* reusable
      	* implementation of initial state
      	* side effects handled by listeners

- Disadvantages:

      	* still a lot of boilerplate
      	* too much overhead for small examples
      	* takes time to understand

### Redux

For this example I’ve used the redux example of Brian Egan at flutter samples as a reference. [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples) The example uses the packages redux [[@ReduxDartPackage]](https://pub.dev/packages/redux) and flutter_redux.[[@FlutterReduxFlutter]](https://pub.dev/packages/flutter_redux) Redux is based upon three principles [[@Redux]](https://redux.js.org/introduction/three-principles):

1. Single source of truth
   - The global state of the application is stored in an object tree within a single store.
2. State is read-only
   - the only way to change state is to emit an action, an object describing what happened.
3. Changes are made with pure functions
   - To specify how the state is transformed by actions, you write pure reducers.

Redux is one of the immutable state management solutions. The state object is read-only and can only be changed by returning a new state object inside a reducer

#### Concept

##### Concepts of Redux

The explanation of the following context is taken from the redux example from flutter architecture samples by Brian Egan. [[@BrianeganFlutterArchitecture]](https://github.com/brianegan/flutter_architecture_samples)

###### State

Is an immutable Object that lives at the top of your Widget hierarchy within a `Store`. To create a new `State` an `Action` must be dispatched.

###### Store

Is passed down to all descendants via an `InheritedWidget` the `StoreProvider`.

###### Action

`Actions` will be picked up by a `Reducer`, which is a function that build and returns a new `State` based on the previous `State` and the `Action` that was dispatched.

###### Reducer

Are pure functions.

###### Middleware

`Middlewares` run in response to an `Action` that is dispatched and executed before the `Reducer`. This allows you to intercept an `Action` and fetch data in response.

###### Selector

To read data from the `State` use `selector` functions.

Let’s take a look at Figure to see Redux in action.

| ![Concept of Redux](https://i.imgur.com/YWH4pOa.jpg) |
| :--------------------------------------------------: |
|            _Figure 36: Concept of Redux._            |

The UI is a representation of the current state. The UI listens to events from the user and dispatches an action corresponding to the event. The action gets processed by a reducer. Since a reducer is a pure function it can not handle asynchronous calls. This is where the middleware comes into play. The middleware intercepts an action and can be used to process an asynchronous call. When the middleware is finished with the asynchronous call it dispatches a new Action which is being processed by a reducer. The reducer returns a new state object with the data provided by the action. With the new state object the UI rebuilds to represent that state.

##### Concepts of flutter_redux

###### StoreProvider

Injects the store into the widget tree and provides it to all descendants in need.

###### StoreConnector

A descendant Widget which gets the store from the nearest `StoreProvider` ancestor and converts the store into a `ViewModel`. Whenever the store emits a change event the Widget will be rebuild.

###### StoreBuilder

Passes the store down to a Widget’s builder function.

#### Implementation

Let’s walk through the implementation of Redux in the example. This walkthrough will cover the implementation inside the presentation layer as well as the implementation inside the application layer.

##### Application Layer

To keep it _lean_ only the weather relevant redux components are shown.

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

_Code snippet 32: AppState class._

To have a separation in concern inside the store, the app state consist multiple smaller state objects. For example WeatherState. This makes it easier to read.

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

_Code snippet 33: WeatherState class._

WeatherState is an interface that consists of two attributes: (1) WeatherEntity and (2) isRefreshing. The WeatherEntity contains data related to the weather whereas isRefreshing is a flag to mark if the weather data is being fetched or refreshed.

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

_Code snippet 34: WeatherActions class._

The interface WeatherActions specifies which types of actions can be dispatched to start a process to update the state. Since the state is read-only it can only be changed by an action and therefore all action need to be specified here.

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

_Code snippet 35: Weather middleware._

Since the functionalities to fetch the weather and refresh the weather require an API call they are asynchronous. Due to Redux concept that reducers are pure functions the action to fetch/refresh the weather data needs to be intercepted by a middleware. The middleware intercepts the action and makes the asynchronous call. Depending on the result of the asynchronous call a new Action is being dispatched which then gets processed by its responding reducer.

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

_Code snippet 36: App reducer function._

Reducers return a new state that represents the updated UI. Since we can have multiple app states the app state is represented by the result of a reducer. And since there are multiple reducers for different actions we have a collection of reducers, e.g. weatherReducer, which is assigned to weatherState.

###### Weather reducer

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

_Code snippet 37: Weather reducer functions._

`weatherReducer` is a collection of reducers related to weather.

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

_Code snippet 38: Weather state related selectors._

Sometimes it is necessary to access only single attributes from a state. This is where Selectors come into play. Selectors are pure functions that return the specified attribute.

##### Presentation Layer

To implement Redux to a Flutter application it needs to be initialised at the beginning of your application - the main. This is the result of its principle as single source of truth.

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

_Code snippet 39: Redux store initialization._

Let’s take a look at the weather widget:

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

_Code snippet 40: Weather widget._

Due to redux strict separation of concerns the ProgressLoadingIndicator had to be moved from the method `_buildUI()` to the widgets `build()` method. The `converter` callback from `StoreConnector` looks for the _store_ from the nearest `StoreProvider` and returns the `isLoading` attribute. The value of `isLoading` is then used to build either a ProgressLoadingIndicator or the UI.

In the method `_buildUI` we also use a `StoreConnector` to connect the UI to the Redux store. The `converter` callback returns the `WeatherState` which is used to determine which UI to build.

Advantages:

- clear separation of concerns
- single source of truth
- easy to test
- immutability

Disadvantages:

- very complex
- difficult to learn
- a lot of boilerplate
- simple functionalities require an overhead to be implemented

### MobX

This examples has been build with the help of Reso Coder’s written MobX tutorial. [[@FlutterMobXTutorial2019]](https://resocoder.com/2019/12/26/flutter-mobx-tutorial-transparent-reactive-state-management/)

> MobX is a battle tested library that makes state management simple and scalable by transparently applying functional reactive programming (TFRP). The philosophy behind MobX is very simple: _Anything that can be derived from the application state, should be derived. Automatically._ This includes the UI, data serialization, server communication, etc. [[@IntroductionMobX]](https://mobx.js.org//index.html)

Similar to Redux or Bloc MobX has a unidirectional data flow. Furthermore, MobX also uses the concept of a store for its state and actions. But in difference to Redux more than one store can be used.

|           ![MobX data flow](https://i.imgur.com/jLbZ564.png)            |
| :---------------------------------------------------------------------: |
| _Figure 37: Data flow of MobX from the official mobx.js documentation._ |

Actions are fired via Events which can be user interactions or reactions. Actions are the only way to change the State. If computed values are derived from the State they are updated. The State modification automatically triggers reactions if specified.

MobX is a mutable state management solution.

#### Concepts

MobX consists of three core concepts: (1) Observables, (2) Actions and (3) Reactions. [[@CoreConcepts]](https://mobx.netlify.app/concepts)

| ![MobX concepts](https://i.imgur.com/Go2v3hq.png) |
| :-----------------------------------------------: |
|          _Figure 38: Concepts of MobX._           |

Observables are the representatives of the reactive application state. This means that when the data of the observable changes it sends a notification to its listeners (Observers).

Computed Observables are derived from observables. They are based on the philosophy of MobX. The application state is the combination of Observables and Computed Observables. To be more precise application state is the combination of *core-stat*e and _derived-state_ where Observables mirror the core-state and Computed Observables the derived-state.

To change the data of an Observable an Action has to be used. Therefore similar to Redux MobX uses the principle of a single source of truth.

Actions can be triggered by events from the user via user interaction or fired by a Reaction. An example for a user triggered Action is the tap of a button.

Reactions have a special place in the MobX implementation. They are not necessarily needed in an application when the application has no requirements to handle side effects. Side effects are modifications of the state. [[@ProgrammingLanguagesWhat]](https://softwareengineering.stackexchange.com/questions/40297/what-is-a-side-effect) In Flutter an example for a side effect is the automatic navigation to the home page after a successful login.
Reactions can also be used to fire Actions to start a specified process.

#### Implementation

For the implementation of the MobX example three packages have to be downloaded:

1. mobx [[@MobxDartPackage]](https://pub.dev/packages/mobx)
2. flutter_mobx [[@FlutterMobxFlutter]](https://pub.dev/packages/flutter_mobx)
3. mobx_codegen [[@MobxCodegenDart]](https://pub.dev/packages/mobx_codegen)

The package mobx provides the concepts, logic and interaction of MobX to the the project.

The package flutter_mobx provides access to the Observable widget. This widget can be used to listen to Observables and rebuild automatically after the observables has been mutated.

The package mobx_codegen provides annotations which can be added to the mobx code to reduce the amount of boilerplate needed. The added annotations are:

- @observable
- @computed
- @action

As usual the code implementation will be separated into application layer and presentation layer for the weather function.

##### Application layer

To be able to use mobx_codegen the WeatherStore class needs to me mixed with the Store class. With the help of the store mixin the weather store is treated like a store and the annotations can be used.

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

_Code snippet 41: MobX WeatherStore class_

As most mutable state management solutions MobX does not implement a way to handle initial state and the developer has to decide how to handle it. In this example an enum has been created to represent the state of the store.

##### Presentation Layer

To access the weather store in the application it has to be injected into the widget tree. The injection is done with the help of the provider package inside the weather app widget.

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

_Code snippet 42: MobxApp widget_

After the weather store has been injected it can be accessed in any descendant in the tree.

In the method `_buildUI()` the Observable widget provided by flutter_mobx comes into action.

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

_Code snippet 43: MobX Weather widget_

The `builder` function of the Observable widget will be monitored by MobX. It tracks all observables and computed observables inside it which in this example is the computed observable `state`. Whenever a tracked observable or computed observable changes the widget gets rebuild.

Advantages:

- no unnecessary boilerplates
  _ focus on the key features
  _ more “magic”
- easy to learn
- easy to use

Disadvantages:

- no mutation history for undo/redo
- more “magic”
  _ a lot of logic happens in MobX internally
  _ difficult to debug

### States_rebuilder

The example has been build following the written tutorial “States Rebuilder - ZERO Boilerplate Flutter State Management” by Reso Coder. [[@StatesRebuilderZERO2019]](https://resocoder.com/2019/12/30/states-rebuilder-zero-boilerplate-flutter-state-management/) States Rebuilder is a state management solution that is purely written in Dart and comes with an integrated Dependency Injection approach.

States Rebuilder can be used as mutable and immutable state management solution. In this example it is used as mutable state management solution.

#### Concept

The concepts of States Rebuilder are taken out of the README.md of the official dart package. [[@StatesRebuilderFlutter]](https://pub.dev/packages/states_rebuilder)

States Rebuilder implements the Observer-Observable-pattern.

The Observer-Observable-pattern is a design pattern in object-oriented software which specifies a distinct behaviour. The behaviour is a one-to-many relationship where the change of the the one (Observable) notifies the many (Observers) which triggers an automatic update. [[@gamma1994design]](http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1)
ReactiveModel is the representation of the observable which multiple Observers can listen to.

##### ReactiveModel

ReactiveModel is an abstract class which wrapped around a singleton. A singleton “ensure a class only has one instance, and provide a global point of access to it”. [[@gamma1994design]](http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612/ref=ntt_at_ep_dpi_1)
The ReactiveModel exposes specified getters to obtain the last state of the singleton (`state`, `value`) and getters to track the state of the singleton (`isIdle`, `isWaiting`, `hasError` and `hasData`). Furthermore it exposes two methods to mutate the state of the singleton (`setState`, `setValue`).
The singleton can also be accessed as a simple model without the provided getters and methods of the ReactiveModel.

##### StateBuilder

Is one out of four Observer Widgets which can be used to connect the UI to a ReactiveModel. The other three Observer Widgets are:

- WhenRebuilder
- WhenRebuilderOr
- OnSetStateListener

WhenRebuilder enforces the implementation of UI response for each of the four state states, e.g. `isIdle`.

WhenRebuilderOr in contrast to WhenRebuilder enforces the implementation of a `builder` function and optional parameters for `isIdle` etc.

OnSetStateListener is used to react to side-effects. It reacts to notifications from its defined Observables as any other Observer in States Rebuilder. It differs from the others by having a `child` parameter instead of a `builder` parameter. The difference in these parameters is that `child` will not be rebuild when the Observer receives notifications from its Observables.

##### Injector

Injector is a StatefulWidget that is used to register and unregister Models/ReactiveModels, interfaces and flavors. It provides getters to access a registered instance in any descendant in the widget tree.

#### Implementation

For the examples the package states_rebuilder [[@StatesRebuilderFlutter]](https://pub.dev/packages/states_rebuilder) has to be added to the pubspec.yaml file.

As usual the code implementation will be separated into application layer and presentation layer for the weather function.

##### Application Layer

In States Rebuilder the model is usually named store. Therefore in the example the model for weather related functionality is called `WeatherStore`.

Inside the `WeatherStore` class no extension or mixin has to be implemented since it will be wrapped by a ReactiveModel.

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

_Code snippet 44: States Rebuilder WeatherStore class_

In the method `_weatherChanged()` the method `setState` provided by the `ReactiveModel` class is used to mutate the state of the store and imply a notification to its Observers.

##### Presentation Layer

To access the WeatherStore in the application it needs to be injected into the widget tree. This injection takes place inside the StatesRebuilderApp a.k.a. WeatherApp.

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

_Code snippet 45: StatesRebuilderApp widget_

To access the weather store inside the weather widget we used the Injector widget to get the instance of weather store as ReactiveModel.

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

_Code snippet 46: States Rebuilder Weather widget_

The Observer widget `StateBuilder` is implemented inside the method `_buildUI()`. The ReactiveModel `_reactiveWeatherStoreModel` is registered as the only observable with the parameter `models`. Therefore the UI gets rebuild whenever StateBuilder receives a notification from WeatherStore. Inside the `builder` parameter the attribute `whenConnectionState` of `reactiveModel` (in this case the Reactive Model registered in `models`) is used to handle different connections states, e.g. `isIdle`, and build the corresponding UI.

Advantages:

- all-in-one package
- easy to use
- easy to learn
- no unnecessary boilerplate

Disadvantages:

- strongly coupled to its own Dependency Injection \* all-or-nothing solution
- hard to master

# Evaluation (depends on part 3: Results)

The first thing I want to do is remove the state management solutions InheritedWidget and bloc_vanilla from the following evaluation. The reason for this decision is that with Provider a solution has been developed which wraps the Inherited Widget and provides a simplified API. The same advantages come with flutter bloc which provides the bloc pattern with a simplified API and less overhead to worry about.

The state management solutions will be rated from a scale from 1-3. The rating value is defined as follows:

- 1 represents a rating where the criteria is somehow matched or not matched at all
- 2 represents a rating where the criteria is matched but does not “feel” good
- 3 represents a rating where the criteria is matched better than normal

Furthermore I will add a comment to ratings of 1 and 3 to add more information to the result.

## Criteria

The criteria that were chosen to evaluate the different state management solutions are a mixture of quality attributes and personally chosen criteria which I will further explain in the upcoming section.

The quality attributes are taken from “Characterizing Architecturally Significant Requirements” by Chen et al.:[[@chenCharacterizingArchitecturallySignificant2013]](http://ieeexplore.ieee.org/document/6365165/)

- Maintainability
- Extendability
- Modularity
- Reusability
- Testability

The personally chosen criteria are:

- Synergy
- Time to learn
- Ressources
- Amount of Boilerplate
- Side-effect handling
- Debugging

### Maintainability

Maintainability is defined as “the ease with which a software system or component can be modified to correct faults, improve performance or other attributes, or adapt to a changed environment.” [[@159342]](https://ieeexplore.ieee.org/document/159342)
To put it in simpler terms: The state management solution implementation is evaluated based on changes to improve the application and their affect on other components.

### Extendibility

Extendibility is defined as “the ease with which a system or component can be modified to increase its storage or functional capacity.” [[@159342]](https://ieeexplore.ieee.org/document/159342)
For our evaluation the focus is on the functional capacity part. How easy is it to add more feature with the state management solution?

### Modularity

Modularity is defined as “the degree to which a system or computer program is composed of discrete components such that a change to one component has minimal impact on other components.” [[@159342]](https://ieeexplore.ieee.org/document/159342)
This criteria will be similar rated as maintainability since they modularity impacts the other quality attribute criteria.

### Reusability

Reusability is defined as “the degree to which a software module or other work product can be used in more than one computer program or software system” [[@159342]](https://ieeexplore.ieee.org/document/159342)
For the evaluation reusability will be evaluated by the reusability of the state management solution in non-Flutter applications.

### Testability

Testability is defined as “the degree to which a system or component facilitates the establishment of test criteria and the performance of tests to determine whether those criteria have been met.” [[@159342]](https://ieeexplore.ieee.org/document/159342)
This criteria will be evaluated based on the simplicity to write unit tests.

---

### Synergy

Synergy in the context of the evaluation is defined as how well the state management solution fits into the architecture and how well it interacts with the other packages used to develop the application.

### Time to learn

Time to learn in the context of the evaluation is defined as the time it takes the developer to learn the concepts of the state management solution and implement them successfully in an example application. This criteria is based on my own time it took me to learn enough about the state management solution to implement it.

### Sources

Sources in the context of the evaluation is defined as the amount of sources you will find when you search the Internet for examples and tutorials for the state management solution. Furthermore if the SMS has a documentation and how well the documentation is written.

### Boilerplate

Boilerplate in the context of the evaluation is defined as how much boilerplate is being used by the SMS.

### Side-effect handling

Side-effect-handling in the context of the evaluation is defined as how well the SMS handles side-effects. To be more precise does the SMS provide a recommendation or guideline how to handle side-effects, how easy can it be implemented and how well it works.

### Debugging

Debugging in the context of the evaluation is defined as how easy can bugs be debug with the SMS. To be more precise how difficult is it to track the bug inside the implementation of the SMS.

## Results

### Quality Attributes

#### Maintainability

| Criteria        | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Maintainability | 1               | 2                      | 2    | 2    | 2                | 2     |

- Stateful Widget: State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.

#### Extendability

| Criteria      | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Extendability | 1               | 2                      | 2    | 2    | 2                | 2     |

- Stateful Widget: The extendability of the application with this SMS is provided but for the same reason as in maintainability the need the pass down the state through all widgets in between makes it worse.

#### Modularity

| Criteria   | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ---------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Modularity | 1               | 2                      | 2    | 2    | 2                | 2     |

- Stateful Widget: State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.

#### Reusability

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Reusability | 1               | 1                      | 2    | 2    | 1                | 2     |

- Stateful Widget: Flutter specific.
- ChangeNotifierProvider: Flutter specific.
- States Rebuilder: Flutter specific.

#### Testability

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Testability | 2               | 2                      | 3    | 2    | 2                | 3     |

- Bloc: Has the package bloc_test [[@BlocTestDart]](https://pub.dev/packages/bloc_test) which makes it easier to write tests for blocs.
- Redux: Since most of the components in Redux are pure functions, they are easy to test without mocking.

### The personally chosen criteria

#### Synergy

| Criteria | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| -------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Synergy  | 1               | 2                      | 2    | 2    | 1                | 2     |

- Stateful Widget: Breaks the principle of decoupling by having logic in the UI.
- States Rebuilder: States Rebuilder is an all-in-one package where a solution for state management via Observer pattern and dependency injection via Injector is provided. In our architecture the package combination of getIt and injector has been chosen to handle D.I. and State Rebuilder’s own dependency injection does not play well with the architecture’s D.I. solution.

#### Time to learn

| Criteria      | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Time to learn | 3               | 3                      | 1    | 3    | 2                | 1     |

- Stateful Widget: One of Flutters three types of widgets which everyone using Flutter had to learn.
- ChangeNotifierProvider: Endorsed by the Flutter Team and is easy to learn because of it’s popularity and tutorials
- Bloc: Even though the concept of Bloc is well documented it took me one day to understand the concepts and implemented it in my first application.
- MobX: Easy to learn since MobX encapsulates most logic and handles the updates of the UI and notifications about state manipulations internally. The developer only has to implement the three mentioned packages in the MobX example and add decorators to the business logic.
- Redux: Without previous knowledge about Redux and it not being a popular solution for state management in Flutter it took me between 2 and 3 days to implement it in the example application. Furthermore, I stopped the implementation of the example without fully following the concepts of Redux. As you may have noticed in the middleware to handle asynchronous calls the reducers are dispatching more than one action. At that time I knew that Redux is powerful and to understand how to implement the notification to display a ProgressLoadingIndicator it would take me even more time.

#### Sources

| Criteria | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| -------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Sources  | 3               | 3                      | 3    | 2    | 2                | 2     |

- Stateful Widget: Everyone comparing state management solutions includes an explanation about state management with a stateful widget. Furthermore, it is one of Flutters three widget types and the simplest state management solution.
- ChangeNotifierProvider: Provider is a very popular package in Flutter and therefore there are a lot of examples of how to use its ChangeNotifierProvider in an application.
- Bloc: Bloclibrary [[@Bloc]](https://bloclibrary.dev/#/) is one of the best documentations I have seen so far. It contains multiple examples of how to implement the bloc pattern in different scenarios and much more. Furthermore there are tons of examples and tutorials of how to implement the bloc pattern.

#### Boilerplate

| Criteria    | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| ----------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Boilerplate | 2               | 2                      | 1    | 2    | 3                | 1     |

- Bloc: To add a feature at least one event, one state and the bloc itself has to be added.
- States Rebuilder: ReactiveModel provides a lot of access to getters that are common when it comes to state management, e.g. idle state handling.
- Redux: The strict combination of concepts includes at least one action, one reducer and one state to add a feature.

#### Side-effect handling

| Criteria              | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Side\-effect handling | 1               | 1                      | 3    | 2    | 3                | 2     |

- Stateful Widget: No recommendation about how to handle side-effects.
- ChangeNotifierProvider: No recommendation about how to handle side-effects.
- Bloc: Emphasises a specific widget (BlocListener) to handle side-effects.
- MobX: I have to make an exception to add a comment for MobX for this criteria. Even though MobX uses reactions to handle side-effects I was not able to add the completion of the RefreshIndicator or the notification of the ThemeStore that the weather has changed as reactions and make it work.
- States Rebuilder: Emphasises a specific Observer Widget to handle side-effects.

#### Debugging

| Criteria  | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Debugging | 2               | 2                      | 3    | 1    | 2                | 2     |

- Bloc: The immutability allows to track state changes via a history and enables redo/undo functionalities that come in handy when debugging. The tracking history is supported by a specific class in the bloc package.
- MobX: Since MobX is handling a lot of logic internally it is difficult to track down a bug.

## Overall

| Criteria              | Stateful Widget | ChangeNotifierProvider | Bloc | MobX | States Rebuilder | Redux |
| --------------------- | --------------- | ---------------------- | ---- | ---- | ---------------- | ----- |
| Maintainability       | 1               | 2                      | 2    | 2    | 2                | 2     |
| Extendability         | 1               | 2                      | 2    | 2    | 2                | 2     |
| Modularity            | 1               | 2                      | 2    | 2    | 2                | 2     |
| Reusability           | 1               | 1                      | 2    | 2    | 1                | 2     |
| Testability           | 2               | 2                      | 3    | 2    | 2                | 3     |
| Synergy               | 1               | 2                      | 2    | 2    | 1                | 2     |
| Time to learn         | 3               | 3                      | 1    | 3    | 2                | 1     |
| Sources               | 3               | 3                      | 3    | 2    | 2                | 2     |
| Boilerplate           | 2               | 2                      | 1    | 2    | 3                | 1     |
| Side\-effect handling | 1               | 1                      | 3    | 2    | 3                | 2     |
| Debugging             | 2               | 2                      | 3    | 1    | 2                | 2     |
| Total                 | 18              | 22                     | 24   | 22   | 22               | 21    |

## Recommendations

Example: Stateful widget
Small: ChangeNotifierProvider, MobX
Medium: Bloc, MobX, States Rebuilder, Redux
Large: Bloc, Redux, States Rebuilder

# References
