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

### Domain-Driven-Design

Domain-Driven-Design (DDD) is a software development approach introduced by Eric Evans in his book "Domain-Driven-Design: Tackling Complexity in the Heart of Software".[@evans2004domaindriven] DDD is based on the idea that to solve a problem defining the core domain is from utmost importance. The users of the software are the people who are familiar with the domain and the software is developed to solve a problem they face.

#### Why DDD?

Evans answers this question as follows:

> Every software program relates to some activity or interest of its user. The heart of software is its ability to solve domain-related problems for its user. All other features, vital though they may be, support this basic purpose. When the domain is complex, this is a difficult task, calling for the concentrated effort of talented and skilled people.Developers have to steep themselves in the domain to build up knowledge of the business.

He recommends that the best way to do this is to make software a reflection of the domain which creates an ubiquitous language that the domain experts and developers can use.

#### Domain-Driven-Design principles

In this part I will reduce the DDD principles to the ones used in our application.

##### Domain

A domain is an abstract area that defines a problem that needs to be solved. It can be compose of smaller subdomain. 

##### Layered Architecture

DDD recommends to use a four-layered architecture where the domain logic is focused on one layer and not dependent on another layer. The other layers are the infrastructure layer, the application layer and the presentation layer.

##### Ubiquitous Language

DDD refers to the Ubiquitous language as a must. The idea is that the developer and the user need to speak the same language, and the developers use this language when coming up with class names, modules, variables etc. This way, the code reads as if a user is speaking.

##### Entities

Entities are domain objects that are uniquely defined by a unique identifier, and not by their attributes. They are commonly described as identities and the building blocks of the domain modelling. To put it in simpler words: Entities emphasise on the who or they are rather than the what they are.

##### Factories

They are used to create complex objects and ensure that the client has no knowledge of the internal details and functionality of that object manipulation. As advised by Evans, factories provide encapsulation.They also ensure standardisation of object instantiation and ensure the objects do not care about the creation themselves. This helps at keeping the domain clean and ensures boundaries are kept.


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

In order to evaluate multiple state management solutions I had to find a way to compare them. For this purpose I choose to build an app with predefined functionalities. This sets a goal to achieve and requirements which the SMSs had to fulfill. By having an app with predefined functionalities/requirements the state management solutions can directly be compared in a specified scenario.

Since I want to focus on the SMS part I don’t want to spend a lot of time in planning an application. So I have chosen to use the Weather App build in the tutorial by Felix Angelov as my foundation. [@WeatherBloc]
The reason for this example app is that I have started the project with previous knowledge about the flutter_bloc [@FlutterBlocFlutter] package which was also created by Felix. And furthermore, because I like the app’s UI.

Take a look at the .gif of the weather app at bloclibrary [@Bloc] to get a first glimps at what will be build:

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
This chapter will show the results I have collected after the implementation of each state management solution in the example app. The chapter is structure as follows:

* The first section will present the two different patterns each state management solution is build upon
* The second section contains the implemented state management solutions and how they are implemented in the architecture
* The third and last section will cover the evaluation of the SMS. This section will cover the criteria that we chosen to evaluate the SMS, the result of the SMS and my personal recommendation on which state management solution is useful when it comes to developing large-scale applications, etc.

### 3.1 Patterns in state management solutions (mutable/immutable)

As you’ve noticed by now state management is a hot topic in the Flutter community. Therefore it is not surprising that a lot of people try to provide valid information about state management.
In his article “State Management Explained” Reso Coder did a great job in explaining the core principles of state management approaches.
In the following part I am going to summarise his article:

State management solutions can be divided into one out of two principles:
(1) mutable state and (2) immutable state.

Mutability is specified by its characteristic that object values can change over time.[@Mutable] 
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
Mutable state management also requires to find a solution to handle initial or empty state which is in most cases a decision between null checks in the UI or creating a state enum to handle the states.  This approach comes closer to she clean separation in immutable solutions like bloc.
They last disadvantage is the difficult challenge to manage the states history. If we would have a store with more data than settingsEntity we would find correlating methods to mutate each data property. Since we then have different data that can change over time without the change of other data properties it gets much more difficult to track these changes.
On the other hand mutable state management solutions shine with their lack of boilerplate code and ease to learn and implement.

Immutable state management solutions in contrary to mutable solutions tackle each the three disadvantages. 

The following code snippets show how the immutable state management solution Bloc addresses each disadvantage.

```dart
...
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.toggleTemperatureUnit(
		bool value) = ToggleTemperatureUnit;
}
...
```
_Code snippet 11: SettingsEvent in flutter_bloc example._

```dart
@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState(
{@required TemperatureUnit temperatureUnit}
	) = _SettingsState;
  factory SettingsState.celcius() =>
		const SettingsState(
			temperatureUnit:TemperatureUnit.celsius
		);
  factory SettingsState.fahrenheit() =>
      const SettingsState(
			temperatureUnit:TemperatureUnit.fahrenheit
		);
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
      yield event.value ? 
		SettingsState.celcius() : 
		SettingsState.fahrenheit();
    }
  }
}
...
```
_Code snippet 13: SettingsBloc in flutter_bloc example._

The separation of concerns is achieve by the three concepts of bloc: (1) events, (2) states and (3) Bloc.
Each concept has its own concern. Events are triggered when the user interacts with the UI and signals the bloc that the UI needs to update. States are representations of the UI. Blocs are the glue in the middle between events and states where the business logic of a bloc lives. The concern of the bloc is to map each event to its counterpart state.
As you can see in snippet X of the bloc class, the disadvantage of the initial state is addressed by providing an initial state out of the box.

The last disadvantage can be addressed by another class of the bloc package Transition[@BlocLibraryDart]. This class consist of the currentState, the event which was added, and the next state. A transition occurred whenever an event is added and after it has been handled by mapEventToState but before the states gets updated.
Another advantage is that with the clear separation of concerns the testability of these components is easier.

Even though immutable state solutions address the disadvantages of mutable state solutions they come with the drawback of boilerplate. Even the simplest function implemented in Bloc requires quite a lot of overhead.


Each example consist of 5 paragraphs: 

* (1) Introduction, 

* (2) mutable/immutable,

* (3) pattern/concept, 

* (4) code implementation in app, 

* (5) benefits/challenges/outcomes


### 3.2 Examples

## 4. Evaluation (depends on part 3: Results)

The first thing I want to do is remove the state management solutions InheritedWidget and bloc_vanilla from the following evaluation. The reason for this decision is that with Provider a solution has been developed which wraps the Inherited Widget and provides a simplified API. The same advantages come with flutter bloc which provides the bloc pattern with a simplified API and less overhead to worry about.

The state management solutions will be rated from a scale from 1-3. The rating value is defined as follows:

* 1 represents a rating where the criteria is somehow matched or not matched at all
* 2 represents a rating where the criteria is matched but does not “feel” good
* 3 represents a rating where the criteria is matched better than normal

Furthermore I will add a comment to ratings of 1 and 3 to add more information to the result.

### Criteria

The criteria that were chosen to evaluate the different state management solutions  are a mixture of quality attributes and personally chosen criteria which I will further explain in the upcoming section.

The quality attributes are taken from “Characterizing Architecturally Significant Requirements” by Chen et al.:[@chenCharacterizingArchitecturallySignificant2013]

* Maintainability
* Extendability
* Modularity
* Reusability
* Testability

The personally chosen criteria are:

* Synergy
* Time to learn
* Ressources
* Amount of Boilerplate
* Side-effect handling
* Debugging

Maintainability is defined as “the ease with which a software system or component can be modified to correct faults, improve performance or other attributes, or adapt to a changed environment.” [@159342]
To put it in simpler terms: The state management solution implementation is evaluated based on changes to improve the application and their affect on other components. 

Extendibility is defined as “the ease with which a system or component can be modified to increase its storage or functional capacity.” [@159342]
For our evaluation the focus is on the functional capacity part. How easy is it to add more feature with the state management solution?

Modularity is defined as “the degree to which a system or computer program is composed of discrete components such that a change to one component has minimal impact on other components.” [@159342]
This criteria will be similar rated as maintainability since they modularity impacts the other quality attribute criteria.

Reusability is defined as “the degree to which a software module or other work product can be used in more than one computer program or software system”  [@159342]
For the evaluation reusability will be evaluated by the reusability of the state management solution in non-Flutter applications.

Testability is defined as “the degree to which a system or component facilitates the establishment of test criteria and the performance of tests to determine whether those criteria have been met.” [@159342]
This criteria will be evaluated based on the simplicity to write unit tests.

---
Synergy in the context of the evaluation is defined as how well the state management solution fits into the architecture and how well it interacts with the other packages used to develop the application.

Time-to-learn in the context of the evaluation is defined as the time it takes the developer to learn the concepts of the state management solution and implement them successfully in an example application. This criteria is based on my own time it took me to learn enough about the state management solution to implement it.
 
Resources in the context of the evaluation is defined as the amount of resources you will find when you search the Internet for an examples and tutorials for the state management solution. Furthermore if the SMS has a documentation and how well the documentation is written.

Amount of Boilerplate in the context of the evaluation is defined as how much boilerplate is being used by the SMS.

Side-effect-handling in the context of the evaluation is defined as how well the SMS handles side-effects. To be more precise does the SMS provide a recommendation or guideline how to handle side-effects, how easy can it be implemented and how well it works.

Debugging in the context of the evaluation is defined as how easy can bugs be debug with the SMS. To be more precise how difficult is it to track the bug inside the implementation of the SMS.


### Results

Quality Attributes:
* Maintainability
	* Stateful Widget: 1
		* State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.
	* ChangeNotifierProvider: 2
	* Bloc: 2
	* MobX: 2
	* States Rebuilder: 2
	* Redux: 2
* Extendability
	* Stateful Widget: 1
		* The extendability of the application with this SMS is provided but for the same reason as in maintainability the need the pass down the state through all widgets in between makes it worse.
	* ChangeNotifierProvider: 2
	* Bloc: 2
	* MobX: 2
	* States Rebuilder: 2
	* Redux: 2
* Modularity
	* Stateful Widget: 1
		* State and methods to manipulate the state have to be passed down the tree through widgets without the need to access it. Therefore the maintainability suffers the larger the application grows.
	* ChangeNotifierProvider: 2
	* Bloc: 2
	* MobX: 2
	* States Rebuilder: 2
	* Redux: 2
* Reusability
	* Stateful Widget: 1
		* Flutter specific.
	* ChangeNotifierProvider: 1
		* Flutter specific.
	* Bloc: 2
	* MobX: 2
	* States Rebuilder: 1
		* Flutter specific.
	* Redux: 2
* Testability
	* Stateful Widget: 2
	* ChangeNotifierProvider: 2
	* Bloc: 3
		* Has the package bloc_test [@BlocTestDart] which makes it easier to write tests for blocs.
	* MobX: 2
	* States Rebuilder: 2
	* Redux: 3
		* Since most of the components in Redux are pure functions, they are easy to test without mocking.



The personally chosen criteria are:
* Synergy
	* Stateful Widget: 1
		* Breaks the principle of decoupling by having logic in the UI.
	* ChangeNotifierProvider: 2
	* Bloc: 2
	* MobX: 2
	* States Rebuilder: 1
		* States Rebuilder is an all-in-one package where a solution for state management via Observer pattern and dependency injection via Injector is provided. In our architecture the package combination of getIt and injector has been chosen to handle D.I. and State Rebuilder’s own dependency injection does not play well with the architecture’s D.I. solution.
	* Redux: 2
* Time to learn
	* Stateful Widget: 3
		* One of Flutters three types of widgets which everyone using Flutter had to learn.
	* ChangeNotifierProvider: 3
		* Endorsed by the Flutter Team and is easy to learn because of it’s popularity and tutorials
	* Bloc: 1
		* Even though the concept of Bloc is well documented it took me one day to understand the concepts and implemented it in my first application.
	* MobX: 3
		* Easy to learn since MobX encapsulates most logic and handles the updates of the UI and notifications about state manipulations internally. The developer only has to implement the three mentioned packages in the MobX example and add decorators to the business logic.
	* States Rebuilder: 2
	* Redux: 1
		* Without previous knowledge about Redux and it not being a popular solution for state management in Flutter it took me between 2 and 3 days to implement it in the example application. Furthermore, I stopped the implementation of the example without fully following the concepts of Redux. As you may have noticed in the middleware to handle asynchronous calls the reducers are dispatching more than one action. At that time I knew that Redux is powerful and to understand how to implement the notification to display a ProgressLoadingIndicator it would take me even more time.
* Ressources
	* Stateful Widget: 3
		* Everyone comparing state management solutions includes an explanation about state management with a stateful widget. Furthermore, it is one of Flutters three widget types and the simplest state management solution.
	* ChangeNotifierProvider: 3
		* Provider is a very popular package in Flutter and therefore there are a lot of examples of how to use its ChangeNotifierProvider in an application.
	* Bloc: 3
		* Bloclibrary [@Bloc] is one of the best documentations I have seen so far. It contains multiple examples of how to implement the bloc pattern in different scenarios and much more. Furthermore there are tons of examples and tutorials of how to implement the bloc pattern.
	* MobX: 2
	* States Rebuilder: 2
	* Redux: 2
* Amount of Boilerplate
	* Stateful Widget: 2
	* ChangeNotifierProvider: 2
	* Bloc: 1
		* To add a feature at least one event, one state and the bloc itself has to be added.
	* MobX: 2
	* States Rebuilder: 3
		* ReactiveModel provides a lot of access to getters that are common when it comes to state management, e.g. idle state handling.
	* Redux: 1
		* The strict combination of concepts includes at least one action, one reducer and one state to add a feature.
* Side-effect handling
	* Stateful Widget: 1
		* No recommendation about how to handle side-effects.
	* ChangeNotifierProvider: 1
		* No recommendation about how to handle side-effects.
	* Bloc: 3
		* Emphasises a specific widget (BlocListener) to handle side-effects.
	* MobX: 2
		* I have to make an exception to add a comment for MobX for this criteria. Even though MobX uses reactions to handle side-effects I was not able to add the completion of the RefreshIndicator or the notification of the ThemeStore that the weather has changed as reactions and make it work.
	* States Rebuilder: 3
		* Emphasises a specific Observer Widget to handle side-effects.
	* Redux: 2
* Debugging
	* Stateful Widget: 2
	* ChangeNotifierProvider: 2
	* Bloc: 3
		* The immutability allows to track state changes via a history and enables redo/undo functionalities that come in handy when debugging. The tracking history is supported by a specific  class in the bloc package.
	* MobX: 1
		* Since MobX is handling a lot of logic internally it is difficult to track down a bug.
	* States Rebuilder: 2
	* Redux: 2

### Overall

### Recommendations

Example: Stateful widget
Small: ChangeNotifierProvider, MobX
Medium: Bloc, MobX, States Rebuilder, Redux
Large: Bloc, Redux, States Rebuilder

## 5. Conclusion (summary of part 4: Discussion)

* use the right tool for the job

* which solution is suited to help with state management in example, small-scale, middle-scale, large-scale applications


## 6. References


## 7. Bibliography
