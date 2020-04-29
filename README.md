# State Management Evaluation

Have you ever found yourself overwhelmed by the amount of state management solutions out there? I definitely did...

And neither the dedicated [chapter](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options) in the flutter documentation nor the [architecture samples](http://fluttersamples.com/) by Brian Egan and contributors could help me to figure out which state management solution is "the right one". And furthermore, it feels like each couple of weeks a new one emerges.

During the Google I/O 2018 the flutter developer team announced BLoC to be their recommended state management solution. A year later they changed their recommendation to ChangeNotifier in combination with Provider. But nonetheless their recommendation they wanted to highlight that there is no "right" solution when it comes to state management in flutter. So does the community. I can totally agree! One should use whatever state management solution one finds himself comfortable using.

But nonetheless as software developers we can agree on one thing: *Use the right tool for the job*

So keeping that in mind the state management solutions can work for the better or worse in example/small/middle/large (-scale) application context. The reason for that is when it comes developing large-scale applications they have different requirements than for example small-scale applications and therefore the focus on the benefits and challenges may vary.

The purpose of this repository is to evaluate different state management solutions in Flutter and give the developer or development team a reference to which solution he/they can use beneficially to develop their application. But in contrast to Brian Egan's samples I want to try a different approach. In his samples the state management solution is influencing the architecture of the application. And I don't think that the state management solution should be that influencial to the architecture.

After doing some research I've found out that the community and I used to use state management and architecture or directory structure interchangeably. But this isn't the case. If you've heard a talk about [clean architecture](https://www.youtube.com/watch?v=NeXQEJNWO5w&t=1100s) by Uncle Bob you should be familiar with the focus on the use cases instead of the tools. And each state management solution by itself is a tool to help with the task of managing state in an application. If the architecture is selected and implemented correctly the state management solution can be swapped easily. 

So influenced by the [Flutter Europe talk](https://www.youtube.com/watch?v=lGv6KV5u75k) about Strategic Domain-Driven-Design by Majid Hajian and the recent [DDD series](https://resocoder.com/category/tutorials/flutter/firebase-ddd/) by Matt Rešetár or better known as Reso Coder, I have decided to implement the different state management solutions into a DDD-architecture and evaluate the outcome.  

The first iteration of this project will include the six options mentioned in the [list of state management approaches](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options) in the documentation and additionally [states_rebuilder](https://pub.dev/packages/states_rebuilder).

___

TODOs for second iteration:

* [state_notifier](https://pub.dev/packages/state_notifier)

* [fish_redux](https://pub.dev/packages/fish_redux)

* [flutter_hooks](https://pub.dev/packages/flutter_hooks)
