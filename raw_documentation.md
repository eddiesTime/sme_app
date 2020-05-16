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
_Code snippet 1: declarative programming example_

Code snippet 1 shows an example of Flutter declarative nature. As you can see, a `main()` method is declared, which returns a `Center` Widget, which holds a `Text` Widget. These declarations are all we need to tell Flutter to build a text in the center of the screen. No specification of what it needs to do to get the text to the screen had to be written.

I have mentioned Widgets a couple of times in the previous paragraph. So let's take a look at what widgets are in the next section.

#### 1.1.1 It's all widgets

To explain what widgets are and their role in Flutter I will reference the official Flutter documentation. [@TechnicalOverview]

In Flutter everything's a widget. 

| :closed_book:      | Widget |  A widget is an immutable description of part of a user interface. [@WidgetClassWidgets]     |
|--------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

Widgets are the basic building blocks of an application's user interface (UI). Custom widgets can be composed of smaller widgets and the overall composition of all widgets represents the UI. The following image visualises this concept:

|![equation](https://i.imgur.com/DoY8u5y.png)|
|:--:| 
|_How Flutter builds its UI_ [@StartThinkingDeclaratively]|

Since widgets are the building blocks of the UI we can assume that they equal the right side of the equation.

#### 1.1.2 Types of Widgets (stateless, stateful, inherited)

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
