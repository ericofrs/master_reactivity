# Excercise answers

## Part 1

1. In this case, both fuctions store data that can be retrieved later. The difference between `reactive()` and `eventReactive()` in Shiny is related to the fact that the first one is triggered when any input changes, while the triggered of the second depends on an specific input (e.g., button). `reactive()` is preferred when we need real-time updates and/or dynamic outputs, while `eventReactive()` can be used for button-driven data, controlled updates or processing expensive tasks (a great solution to reduce reacivity of the app).
2. For these two functions, no data is stored that can be retrived later in the code, but they run pieces of code after a trigger-event. For `observe()`, this event can be any input change, while for `observeEvent()`, it reacts after a button is clicked (for example). Examples for the first could be: notification after a field is filled, notification after an input value is selected, salutation when the user logs in or does another activity in the session. Examples of the second can be: success notification after the "send files" button is clicked, alert notification when the "delete" button is clicked.
3. `reactiveValues()` or `reactiveVal()` are required for some Shiny applications because it stores values or a value that can be mutated. So if the new value depends on the previous value, using simply `reactive()` will not be the correct solution. In summary: use reactiveValues() when you need to store and update values persistently. reactive() is better suited for reactive computations that should be recomputed dynamically but not retain state across events.
4. When using reactive content, we must encapsulate it in a reactive function (context), so that the app can read it. When we try to use it in another way, we will face errors.
5. The output is updated because on the server, we define the output that will be updated after an input value is modified.

## Part 2

