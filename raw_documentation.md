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

The Inherited Widget is the third and last type of Widgets I will talk about.

To explain what an Inherited Widget is and how it works I will summarise the youtube video "Inherited Widgets Explained - Flutter Widgets 101 Ep. 3". [@InheritedWidgetsExplained] It is the third video of a great series by the Flutter team where they explain the different types of widgets used by Flutter.

When working with widgets in Flutter it can get cumbersome pretty quickly when a deeply nested child widget needs to access data from an ancestor. The more widgets are in between the ancestor with the data and the child that needs to access the data the more cumbersome it gets as seen in Figure 17.

|![Inherited Widget example](https://i.imgur.com/wFAt9A7.png)|
|:--:| 
|_Figure 17: Widget tree where child that needs data from ancestor and data are highlighted._|

To provide the highlighted child widget with the data of an ancestor the data has to be passed down through the widgets in between even though they may not need access to the data. 

This is where Inherited Widgets can help. They are widgets that can be accessed from any descendant in the widget tree as highlighted in Figure 18.

|![Inherited Widget example](https://i.imgur.com/GaoNGIW.png)|
|:--:| 
|_Figure 18: Widget tree with Inherited Widget._|

To access the Inherited Widget the BuildContext is used.

| :closed_book:      | BuildContext |  The build context handles the location of the widget in the tree. [@BuildContextClassWidgets]     |
|--------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

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

### 1.2 What is state?

This section will cover what state in Flutter is. All the information in this section is taken from the official Flutter documenation.

So, to start this section let's take a look at the official definition of state in Flutter.

#### Definition

| :closed_book:      | State |  Whatever data you need in order to rebuild your UI at any moment in time. [@DifferentiateEphemeralState]     |
|--------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

To remind you about its impact on Flutter I want to remind you about how Flutter builds its UI with Figure 01:

|![equation](https://i.imgur.com/DoY8u5y.png)|
|:--:| 
|_Figure 01: How Flutter builds its UI_ [@StartThinkingDeclaratively]|

Now let's dive deeper into state in Flutter. It can be divided into ephemeral state and application state.

#### Ephemeral state

Ephemeral stae is specified as mutable data which is only relevant to the widget holding this configuration. It is also called local state and can be implemented using a state object of a Stateful Widget as seen in Section 1.1 It's all widgets.

#### Application State

Application state in constrast to ephemeral state is data that is shared by mutliple widgets, e.g. user data.

#### Decision help

When working with state in Flutter there is no clear-cut rule about which type of state you should use. The documentation contains a decision help when it comes to decide which type of state you should use which is shown in Figure 19:

|![decision help](https://i.imgur.com/5ifKgCM.png)|
|:--:| 
|_Figure 19: Decision help_|

Don't worry to much about what kind of state to use since it most definitely will change over time and you can simply change it afterwards.

This part is the finish of the section about state in Flutter. The next section will cover how Flutter reacts to state changes internally.

### 1.3 How does flutter react to state changes?

In the previous section about widgets I have covered the widget types Stateless widget and Stateful widgets and how Flutter handles them with the use of the widget tree and the element tree. This has been the way Flutter has been working internally in 2018, when the youtube video series "Widget 101" has been uploaded by the Flutter team. Since then Flutter has evolved and so has the way Flutter handles widgets internally. In 2019 during the Google Developer Days China the Flutter team gave a talk about how Flutter renders widgets and uploaded the talk to youtube.

So to answer the question "How does Flutter react to state changes" I will use the content provided by the video "How Flutter renders Widgets" from the talk by the Flutter team. [@HowFlutterRenders]

Since 2018 the way Flutter works internally has evolved. Additionally to the widget and element tree Flutter now uses a tree of RenderObjects. These trees are the three core concepts of Flutter.

They are deeply connected and all have different responsibilities as seen in Figure 20:

|![the three trees](https://i.imgur.com/gzZ6cVw.png)|
|:--:| 
|_Figure 20: The three concept of trees in Flutter_|

You will notice a clear separation of concerns where each tree has its own job in Flutter.

The Widget tree contains widgets that as mentioned earlier hold the configuration for a piece of the UI. Furthermore, a widget "describes the configuration for an Element." [@WidgetClassWidget]

The Element tree contains elements that represent an actual piece of the UI. In Flutter widgets are the blueprint for an element, thus,“an instantiation of a Widget at a particular location in the tree.”[@ElementClassWidgets] and what the user actually can see on the UI. Furthermore, the element is the manager of the UI by holding a reference to its widget in the widget tree and render object in the element tree and managing the communication with Flutter to rebuild the UI if needed.

The RenderObject tree contains Render Objects which "handle sizes, layout and painting" [@RenderObjectElementClass] of the element on the UI.

If you remember the section about Stateful widget, I have covered how the widget and element tree react to changes. Now lets take the example Widget `Foo` from Figure 21 and extend our knowledge to include the RenderObject tree.

|![Foo example](https://i.imgur.com/gzZ6cVw.png)|
|:--:| 
|_Figure 21: The three trees with example Widget Foo_|

The first action Flutter takes when the `Foo` widget gets called is the same. It creates an element, to be more precise a RenderObjectElement [@RenderObjectElementClassWidgets], in this case the FooElement which the Framework mounts to the element tree. When an element is mounted to the element tree the element asks the widget to create a Render Object, in this case RenderFoo. After RenderFoo has been created the Render Object gets mounted by the framework onto the RenderObject tree.

Now we have covered how Flutter reacts when it is told to build a part of the UI with a widget. Let's take a look at how the three trees react to changes with the next example:

In this example we have a RichText widget which has been mounted to the widget tree by the Framework and the corresponding element and Render Object as seen in Figure 22.

|![text example](https://i.imgur.com/iG7r4El.png)|
|:--:| 
|_Figure 22: The three trees when state changes._|

The first action that takes place is that a new RichText widget gets created which is supposed to replace the old RichText widget.

|![text example](https://i.imgur.com/JaVvq9w.png)|
|:--:| 
|_Figure 23: New RichText widget gets created._|

At this point Flutter asks itself if it can reuse parts of the element and RenderObject tree. Therefore it uses the widgets `canUpdate()` method to check if it can reuse these parts.

```dart
static bool canUpdate(Widget oldWidget, Widget newWidget) {
  return oldWidget.runtimeType == newWidget.runtimeType
      && oldWidget.key == newWidget.key;
}
```
_Code snippet 08: canUpdate() method. [@CanUpdateMethodWidget]_

Since the old widgets and new widgets `runtimeType` are the same, the framework can reuse the element and Render Object and replaces the old widget with the new one.

|![text example](https://i.imgur.com/HyvRcIJ.png)|
|:--:| 
|_Figure 24: New RichText widget replaces the old widget._|

As you've learned in the section about Stateful Widget the element now marks itself as dirty because the widget it references has been exchanged.

In response to the change the element calls the widgets `updateRenderObject()` method.

```dart
@protected
void updateRenderObject(BuildContext context, covariant RenderObject renderObject) { }
```
_Code snippet 09: updateRenderObject method. [@UpdateRenderObjectMethodRenderObjectWidget]_

The Render Object gets updated and the result can be seen in Figure 25:

|![text example](https://i.imgur.com/VmTyHT6.png)|
|:--:| 
|_Figure 25: RenderObject gets updated._|

This example covered the process of a single widget handled by Flutter with the widget, element and RenderObject tree. But don't worry, child widgets it is the same principle.

This covers the section about "How Flutter renders Widgets" and you should hopefully have an understanding of how Flutter works under the hood. To finish up the next and last section of this chapter will cover what state management is and talk about the basic principle that is used in Flutter to manage state.


### 1.4 state management

This section will cover what state management is and introduce the basic principle that is used to manage state in Flutter.

What is state management

State management in Flutter is the management of application state changes and making it accessable. This state is used by multiple widgets and has to be consistent throughout the application so that no error as a result of deferred state can occur. Furthermore, since Flutter has an unidirectional data flow from the root of the widget tree down to its children, how does the ancestor widget holding the application state get notified about state changes inside a child widget?

So how do we access application state from inside our widgets? 

To access the app state it can be accessed through handing it down the widget tree. But the problem is, how do we pass data the other way around to an ancestor? And furthermore, how do different widgets from different subtrees access the same data? This is where the principle of lifting state up comes into play.

#### 1.4.1 principle of lifting state up

This principle of lifting state up describes that we have to find the lowest common ancestor of two widgets that need access to the state and pass the state down from this ancestor.

And this principle is being used in any state management solution you will find.


## 2. Methodology (sets boundaries for part 3: Results)
In this chapter I walk you through the steps I made to be able to make an educated evaluation about state manamgement solutions.

### Challenge How can we manage to compare state management solutions to evaluate them?

To be able to compare the different state management solutions, we have to find a scenario in which they can be compared. For this purpose I’ve decided to implement each pattern in the same example application.
But this leads us to another problem: We don’t want to write the application every time from scratch or to be more precise rewrite big chunks of the application only to fit in a different SMS. 

This is where the principle of orthogonality [@hunt2000pragmatic] is useful. This principle emphasises on the benefits of ~independence or decoupling~ of components.  One of the benefits is that changes in one component do not affect any of the other. So in our case, if we change the state management solution it does not affect the other parts of our application.

Now I have shown how the amount of refactoring can be reduced with the principle of orthogonality. The next challenge is to find an architecture which follows this principle.

### Architectural Decision process

The first architecture I looked at is Clean Architecture by Uncle Bob.[@Martin17]

In Uncle Bob’s clean architecture he shows the benefits of a clean architecture where the focus is on use cases, the central business goals of the application.

He applied the principle of decoupling with two concepts: (1) the dependency rule and (2) the principle of dependency inversion.
The first concept states that source code dependencies are only allowed from outer layers to inner layers. The concept of dependency inversion introduces the use of interfaces on each layer to allow cross layer communication with the principle of contracts. [@hunt2000pragmatic]

A contract in programming is a definition of methods and attributes that everyone who wants to use mentioned methods and attributes has to follow. A contract does not more or less than what is written in it. In software development an example for a contract is an interface.

An image Uncle Bob's Clean architecture can be seen in Figure 26:

|![clean architecture](https://i.imgur.com/moPHCbt.png)|
|:--:| 
|_Figure 26: Clean architecture._|

With this onion architecture he highlights the importance of the separation of concerns. [@SeparationConcernsSoftware2020]

The business logic represents the core of the onion and the outer layer represents details. Following the separation of the business logic in your system allows you to be flexible when it comes to adding details. He describes IO-Devices, databases, etc. as details which are not relevant for the business rules. Furthermore, Frameworks are tools that can help you with the development of your application and are therefore also details.

Uncle Bob points out a problem in the creational context of a software application. The problem is that when it comes to developing an application the tools we use, like Ruby, take away the focus of the most important thing in software development, the business rules and therefore how we architect our software.

If we take a look at state management in Flutter, we can assume that state management solutions, e.g. Redux, are only details added on top of the core business logic.

This problem is also addressed by Domain-Driven-Design (DDD). “The developers are too wrapped up with technology and trying to solve problems using technology rather than careful though and design. This leads developers to constantly chase after new ‘shiny objects’, which are the latest fads in technology”. [@10.5555/3055897]

Recognizing the same problem when it comes to state management in Flutter I’ve decided to take a look into DDD.

DDD is the second approach I took to plan my software example. It led me to the Flutter Europe 2020 conference talk about Strategic Domain-Driven-Design by Majid Hajian.[@StrategicDomainDrivenDesign] He proposes an architecture based on the principles of DDD. In his talk he emphasises on the advantages of Domain-Driven-Design and how it can be used to build scalable and maintainable software. During the presentation of his architecture he pointed out that at the layer where BLoC was used as a state management solution any other state can be used instead and how easily refactoring the aftermath will be.
This ease of changability is exaclty what I was looking for.

### Domain-Driven-Design principles



### Architecture

When looking into how to use the principles of DDD to plan my example application's architecture I’ve found the DDD series by Matt Rešetár a.k.a. Reso Coder.[@FlutterFirebaseDDD2020] His series has been a big influence to me and how I've planned my architecture. In the next section I will present my adaptation of his architecture proposal for my domain.

But before getting into more detail about my architecture I want to emphasise on a common mistake made by the community when it comes to architecture.

### Architecture vs. state management vs. folder structure

A common mistake made by the community is the use of architecture, state management and folder structure interchangeably. Most Flutter developers should be familiar with the Flutter Architecture Samples repository [@FlutterArchitectureSamples] by Brian Egan and contributors. As the name suggests this repository is supposed to contain different architecture samples of a Todo App. Unfortunately, this is not the case. It contains samples of how different patterns, e.g. Redux, can be implemented. The same misunderstanding comes with the folder structure of the project where it is mistaken for architecture. Folder structure helps to separate your files but not automatically includes an architecture.

Architecture is the topic of a top-level decision when it comes to the planning of the system. It specifies how the system will be implemented, what type of modules it has and how their relationship is. [@hgracaArchitecturalStylesVs2017]
Examples for architecture are:

* layered
* service-oriented
* client-server
* etc.

To summarise, an architecture should set the outer boundaries of your application.

## My architecture

As you can see in Figure 27 the architecture is closely related to Reso Coders architecture proposal. 

|![application architecture](https://i.imgur.com/JeebkGs.jpg)|
|:--:| 
|_Figure 27: Application architecture._|

The main difference is my lack of a value object and the focus on the entities. 

The presentation layer represents the dumb UI which is used to interact with the user. Depending on the state management solution some sort of ViewModel is used in the layer, e.g. events and states in flutter_bloc.

The application layer contains the state management solution. It is the only layer communicating with the presentation layer. It depends on entities to represent the domain's relevant data models and interfaces which are a common contract to communicate with the infrastructure layer.

The domain layer contains the core logic of the business. It is intended to be a standalone layer. Due to the simplicity of this example and the focus on the state management part in the application layer, I’ve decided to leave out ValueObjects. 

The infrastructure layer contains repositories. It is the layer that communicates with APIs and other services, e.g. databases. To specify how to manage API calls, the repositories implement the provided interface of the domain layer and thereby fulfills its contract. The dependency to the models is used to specify data transfer objects [@BlikiLocalDTO] which are used to transfer the raw data from the API/database into objects.

### 2.3 Weather App Example

In order to evaluate multiple state management solutions you have to find a way to compare them. For this purpose I choose to build an app with predefined functionalities. This sets a goal to achieve and requirements which the SMSs had to fulfill. By having an app with predefined functionalities/requirements we can directly compare the state management solutions in a specified scenario.
Since I want to focus on the SMS part I don’t want to spend a lot of time in planning an application. So I’ve chosen to use the Weather App build in the tutorial by Felix Angelov as my foundation. [@WeatherBloc]
The reason for this example app is that I have with previous knowledge with the Flutter_bloc [@FlutterBlocFlutter] package which was also created by Felix. And furthermore, because I like the app’s UI.
Take a look at the .gif of the weather app at bloclibrary [@Bloc]:

|![weather app](https://i.imgur.com/cgB1wse.gif)|
|:--:| 
|_Figure 28: Weather app .gif._|

From the .gif we can take the four key features our application offers:

1. Fetch weather from an API on the search page
2. Update the app theme to match the weather condition
3. Toggle the temperature measurement unit on settings page
4. Refresh the weather by using a pull down gesture on the weather page

These four features have to be implemented by each state management solution including their side effects [@ProgrammingLanguagesWhat] like the loading indicator when weather data is being fetched.

Since I already knew how to implement the BLoC pattern with the help of flutter_bloc I’ve decided to start the evaluation process by rewriting the example app to use Flutter’s own state management solution - stateful widgets. From that point forward the rewritten example app, in this context vanilla app, has been used as a foundation to rewrite the application using a different state management solution.

A simplified version of our example apps widget tree can be seen in Figure 29:

|![weather app widget tree](https://i.imgur.com/uM2ab31.jpg)|
|:--:| 
|_Figure 29: Weather app widget tree._|

The application consists of three screens: (1) WeatherPage, (2) LocationSearchPage and (3) SettingsPage. 

### Additional packages that will be used

Before I finish this chapter I want to mention some additional packages that were used to create the examples. These packages are:

* Freezed [@FreezedDartPackage]
  * Generates code to help to deal with immutable classes and provides a simple API to use.
* Injectable [@InjectableDartPackage]
  * a convenient code generator for the get_it package
* GetIt [GetItDart]
  * "Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App"
* Dartz [@DartzDartPackage]
  * adds functinonal programming principles to dart
* build_runner [@BuildRunnerDart]
  * a build system to generate dart files
* injectable_generator [@InjectableGeneratorDart]
  * a generator to create code for injectable related annotations

The use of these packages is influence by Reso Coder's DDD example and provide our application with a criteria to evaluate with: "How does the state management solution work with the other packages used by the application".

This covers the methodology chapter. The next chapter covers the results of the implementation.

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
