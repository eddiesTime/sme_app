# Full
# What is this about?
This guide’s goal is to set an entry point for state management in Flutter.

The goal of this work is to provide Flutter developers and Flutter development teams that have to decide which state management solution to choose for their app is most likely the right tool for the job.
It should provide a reference about which SML is likely the right one to choose to build an example, small-scale, middle-scale or large-scale application.
Or at least show benefits and disadvantages of each solution so that you can make an educated decision yourself.

# Who is it for?
This paper is for Flutter developers and Flutter development teams that are in the process of planning their next project. It is for people that are overwhelmed by the amount of state management solution provided by the community. For people who are looking for information which solution they should choose and why.

# Flutter under the hood
~~In this section we are going to take a look at how Flutter works under the hood. The section is separated in two parts: (1) It’s all widgets and (2) Types of widgets.~~
> Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.[@FlutterBeautifulNative]  

> Flutter is declarative. This means that Flutter build its user interface to reflect the current state of your app.[@StartThinkingDeclaratively]  

Therefore we can assume that Flutter follows the declarative programming paradigm.  This paradigm is based on the idea that a program is a theory and that from the theory  the execution can be deducted. To put it in simpler terms: declarative programming focusses on the what to do to achieve a specified result instead of the how as in imperative programming. Since Flutter is build with Dart internally [@WhoUsesDart] we can assume that Dart uses the imperative programming to specify the computational processes that have to be executed to achieve the specified result. Let’s look at an example:
 
The following code snippet shows the declarative nature of Flutter:

```dart
void main() => Center(child: Text('Hello World'));
```

This code snippet when executed in Flutter will create a text in the center of the UI. We do not have to specify any information of what the program needs to do to display the text at the center of the UI.  What we as programmers have to do is tell the program what we expect it to do with the help of widgets. In this we use a text widget to display the text “Hello World” and the center widget to center the text on the UI. Therefore to understand how Flutter works under the hood, we have to take a look at widgets.


## It’s all widgets
In Flutter 
> everything’s a widget.  

> A widget is an immutable description of part of a user interface  
This definition of a widget can be transformed into an equation as seen in Figure 1:
![](Full/Screenshot%202020-05-03%20at%2012.22.27.png)

Since the UI is a reflection of the current state of the application build by Flutter we can assume that a widget is the term on theright side of the equation in Figure 01.

Widgets are blueprints for parts of the UI that hold a configuration for a specific state. Furthermore, they are the building blocks of an UI, thus, the making the UI a composition of different widgets. [@HowCreateStateless]
Flutter uses the concept of widget tree to define the relationship between widgets and how they have to be combined to represent the UI. A widget tree has a root followed by its children. The root widget is specified in the main method of a Flutter application where it is the first widget called by the method. An example of a widget tree can be seen in Figure 2:

Typically a UI is mutable to reflect changes. But how can Flutter reflect changes, when a widget is by definition immutable? To answer this question we have to take a look at the different types of widgets in Flutter. These are stateless widgets, stateful widgets and inherited widgets.

### Stateless Widgets
A stateless widget is specified by two concepts: (1) is has no mutable state it needs to keep track of and (2) it is composed of children. [@HowCreateStateless]

The following code snippet shows a simple stateless widget to build a text widget which displays the title we set with the help of the constructor.
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
This widget describes that when used the UI should display the title as text. 
The following code snippet shows how we could use this widget in Flutter:
```dart
...
	return Center(child: MyStatelessWidget('Hello World'));
...
```
When Flutter executes this code snippet it mounts the MyStatelessWidget to the widget tree. The string “Hello World” has been set to be the title of the widget or to be more specific the configuration which will be displayed on the UI.
When we want to display another string, we have to instantiate another instance of MyStatelessWidget which triggers Flutter to remove the old widget from the widget tree and mount the new created widget in its place.
How exactly Flutter handles this behaviour will be explained in section 1.3.
As mentioned by the first concept of a stateless widget, it has no mutable state it needs to keep track of. This job is taken care of by stateful widgets.

### Stateful Widget
The stateful widget by itself is as all widgets are immutable. It holds immutable configurations and creates a state object which contains the mutable configurations and builds its children. [@HowStatefulWidgets]
The state object is responsible to notify the UI to update. Whenever the state of the state object changes, the element holding the state object marks itself as dirty which triggers Flutter to update the UI by rebuilding its children.
The element marks itself as dirty, when the widget it has been referencing has been removed or the setState method has been called.

The code snippet below shows the general composition of a stateful widget.
```dart
class MyStatefulWidget extends StatefulWidget {
	@override
	_MyStatefulWidgetState createState() => 
		_MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
	int _counter = 0;

	@override
	Widget build(BuildContext) {
		return Column(
			children: [
				Text('$_counter'),
				FlatButton(
					child: Text('Increase'),
					onPressed: () {
						setState((){
							_counter++;
						});
					}
			]
		);
	}
	
}
```
We can see the createState method which is being called after the element has been mounted to the element tree. The element tree then hold onto the state object until it is being removed from the element tree.

### Inherited Widgets
When working with widgets in Flutter it can get cumbersome pretty quickly when a deeply nested child widget needs to access data from an ancestor widget. As shown in Figure X the data from the ancestor widget needs to be passed down the widget tree to provide access to the child widget highlighted below.

![](Full/Screenshot%202020-05-04%20at%2014.40.41.png)

This is where inherited widgets come into play. They are widgets that can be accessed from any descendant in the widget tree with the help of the build context as seen in Figure X. 
![](Full/Screenshot%202020-05-04%20at%2014.40.59.png)
The build context handles the location of the widget in the tree. [@BuildContextClassWidgets].
An example for an inherited widget you should be familiar with is Theme. It can be accessed with the static method .of(context) as seen in the code snippet below:
```dart
...
	@override
	Widget build(BuildContext context){
	...
		final ThemeData _theme = Theme.of(context);
	...
}
```

## What is state?
State in Flutter is “whatever data you need in order to rebuild your UI at any moment in time” [@DifferentiateEphemeralState].
It can be separated into ephemeral state and app state:

### Ephemeral state
Ephemeral state is specified as mutable data which is only relevant to the widget holding this configuration. It is also called local state and can be implemented using a state object as seen in section 1.1 stateful widgets.

### Application state
Application state in contrast to ephemeral state is state that is shared by multiple widgets. This can be for example user data.

When working with state in Flutter there is no clear-cut rule about which type of state you should use. The following figure can help with the decision:
![](Full/Screenshot%202020-05-03%20at%2017.02.19.png)
But you should not worry to much about what kind of state to use since it most definitely will change over time and you can simply change it afterwards.

## How does Flutter react to state changes
Widget tree, Element tree and RenderObject tree are the three core concepts of Flutter. 
They are deeply connected and all have different responsibilities as seen in Figure X:
![](Full/seperation%20of%20concerns.png)

As seen in the figure widgets hold configurations for a piece of the UI as we mentioned earlier in the section about widgets. A widget “describes the configuration for an Element.”[@WidgetClassWidgets]
The figure shows that element represent an actual piece of the UI. They are “an instantiation of a Widget at a particular location in the tree.”[@ElementClassWidgets]
Therefore what we can see on the UI in Flutter are elements which are representations of the corresponding widget for a given state.
Furthermore the figure shows that RenderObjects know about size, layout, painting and composition of themselves. They “handle sizes, layout and painting”[@RenderObjectElementClass]
Let us take a look at how Flutter puts these trees into work with the help of the figure. When a the Foo widget is mounted onto the widget tree, Flutter asks this widget to create an instance of the itself, an element. The widget then creates the FooElement which holds a reference to the Foo widget. After the FooElement has been created it is mounted onto the element tree. When the element is being mounted it calls the createRenderObject method which creates a corresponding render object, RenderFoo. This render object then gets mounted onto the render object tree.
RenderFoo holds information about how to render the element onto the UI and takes care of the rendering.

These three concepts are what makes Flutter as performant as it is. Let’s take a look at how this performance looks like.

When the Foo widget holds the configuration for a text, e.g. Hello World and we run through the process of the three trees, we first create an element which is being displayed onto the UI with the help of the RenderObject. When the text changes from Hello World to Hello again, the widget which held Hello World as configuration gets removed and the new widget which holds Hello again takes its place in the widget tree. Flutter know checks the runtimeType of the new widget. Since the widget is also of runtimeType Foo Flutter can reuse the FooElement and FooRenderObject. It only has to update the UI by calling updateRenderObject. 

## State Management
In section 1.2 we have talked about state in Flutter. So how do we access app state from inside our widgets. As you know Flutter has a unidirectional data flow. This means that from the root of the widget tree the data flows down to its children. Therefore the app state can be accessed through handing it down the widget tree. But the problem is, how do we pass data to an ancestor? And furthermore, how do different widgets from different subtrees access the same data? This is where the principle of lifting state up comes into play.

### The principle of lifting state up
This principle describes that we have to find the lowest common ancestor of two widgets that need access to the state and pass the state down from this ancestor. 
And this principle is being used in any state management solution you will find.

# Challenge How can we manage to compare SMLs to evaluate them?
To be able to compare the different state management solutions, we have to find a scenario in which they can be compared. For this purpose I’ve decided to implement each pattern in the same example application.
But this leads us to another problem: We don’t want to write the application every time from scratch or to be more precise rewrite big chunks of the application only to fit in a different SML. 

This is where the principle of orthogonality [@hunt2000pragmatic] shines. This principle emphasises on the benefits of ~independence or decoupling~ of components.  One of the benefits is that changes in one component do not affect any of the other. So in our case, if we change the state management solution it does not affect the other parts of our application.

Uncle Bob applied the principle of decoupling with two concepts: (1) the dependency rule and (2) the principle of dependency inversion.
The first concept states that source code dependencies are only allowed from outer layers to inner layers. The concept of dependency inversion introduces the use of interfaces on each layer to allow cross layer communication with the principle of contracts. []

The result of these concepts can be seen in Uncle Bob’s architecture proposal in Figure X:
![](Full/Screenshot%202020-05-07%20at%2016.25.27.png)

With this onion architecture he highlights the importance of the separation of concerns. []
The business logic represents the core of the onion and the outer layer represents details. Following the separation of the business logic in your system allows you to be flexible when it comes to adding details. He describes IO-Devices, databases, etc. as details which are not relevant for the business rules. Furthermore, Frameworks are tools that can help you with the development of your application and are therefore also details.

Uncle Bob points out a problem in the creational context of a software application. The problem is that when it comes to developing an application the tools we use, like Ruby, take away the focus of the most important thing in SD, the business rules.

If we take a look at state management in Flutter, we can assume that state management solutions, e.g. Redux, are only details added on top of the core business logic.

This problem is also addressed in Domain-Driven-Design. “The developers are too wrapped up with technology and trying to solve problems using technology rather than careful though and design. This leads developers to constantly chase after new ‘shiny objects’, which are the latest fads in technology”.

Recognizing the same problem when it comes to state management in Flutter I’ve decided to take a look into DDD which led me to the
Flutter Europe 2020 conference talk about Strategic Domain-Driven-Design by Majid Hajian. He proposes an architecture based on the principles of DDD. In his talk he emphasises on the advantages of Domain-Driven-Design and how it can be used to build scalable and maintainable software. During the presentation of his architecture he pointed out that at the layer where BLoC was used as a state management solution any other state can be used instead and how easily refactoring the aftermath will be.

When looking into how to use the principles of DDD to plan my example application I’ve found the DDD series by Matt Rasasdasd.[]
His series has been a big influence to me. In the next section I will present my adaptation of his architecture proposal for my domain.


In Uncle Bob’s clean architecture he shows the benefits of a clean architecture where the focus is on use cases, the central business goals of the application. 

He highlights a problem with the current state of development. This problem is that details like frameworks are taking over the focus of how we architect our software.  



He strongly suggests that the business logic should be in the focus of the application. With the business logic as the core of the application you modulize mentioned business logic and separated it from other concerns. Thus, the principle of separated concerns. With the business logic separated you are free to choose any detail to complement your core. And when you should decide to swap out a detail you don’t have to worry about the core being affected.

He points out that when the business logic is separated into its own layer, more detail can be added to this layer. Detail in this context can be I/O-devices on the most outer layer or the use of frameworks.



This is where the principles of clean architecture [@Martin17] by Uncle Bob can help us.
A state management solution is by itself only a tool which helps  with the challenge of managing state in an application. This led me to the question how to design the application so it will be independent from the state management solution.


# Weather App
In order to evaluate multiple state management solutions you have to find a way to compare them. For this purpose I choose to build an app with predefined functionalities. This sets a goal to achieve and requirements which the SMLs had to fulfill. By having an app with predefined functionalities/requirements we can directly compare the SMLs in a specified scenario.
Since I want to focus on the SML part I don’t want to spend a lot of time in planning an application. So I’ve chosen to use the Weather App build in the tutorial by Felix Angelov as my foundation. [@WeatherBloc]
The reason for this example app is that I came into this project with previous knowledge with the Flutter_bloc [@FlutterBlocFlutter] package which was also created by Felix. And furthermore, because I like the app’s UI.
Take a look at the .gif of the weather app at bloclibrary [@Bloc]:

![](Full/flutter_weather.gif)

From the .gif we can take the four key features our application offers:
1. Fetch weather from an API on the search page
2. Update the app theme to match the weather condition
3. Toggle the temperature measurement unit on settings page
4. Refresh the weather by using a pull down gesture on the weather page

These four features have to be implemented by each state management solution including their side effects [@ProgrammingLanguagesWhat] like the loading indicator when weather data is being fetched.

Since I already knew how to implement the BLoC pattern with the help of flutter_bloc I’ve decided to start the evaluation process by rewriting the example app to use Flutter’s own state management tool - stateful widgets. From that point forward the rewritten example app, in this context vanilla app, has been used as a foundation to rewrite the application using a different state management solution.

A simplified version of our example apps widget tree can be seen in the following figure:
![](Full/Praxisprojekt-simplified%20widget%20tree.jpg)

The application consists of three screens: (1) WeatherPage, (2) LocationSearchPage and (3) SettingsPage. 


# Domain-Driven Design Principles
# Architecture
Before getting into more detail about my architecture example I want to emphasise on a common mistake made by the community when it comes to architecture.

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
As you can see in Figure X the architecture is closely related to Reso Coders architecture proposal. 

![](Full/architecture%203.jpg)

The main difference is my lack of a value object and the focus on the entities. 
We have our presentation layer which represents the dumb UI which is used to interact with the user. Depending on the state management solution we have some sort of ViewModel in our UI, e.g. events and states in flutter_bloc.
In our application layer we’ll find our state management solution. It is the only layer communicating with our UI. It depends on entities to represent our domain relevant data models and interfaces as a common contract to communicate with our infrastructure layer.
The domain layer holds the core logic or our business. It is intended to be a standalone layer. Due to the simplicity of this example and the focus on the state management part in the application layer, I’ve decided to leave out ValueObjects. 
The infrastructure layer contains repositories. It is the layer that communicates with APIs and other services, e.g. databases. To specify how to manage API calls, the repositories implement the provided interface of the domain layer and thereby fulfil its contract. The dependency to the models is used to specify data transfer objects [] which are used to transfer the raw data from the API/database into objects.


# Part 3
## Principles in state management solutions
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
The code snippet illustrates the collection of state data and state mutating methods in a single file. This use of a file can get bloated pretty quickly the more complex the subdomain is. To approach this problem with a solution you can split the file into multiple files and annotate them as “parts”. But a problem with this approach is the non present best practice which could leave you with confusion. 
Mutable state management also requires to find a solution to handle initial or empty state which is in most cases a decision between null checks in the UI or creating a state enum to handle the states.  This approach comes closer to she clean separation in immutable solutions like bloc.
They last disadvantage is the difficult challenge to manage the states history. If we would have a store with more data than settingsEntity we would find correlating methods to mutate each data property. Since we then have different data that can change over time without the change of other data properties it gets much more difficult to track these changes.
On the other hand mutable state management solutions shine with their lack of boilerplate code and ease to learn and implement.

Immutable state management solutions in contrary to mutable solutions tackle each the three disadvantages. 

The following code snippets show how the immutable state management solution flutter_bloc addresses each disadvantage.

```dart
...
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.toggleTemperatureUnit(
		bool value) = ToggleTemperatureUnit;
}
...
```

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
The separation of concerns is achieve by the three concepts of bloc: (1) events, (2) states and (blocs).
Each concept has its own concern. Events are triggered when the user interacts with the UI and signals the bloc that the UI needs to update. States are representations of the UI. Blocs are the glue in the middle between events and states where the business logic of a bloc lives. The concern of the bloc is to map each event to its counterpart state.
As you can see in snippet X of the bloc class, the disadvantage of the initial state is addressed by providing an initial state out of the box.
The last disadvantage can be addressed by another class of the bloc package Transition[@BlocLibraryDart]. This class consist of the currentState, the event which was added, and the next state. A transition occurred whenever an event is added and after it has been handled by mapEventToState but before the states gets updated.
Another advantage is that with the clear separation of concerns the testability of these components is easier.

Even though immutable state solutions address the disadvantages of mutable state solutions they come with the drawback of boilerplate. Even the simplest function implemented in Bloc requires quite a lot of overhead.

## Examples
* Introduction
* mutable/immutable
* pattern/concept
* Code implementation in app
* benefits/challenges/outcomes


### Stateful Widget
Introduction
In this example I am going to show you how to use the stateful widget option to manage your application state. Stateful widget is one of Flutters three widget types. The implementation of this example is inspired by Flutter architecture samples[].

This solution mutates the application data and then tell the UI to update. Therefore it can be categorised to the mutable state management solutions.

Concept
In chapter 1 I have explained how stateful widgets work in detail. Therefore I am keeping the explanation short in this chapter and advice you to revisit chapter one if you encounter any problems.
Whenever you change data and want the UI to rebuild you have to call the setState method of the corresponding state object which signals the UI to rebuild.

Implementation
Do you remember the principles of lifting state up? It is the key principle to manage app state with stateful widgets in Flutter. The common lowest ancestor in this example is the WeatherApp itself because we have to update the theme set in MaterialApp to display weather changes. You can see in the following example how this looks like in our widget tree.
![](Full/stateful%20widget%20simple%20tree.jpg)


To keep the code as lean as possible in the UI I have create the AppState class which handles the state changes. This class finds its place in the application layer. 
AppState Class in application layer
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

	Future<void> fetchWeather({
		@required String location}) async {
   try {
      final WeatherResponse _wr =
          await _weatherFacade.getWeatherForLocation(
				location: location
			);
      weatherEntity = weatherEntity.copyWith(
        weatherResponse: some(_wr),
        city: location,
        lastUpdated: some(DateTime.now()),
        isLoading: false,
      );
      updateThemeToMatchWeatherCondition(
			weatherResponse: _wr
		);
    } catch (e) {
      weatherEntity = WeatherEntity.loadingFailure();
    }
  }

  void updateThemeToMatchWeatherCondition(
      {@required WeatherResponse weatherResponse}
	) {
    final Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherCondition weatherCondition =
        _weatherFacade.getWeatherConditionForWeather(weather: _weather);
    themeEntity = themeEntity.updateThemeToMatchWeatherCondition(
        condition: weatherCondition);
  }

  void toggleTemperatureUnit() {
    settingsEntity = settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? SettingsEntity.fahrenheit()
        : SettingsEntity.celsius();
  }
}
```

To connect our state management solution to the UI in a lean way, we are using the AppStateContainer. It can be described as a ViewModel which contains a reference to our AppState class and methods that change our data and call the state’s setState method. These functions trigger the stateful widget to rebuild its children and are a reference is passed down the widget tree.
AppStateContainer (ViewModel)
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

So if we need to access the state and a method to change the state we have to pass both down the widget tree.  The following code snippet that shows the content of our weather page:

``` dart
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
As you can see in the code snippet we have passed our app state and our refresh method down the widget tree into the Weather widget. In the method `_buildUI()` we are accessing the app state to determine which content to build. Further down the snippet when we implement the RefreshIndicator widget you’ll find our refresh method getting assigned.

Advantages:
* very easy to understand and implement
* tightly coupled to the widget
	* good for ephemeral state
Disadvantages:
* has to be passed down each widget in the widget tree from ancestor to child
* difficult to maintain due to previous point
* tightly coupled to widget
	* mixes logic with UI and therefore breaks clean code principles [@FlutterTutorialPros2019]
* full tree is getting rebuild when data changes


### Inherited Widget
Introduction

In this example I am going to show you how I used the inherited widget option to manage the application state. Inherited widget is one of Flutters three widget types.

This state management solution is an improvement to the stateful widget option. It removes the need to pass down the app state and state mutation methods by its nature of easily accessibility inside the widget tree.

The implementation of this example is inspired by Flutter architecture samples[], the official documentation for InheritedWidgets[] and the YouTube video about Inherited Widgets in the Widgets 101 series[].

As well as the stateful widget this one can be categorised to the mutable state management solutions.

Concept

In chapter 1 I have explained how inherited widgets work in detail. Therefore I am keeping the explanation short in this chapter and advice you to revisit chapter one if you encounter any problems.
The Inherited Widget sits above the lowest common ancestor and can be accesses in any descendant because of its nature.

Implementation
The Inherited Widget example is at first a bit complex and overwhelming, but don’t worry. We will walk through it together.
![](Full/inherited%20widget%20example.jpg)

AppStateContainer
``` dart
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
The code snippet above show our ViewModel - AppStateContainer. 
It has the same relevance as in the previous examples with some minor changes. Whenever this widget is build, it wraps its child with InheritedAppStateContainer - our Inherited Widget - and passes itself down as data. So, whenever our ViewModel changes due to state manipulation, the Inherited Widget is rebuild.

``` dart
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
The code snippet above shows the implementation of our InheritedAppStateContainer. It is the Inherited Widget in this example and provides the static method `of(context)` to access our ViewModel. The method `updateShouldNotify()` notifies widget that inherit data from this widget to rebuild.[@UpdateShouldNotifyMethodInheritedWidget]

AppState
``` dart
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
The code snippet above shows our implementation of the AppState class. 

The Inherited widget  allows us to access its data with its static `of(context)` method as seen in the following code snippet.
Weather Widget
``` dart
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

Advantages
* does not rely on third party libraries
* the amount of rebuild can be reduced by specifying conditions in the updateShouldNotify() method. For example, that only widgets related to the settings entity should rebuild.
* allows descendants to access data and methods without the need to pass it down

Disadvantages
* has been overly complicated during the first implementation
*  tightly coupled to widget
	* mixes logic with UI and therefore breaks clean code principles
* unnecessary complicated to implement
* full tree rebuilds when data changes

### ChangeNotifierProvider

Introduction

This state management solution has been endorsed by the Flutter team at the Google I/O 2019. [@PragmaticStateManagement] Furthermore they show an example [@SimpleAppState] of how to use the provider [@ProviderFlutterPackage] package in combination with ChangeNotifier.  [@ChangeNotifierClassFoundation] 
The provider package by itself is no state management solution. Provider is a tool for dependency injection. It is a wrapper around the *Inherited Widget*.
Provider’s ChangeNotifierProvider [@ChangeNotifierProviderClassProvider] class in combination with ChangeNotifier can be used to manage the state of an application.

Mutable
This is a mutable state management solution.

Concepts

ChangeNotifier

ChangeNotifier can be extend or mixed in a model class to provide a change notification API. With the API the method `notifyListeners()` can be used which notifies its listeners that the state has been mutated.

ChangeNotifierProvider 

ChangeNotifierProvider is a widget from the provider package which injects a ChangeNotifier into the widget tree and provides it to the descendants. ChangeNotifierProvider rebuilds descendants that depend on the ChangeNotifier whenever the method `notifyListeners()` inside the ChangeNotifier is called.

Consumer [@ConsumerClassProvider]

`Consumer<T> `is a widget from the provider package. It is used to access the instance of the corresponding `Provider<T>` and passes the value of the provider to its `build()` method. Consumer is a listener to the `ChangeNotifier` provided by the `ChangeNotifierProvider`. Whenever ChangeNotifierProvider receives a `notifyListeners` call, the consumer’s build function runs and rebuild the descendant Widget.

Implementation

For the implementation I’ve followed the blog post “Flutter Architecture — My Provider Implementation Guide” by Dane Mackier [@mackierFlutterArchitectureProvider2019] as well as the example from the flutter documentation. [@SimpleAppState]

Let’s take a look at the implementation. As always we take a look at the implementation of the state management solution inside the application layer and how it is accessed in the presentation layer.

Application Layer

WeatherNotifier is used as a ChangeNotifier for the weather logic in our application. It contains WeatherEntity which is our weather data. Furthermore it contains a reference to ThemeNotifier and the WeatherFacade interface.
``` dart
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
Whenever WeatherEntity changes due to the methods `fetchWeatherForLocation()` or `refreshWeatherForLocation()` the method `notifyListeners()` is called which signals our ChangeNotifierProvider to update the UI by telling its descendants to run their builder callback.

Presentation Layer

To access WeatherNotifier inside our presentation layer it needs to be injected with the help of ChangeNotifierProvider inside the lowest common ancestor.
``` dart
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

After WeatherNotifier has been injected into the widget tree inside ChangeNotifierProvider, it can be accessed inside the weather Widget.

``` dart
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

It is important to set the `listen` parameter inside `Provider.of<WeatherNotifier>` to false. Otherwise it tries to reassign WeatherNotifier whenever `notifyListeners` is being emitted.

Advantages
* easy to implement
* almost no boilerplate
* simple

Disadvantages
* difficult to keep track of state history
* no state that represents the current status of the notifier
	* an enum has to be created and maintained
* you need to keep track when not to listen for `notifyListeners`


### Vanilla Bloc
Introduction
The Bloc (**B**usiness **Lo**gic **C**omponent) pattern was first introduced at the Google I/O 2018.[@BuildReactiveMobile] So to explain this pattern I am going to keep it close to the information provided in the talk.
The Bloc pattern provides a reactive approach to handle state changes in Flutter. It is based on Streams[@StreamClassDart] which are a core concept of asynchronous programming in Dart.[@AsynchronousProgrammingStreams] The Bloc takes in events, runs the needed business logic if necessary and outputs the resulting data.


Mutable/Immutable
The Bloc pattern can be used as a mutable or immutable state management solution. You can either add mutated data to the stream or a new data object. In this example the immutable approach is implemented.

Concept
To understand the concept of Bloc you’ll have to get familiar with the concept of streams in Dart.
![](Full/stream.jpg)

Think about water running through a rain pipe which you want to use to flush down toy soldiers from the roof. On your roof the at the on side of the pipe you have your *sink*. The sink is the location where your comrade puts in the little soldiers. At the other end of your rain pipe you want to *react* to the toy soldiers that are being flushed down the pipe. To be able to react to the toy soldiers being flushed down, you use a strainer. But without clear communication you don’t know when a toy soldier is being flushed down the pipe. And you don’t want to stand there all day and waste your time. So you start to *listen* to your comrade and start to place the strain as soon as he gives you a signal. 

This example includes all the core principles of streams in Dart. 
* StreamSink[@StreamSinkClassDart] which is for event input
* Stream[@StreamClassDart] which is used for the data output

To put these concepts together you’ll need one more thing - the StreamController[@StreamControllerClassDart]  - which handles the input, output and more. The StreamController in our example is the rain pipe itself.

By default the StreamController only supports a single-subscription stream. To allow multiple listeners to subscribe you can use the StreamController.broadcast constructor.
![](Full/stream%20controller.jpg)

When the concepts of reactive programming are combined the result is the Bloc. Figure shows a widget tree and how a bloc works:
![](Full/bloc%20.png)
Image taken from the Google I/O 2018

The light blue arrows indicate events that have been added by a widget to the StreamSink. These events are handled inside the bloc. The output is then emitted via a Stream. The widgets with the speaker icons are listening to a stream inside the bloc. As you can see by the purple arrow the orange widget is receiving data through a stream and can react to it.

Implementation
For the implementation of the bloc pattern I’ve adapted two tutorials: (1) Reactive Programming - Streams - BLoC [@boelensFlutterReactiveProgramming} and (2) Getting Started with the BLoC Pattern. [@GettingStartedBLoC]

When working with StreamControllers in Flutter we can run into a problem: Broadcast streams do not buffer events when there is no listener. [@DartFlutterBad] Adding an initial value to the sink inside the bloc’s constructor won’t be possible anymore. And each bloc implementation is adding an initial value inside its constructor.

As a workaround for the problem I am recommending BehaviourSubject [@BehaviorSubjectClassRx] provided by  rxdart. [@RxdartDartPackage]
A BehaviourSubject is a special StreamController which is by default a broadcast stream and sends the latest item added to the sink to new listeners. Therefore it also works without listeners which in our constructor case is from advantage.

Let’s take a look at how the weather data logic is implemented with the WeatherBloc.

To specify the types of events that can be added to the weather bloc sink, an interface - weather_event.dart - has been created. We specified `WeatherEvent.fetchWeatherForLocation` and `WeatherEvent.refreshWeatherForLocation` as events.

Weather.event.dart
``` dart
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

Inside the WeatherBloc class the interface Bloc has been implemented.
This interface specifies that the method `dispose()` has to be added for each bloc. This has to be done to prevent memory leaks in the future.
Bloc.dart
``` dart
/// An interface to implement a dispose contract for blocs to prevent memory leaks.
abstract class Bloc {
  void dispose();
}
```

The WeatherBloc can be separated into two part:
1. StreamController, Streams, Sinks
2. Logic related methods

In the first part the *BehaviourSubject* `_weatherEntityStateController` of type WeatherEntity is declared as well as getters for its *sink* `_inWeatherEntity` and *stream* `weatherEntity`. Additionally a the StreamController `_weatherEventController` for WeatherEvents is declared. As soon as the Bloc is created it starts to *listen* to the stream inside `_weatherEventController`.

The second part contains the method `mapEventToState()`, which is used as a callback whenever a new weather event is emitted by the `_weatherEventController.stream`. Depending on the event we either call the method `fetchWeatherForLocation(location: event.location)` or `refreshWeather(location: event.location)` with the location inside the event as parameter.

The method  `dispose()` has been overwritten and closes the StreamController inside weather bloc whenever the bloc is disposed of.
CodeSnippet WeatherBloc
``` dart
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

In the UI the weather bloc is implemented inside the weather widget. We get a reference to the Bloc by using getIt. For the representation of the UI depending on the weather bloc state a StreamBuilder[@StreamBuilderClassWidgets] is used. StreamBuilder is a widget that takes in a Stream, in this case `_weatherBloc.weatherEntity` and builds the UI whenever a value is emitted by the stream. The new value is represented by an AsyncSnapshot.[@AsyncSnapshotClassWidgets] An AsyncSnapshot is a representation of the current state of the asynchronous data. Depending on the asynchronous data the UI is build.
CodeSnippet weather widget
``` dart
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

Advantages/Disadvantages
Advantages:
* clear separation of concerns
	* no business logic inside UI
	* easier to test
* can be accessed from anywhere in the tree
* plays well with Flutters reactivity
* reduces the amount of builds compared to setState()

Disadvantages
* reactive programming is not straightforward
	* people have it difficult to understand reactive programming
* a lot of boilerplate
* the concepts take some time to get the head around

### Flutter_bloc
Introduction
Flutter_bloc[@FlutterBlocFluttera] is a package developed by Felix Angelov. It extends the core principles of bloc and provides a simple API which reduces the amount of boilerplate code to work with Streams.

It has been developed with three core values in mind: [@WhyBlocBloc]

1. Simple
	* easy to understand and can be used by developers with varying skill levels
2. Powerful
	* help make amazing, complex applications by composing them of smaller components
3. Testable
	* easily test every aspect of an application so that we can iterate with confidence

Immutable

Flutter_bloc is an immutable state management solution.

Concepts
To understand how flutter_bloc differentiates from the vanilla bloc example we have to take a look at the two principles in this package.

Concepts of Bloc[@BlocBloc]
![](Full/flutter_bloc.jpg)
* Events
	* Events are the input to a Bloc provided via interaction with the user interface.
* States
	* States are the output of a bloc and represent a part of the application’s state. They are used inside the UI to build the representative UI state and redraw it when the state changes.
* Streams
	* As previously explained in the vanilla bloc example, streams are a continuous flow of asynchronous data.
* Blocs
	* Are the essential part of the pattern. They convert a stream of incoming event into a stream of outgoing states.

For more concepts likeTransitions and BlocDelegate visit bloclibrary.

Concepts of flutter_bloc [@FlutterBlocBloc]
* BlocBuilder
	* Is a widget which requires a bloc and a builder function. It is very similar to a StreamBuilder but with a simpler API and less amount of boilerplate needed. The builder functions needs to return a widget in response to the state. The builder function can be called multiple times.
* BlocProvider
	* Is a widget that yses the provider[@ProviderFlutterPackage] package by Rémi Rousselet for its dependency injection to inject a bloc inside the widget tree and provide it to descendants.
* BlocListener
	* Is a widget that is used to handle logic that should only happen once when the state changes. Such logic can be navigation. Its listener method is  only called once for each state change in comparison to the BlocBuilder’s builder method which is called multiple times.
* BlocConsumer
	* Is a widget which combines a BlocListener and a BlocBuilder with less amount of boilerplate.

For more concepts like MultiBlocProvider, MultiBlocListener, RepositoryProvider and MultiRepositoryProvider visit bloclibrary.

Implementation
Let’s walk through the implementation of the weather bloc inside the application layer and how it can be accessed in the presentation layer.

Application Layer
Inside the application layer the weather bloc is specified with its three essential concepts: (1) events, (2) states and (3) bloc.

Weather Event is an interface to specify two events: 
1. fetchWeatherForLocation
2. refreshWeatherForLocation

Weather Event
``` dart
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

Weather State is an interface to specify the states our bloc can output which our UI can use to represent its state. It contains four states:
1. Initial
2. Loading
3. loadingFailure
4. Loaded (which contains a WeatherEntity)

Weather State

``` dart
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

Inside our weather bloc class resides the logic of our weather functionality.
Each bloc contains a getter for the initial state which in our case returns `WeatherState.initial()`. Furthermore each bloc contains the method `mapEventToState(WeatherEvent event)` which is responsible to output a stream of `WeatherState` for the corresponding `WeatherEvent`. To keep the method `mapEventToState()` as lean as possible we delegate the logic when a `FetchWeather` event is emitted to the method `_mapFetchWeatherToState()`. Inside this method an asynchronous call is made and depending on the result either `WeatherState.loaded()` with a WeatherEntity or `WeatherState.loadingFailure()` is yielded. During the asynchronous call the WeatherState `WeatherState.loading()` is yielded to indicate that an asynchronous call is taking place.

Weather Bloc

``` dart
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

Not let’s take a look at how the bloc can be accessed in the UI.

Presentation layer

The first step to access the bloc is to use BlocProvider to inject an instance of the bloc to the widget tree. Since multiple blocs need to be injected at this level of the widget tree a MultiBlocProvider has to be used. The injection happens inside the weather app widget which in this example is named FlutterBlocApp.

WeatherApp widget
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

Inside the weather widget the bloc is accessed by using the widget `BlocConsumer`. BlocConsumer is a simplified version of a BlocListener with nested BlocBuilder. In the listener callback the side effect to adapt the theme when the weather changes is being handled. When the weather changes which is represented by the WeatherState `Loaded` an event is added to the `ThemeBloc` which is accessed via `context.bloc<ThemeBloc>()`.
Inside the builder callback the corresponding UI representation for the states `LoadingFailure, Loading, Loaded` is specified.

Weather widget code snippet
``` dart
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

Advantages/Disadvantages
* advantages
	* unidirectional data flow
	* simple API
	* separation of concerns
	* reusable
	* implementation of initial state
	* side effects handled by listeners
* disadvantages
	* still a lot of boilerplate
	* too much overhead for small examples
	* takes time to understand

### Redux

Introduction

For this example I’ve used the redux example of Brian Egan at flutter samples as a reference. [@BrianeganFlutterArchitecture] The example uses the packages redux [@ReduxDartPackage] and flutter_redux.[@FlutterReduxFlutter] Redux is based upon three principles [@Redux]: 

1. Single source of truth
	* The global state of the application is stored in an object tree within a single store.
2. State is read-only
	* the only way to change state is to emit an action, an object describing what happened.
3. Changes are made with pure functions
	* To specify how the state is transformed by actions, you write pure reducers.


Immutable

Redux is one of the immutable state management solutions. The state object is read-only and can only be changed by returning a new state object inside a reducer

Concepts of Redux
The explanation of the following context is taken from the redux example from flutter architecture samples by Brian Egan. [@BrianeganFlutterArchitecture]

* State
	* is an immutable Object that lives at the top of your Widget hierarchy within a `Store`. To create a new `State` an `Action` must be dispatched.
* Store
	* is passed down to all descendants via an `InheritedWidget` the `StoreProvider`.
* Action
	* `Actions` will be picked up by a `Reducer`, which is a function that build and returns a new `State` based on the previous `State` and the `Action` that was dispatched.
* Reducer
	* are pure functions.
* Middleware
	* `Middlewares` run in response to an `Action` that is dispatched and executed before the `Reducer`. This allows you to intercept an `Action` and fetch data in response.
* Selector
	* To read data from the `State` use `selector` functions. 

Let’s take a look at Figure to see Redux in action.
![](Full/redux.jpg)
The UI is a representation of the current state. The UI listens to events from the user and dispatches an action corresponding to the event. The action gets processed by a reducer. Since a reducer is a pure function it can not handle asynchronous calls. This is where the middleware comes into play. The middleware intercepts an action and can be used to process an asynchronous call. When the middleware is finished with the asynchronous call it dispatches a new Action which is being processed by a reducer. The reducer returns a new state object with the data provided by the action. With the new state object the UI rebuilds to represent that state.

Concepts of flutter_redux

* StoreProvider
	* Injects the store into the widget tree and provides it to all descendants in need.
* StoreConnector
	* a descendant Widget which gets the store from the nearest `StoreProvider` ancestor and converts the store into a `ViewModel`. Whenever the store emits a change event the Widget will be rebuild.
* StoreBuilder
	* passes the store down to a Widget’s builder function.

Implementation
Let’s walk through the implementation of Redux in the example. This walkthrough will cover the implementation inside the presentation layer as well as the implementation inside the application layer.

Application Layer

To keep it *lean* only the weather relevant redux components are shown.

* State
	* App State
``` dart
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
To have a separation in concern inside the store, the app state consist multiple smaller state objects. For example WeatherState. This makes it easier to read.

	* Weather State
``` dart
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
WeatherState is an interface that consists of two attributes: (1) WeatherEntity and (2) isRefreshing. The WeatherEntity contains data related to the weather whereas isRefreshing is a flag to mark if the weather data is being fetched or refreshed.

* Actions
``` dart
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
The interface WeatherActions specifies which types of actions can be dispatched to start a process to update the state. Since the state is read-only it can only be changed by an action and therefore all action need to be specified here.

* Middleware

``` dart
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
Since the functionalities to fetch the weather and refresh the weather require an API call they are asynchronous. Due to Redux concept that reducers are pure functions the action to fetch/refresh the weather data needs to be intercepted by a middleware. The middleware intercepts the action and makes the asynchronous call. Depending on the result of the asynchronous call a new Action is being dispatched which then gets processed by its responding reducer.

* Reducers
	* AppState reducer
``` dart
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
Reducers return a new state that represents the updated UI. Since we can have multiple app states the app state is represented by the result of a reducer. And since there are multiple reducers for different actions we have a collection of reducers, e.g. weatherReducer, which is assigned to weatherState.

	* Weather reducer
``` dart
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
`weatherReducer` is a collection of reducers related to weather.

* Selectors
``` dart
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
Sometimes it is necessary to access only single attributes from a state. This is where Selectors come into play. Selectors are pure functions that return the specified attribute.

Presentation Layer

To implement Redux to a Flutter application it needs to be initialised at the beginning of your application - the main. This is the result of its principle as single source of truth.

``` dart
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

Let’s take a look at the weather widget:

``` dart
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

Due to redux strict separation of concerns the ProgressLoadingIndicator had to be moved from the method `_buildUI()` to the widgets `build()` method. The `converter` callback from `StoreConnector` looks for the *store* from the nearest `StoreProvider` and returns the  `isLoading` attribute. The value of `isLoading` is then used to build either a ProgressLoadingIndicator or the UI.

In the method `_buildUI` we also use a `StoreConnector` to connect the UI to the Redux store. The `converter` callback returns the `WeatherState` which is used to determine which UI to build.

Advantages:
* clear separation of concerns
* single source of truth
* easy to test
* immutability

Disadvantages:
* very complex
* difficult to learn
* a lot of boilerplate
* simple functionalities require an overhead to be implemented

### MobX
Introduction
This examples has been build with the help of  Reso Coder’s written MobX tutorial. [@FlutterMobXTutorial2019] 

“MobX is a battle tested library that makes state management simple and scalable by transparently applying functional reactive programming (TFRP). The philosophy behind MobX is very simple:

*Anything that can be derived from the application state, should be derived. Automatically.*

which includes the UI, data serialization, server communication, etc.” [@IntroductionMobX]

Similar to Redux or Bloc MobX has a unidirectional data flow. Furthermore, MobX also uses the concept of a store for its state and actions. But in difference to Redux more than one store can be used.

![](Full/data%20flow.png)
Image from the official mobx.js documentation [@IntroductionMobX]

Actions are fired via Events which can be user interactions or reactions. Actions are the only way to change the State. If computed values are derived from the State they are updated. The State modification automatically triggers reactions if specified.

Mutable

MobX is a mutable state management solution.

Concepts

MobX consists of three core concepts: (1) Observables, (2) Actions and (3) Reactions. [@CoreConcepts]

![](Full/mobx%20concepts.png)
Image of the MobX core concepts 

Observables are the representatives of the reactive application state. This means that when the data of the observable changes it sends a notification to its listeners (Observers). 

Computed Observables are derived from observables. They are based on the philosophy of MobX. The application state is the combination of Observables and Computed Observables. To be more precise application state is the combination of *core-stat*e and *derived-state* where Observables mirror the core-state and Computed Observables the derived-state.

To change the data of an Observable an Action has to be used. Therefore similar to Redux MobX uses the principle of a single source of truth.

Actions can be triggered by events from the user via user interaction or fired by a Reaction. An example for a user triggered Action is the tap of a button. 

Reactions have a special place in the MobX implementation. They are not necessarily needed in an application when the application has no requirements to handle side effects. Side effects are modifications of the state. [@ProgrammingLanguagesWhat] In Flutter an example for a side effect is the automatic navigation to the home page after a successful login.
Reactions can also be used to fire Actions to start a specified process.

Implementation
For the implementation of the MobX example three packages have to be downloaded:

1. mobx [@MobxDartPackage]
2. flutter_mobx [@FlutterMobxFlutter]
3. mobx_codegen [@MobxCodegenDart]

The package mobx provides the concepts, logic and interaction of MobX to the the project.

The package flutter_mobx provides access to the Observable widget. This widget can be used to listen to Observables and rebuild automatically after the observables has been mutated.

The package mobx_codegen provides annotations which can be added to the mobx code to reduce the amount of boilerplate needed. The added annotations are:

* @observable
* @computed
* @action

As usual the code implementation will be separated into application layer and presentation layer for the weather function.

Application layer

To be able to use mobx_codegen the WeatherStore class needs to me mixed with the Store class. With the help of the store mixin the weather store is treated like a store and the annotations can be used.

``` dart
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
Code snippet X: weather_store.dart

As most mutable state management solutions MobX does not implement a way to handle initial state and the developer has to decide how to handle it. In this example an enum has been created to represent the state of the store.

To access the weather store in the application it has to be injected into the widget tree. The injection is done with the help of the provider package inside the weather app widget.

``` dart
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
Code snippet X:  mobx_app.dart a.k.a. weather_app.dart

After the weather store has been injected it can be accessed in any descendant in the tree.

In the method `_buildUI()` the Observable widget provided by flutter_mobx comes into action.

``` dart
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
Code snippet X: weather.dart

The `builder` function of the Observable widget will be monitored by MobX. It tracks all observables and computed observables inside it which in this example is the computed observable  `state`. Whenever a tracked observable or computed observable changes the widget gets rebuild.

Advantages
* no unnecessary boilerplates
	* focus on the key features
	* more “magic”
* easy to learn
* easy to use

Disadvantages
* no mutation history for undo/redo
* more “magic”
	* a lot of logic happens in MobX internally
	* difficult to debug

### States_rebuilder

Introduction
The example has been build following the written tutorial “States Rebuilder - ZERO Boilerplate Flutter State Management” by Reso Coder. [@StatesRebuilderZERO2019] States Rebuilder is a state management solution that is purely written in Dart and comes with an integrated Dependency Injection approach.


Mutable

States Rebuilder can be used as mutable and immutable state management solution. In this example it is used as mutable state management solution.

Concept
The concepts of States Rebuilder are taken out of the README.md of the official dart package. [@StatesRebuilderFlutter]

States Rebuilder implements the Observer-Observable-pattern. 
The Observer-Observable-pattern is a design pattern in object-oriented software which specifies a distinct behaviour. The behaviour is a one-to-many relationship where the change of the the one (Observable) notifies the many (Observers) which triggers an automatic update. [@gamma1994design] 
ReactiveModel is the representation of the observable which multiple Observers can listen to.

ReactiveModel

ReactiveModel is an abstract class which wrapped around a singleton. A singleton “ensure a class only has one instance, and provide a global point of access to it”. [@ gamma1994design] 
The ReactiveModel  exposes specified getters to obtain the last state of the singleton (`state`, `value`) and getters to track the state of the singleton (`isIdle`, `isWaiting`, `hasError` and `hasData`). Furthermore it exposes two methods to mutate the state of the singleton (`setState`, `setValue`).
The singleton can also be accessed as a simple model without the provided getters and methods of the ReactiveModel.

StateBuilder
Is one out of four Observer Widgets which can be used to connect the UI to a ReactiveModel. The other three Observer Widgets are:

* WhenRebuilder
* WhenRebuilderOr
* OnSetStateListener

WhenRebuilder enforces the implementation of UI response for each of the four state states, e.g. `isIdle`.

WhenRebuilderOr in contrast to WhenRebuilder enforces the implementation of a `builder` function and optional parameters for `isIdle` etc.

OnSetStateListener is used to react to side-effects. It reacts to notifications from its defined Observables as any other Observer in States Rebuilder. It differs from the others by having a `child` parameter instead of a `builder` parameter. The difference in these parameters is that `child` will not be rebuild when the Observer receives notifications from its Observables.

Injector 

Injector is a StatefulWidget that is used to register and unregister Models/ReactiveModels, interfaces and flavors. It provides getters to access a registered instance in any descendant in the widget tree.


Implementation

For the examples the package states_rebuilder [@StatesRebuilderFlutter] has to be added to the pubspec.yaml file.

As usual the code implementation will be separated into application layer and presentation layer for the weather function.

Application Layer
In States Rebuilder the model is usually named store. Therefore in the example the model for weather related functionality is called `WeatherStore`.

Inside the `WeatherStore` class no extension or mixin has to be implemented since it will be wrapped by a ReactiveModel.
``` dart
...
/// Used by the reative model in by states_provider.
class WeatherStore {
  /// Holds a reference to `WeatherRepositoryFacade` in the infrastructure layer where the
  /// interface `IWeatherFacade` is implemented.
  final IWeatherFacade _weatherFacade;
  final ReactiveModel<ThemeStore> _themeStore;
  WeatherStore(this._weatherFacade, this._themeStore, this._weatherEntity);

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
    _weatherChanged();
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
    _weatherChanged();
  }

  /// Returns the `WeatherCondition` for the current weather.
  WeatherCondition getWeatherCondition() {
    final Weather _weather = _weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weather.mapConditionToWeatherCondition(_weather.condition);
  }

  /// Notifies the `ReactiveModel<ThemeStore>` to update the theme because the weather changed.
  void _weatherChanged() {
    _themeStore.setState(
        (store) => store.mapWeatherConditionToTheme(getWeatherCondition()));
  }
}
```
Code snippet X: weather_store.dart

In the method `_weatherChanged()` the method `setState` provided by the `ReactiveModel` class is used to mutate the state of the store and imply a notification to its Observers.

Presentation Layer

To access the WeatherStore in the application it needs to be injected into the widget tree. This injection takes place inside the StatesRebuilderApp a.k.a. WeatherApp.
``` dart
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
            _themeStore,
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
Code snippet X: states_rebuilder.dart a.k.a weather app

To access the weather store inside the weather widget we used the Injector widget to get the instance of weather store as ReactiveModel.
``` dart
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
    return Center(child: _buildUI(context));
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
Code snippet X: Weather widget

The Observer widget `StateBuilder` is implemented inside the method `_buildUI()`. The ReactiveModel `_reactiveWeatherStoreModel` is registered as the only observable with the parameter `models`. Therefore the UI gets rebuild whenever StateBuilder receives a notification from WeatherStore. Inside the `builder` parameter the attribute `whenConnectionState` of `reactiveModel` (in this case the Reactive Model registered in `models`)  is used to handle different connections states, e.g. `isIdle`, and build the corresponding UI.

Advantages
* all-in-one package
* easy to use
* easy to learn
* no unnecessary boilerplate

Disadvantages
* strongly coupled to its own Dependency Injection
	* all-or-nothing solution
* hard to master


## Evaluation
The first thing I want to do is remove the state management solutions InheritedWidget and bloc_vanilla from the following evaluation. The reason for this decision is that with Provider a solution has been developed which wraps the Inherited Widget and provides a simplified access. The same advantages come with flutter bloc which provides the bloc pattern with a simplified API and less overhead to worry about.

### Criteria
* How well does it play with the application architecture? How much refactoring had to be done to change it for another solution. (Synergy)
* how easy is it to learn (learning-curve)
* how is the documentation (resources)
	* how many tutorials and guides can be found
* how maintainable is the solution when it comes to large-scale (Maintainability)
* how scalable (Scalability)
* how decoupled (Decoupling)
* boilerplate (Boilerplate)
* how well are side effects handled (Side-effect handling)
* how easy is it to debug (Debugging)
	* state history undo/redo
	* explicit/implicit
### Results

