# DateCalculator

These files are in Objective-C and was ran on X-Code

The following is the actual assignment:

Design a date class that has at least three instance variables:

day
month
year
 

The constructor for the class should return a pointer to a date if the date is legal and null otherwise.

 

 This class should have at the following instance methods:

(BOOL) isBefore: (Date) d (returns true if the date of the object is before date d, false otherwise)
(int) daysUntil: (Date) d (returns the number of days until days d, the result should be negative is d is before the objects date)
(Date) nextWeek:  (returns the date one week from now)
(NSString) toString:  (returns the date as a NSString)
 

The app should have:

labels
textfields for inputs
buttons to activate functions
look aesthetically pleasing
 

There are increasing levels of difficulty for this assignment that you may choose:

have separate text boxes for each field (day, month, year)
have the entire date entered as a string in a text field and parse an NSString object using NSString methods into integers.
Use the UI Datepicker control to get the dates, read them when the button is pressed, and convert them to integers.
 

Important notes:

You must do the date calculations. Do not use functionality of the NSDate class.
You may use ints or the wrapper class NSInteger.
You may create extensions…
