Day1:
1. gcc is done after every edit on file.c
2. Only a.out compiled file is run
3. every printf should end in a newline or the terminal will add "%" sign
4. printf formula is printf("%.3s", "Hello"); don't forget quotation marks

 Day2:
 1. \t	Inserts a horizontal tab
 2. \\	Inserts a backslash character (\)
 3. \"	Inserts a double quote character.\"
    
 5. // This is a comment
 6. /* The code here is
    commented */
    
 7.  Format specifiers:

    "%.3f"
    %f --> float
    %d --> int
    %c --> char
    %s --> string
    %lf --> double

    short int small = -100;                     // smaller int             --> %hd
    unsigned int count = 25;                    // only positive int      --> %ud
    long int big = 1234567890;                  // larger int             --> %ld
    long long int veryBig = 9223372036854775807; // very large int        --> %lld
    unsigned long long int huge = 18446744073709551615U; // very large, positive --> %llu
    long double precise = 3.141592653589793238L; // extended precision    --> %Lf
     
 8.  Uses of char

```c
    char a = 67, z = 122;
    printf("%c", a);
    printf("%c", z);
    A = 65
    Z = 90
    0 = 48
    9 = 57
```
```c
    char myText = 'Hello';
    printf("%c", myText); --> only prints '0'
    so char myText [] = "Hello" ✅
    
    char m = 'A'; --> single quote for one character
    char m = "Hello" --> double quote for a string
```
 9.  Uses of float
```c 
    float myFloatNum = 3.5;
    printf("%.2f\n", myFloatNum); // show 2 digits --> 3.50
```
    
 10.  Uses of sizeof() : space/bytes in memory
```c
    int myInt;
    float myFloat;
    double myDouble;
    char myChar;

    printf("%zu\n", sizeof(myInt)); --> 4 bytes = (32 bits); each byte = 8 bits
    printf("%zu\n", sizeof(myFloat)); --> 4
    printf("%zu\n", sizeof(myDouble)); --> 8
    printf("%zu\n", sizeof(myChar)); --> 1
```
 11.  Type conversion
```c
 int myInt = 9.99;
 printf("%d", myInt); // 9
```
     
 12.  Conditionals

   a) If Else
```c
  int x = 20;
  int y = 18;

  bool isGreater = x > y;

  if (isGreater) {
  printf("x is greater than y");
}
```

b) Switch 
```c
int day = 4;

switch (day) {
  case 6:
    printf("Today is Saturday");
    break;
  case 7:
    printf("Today is Sunday");
    break;
  default:
    printf("Looking forward to the Weekend");
}
```
b) while 
```c
int i = 0;

while (i < 5) {
  printf("%d\n", i);
  i++;
}
```
c) while do
```c
int i = 10;

do {
  printf("i is %d\n", i);
  i++;
} while (i < 5);
```
⚠️ Be careful
The statement is false but do-while will still run once
--> i is 10

d) for loop 
a countdown
```c
int i;

for (i = 5; i > 0; i--) {
  printf("%d\n", i);
}
```
e) nested loop
```c
int i, j;

// Outer loop
for (i = 1; i <= 2; ++i) {
  printf("Outer: %d\n", i);  // Executes 2 times

  // Inner loop
  for (j = 1; j <= 3; ++j) {
    printf(" Inner: %d\n", j);  // Executes 6 times (2 * 3)
  }
}
```
f) Boolean
```c
bool isProgrammingFun = true;
bool isFishTasty = false;

// Print boolean values
printf("%d\n", isProgrammingFun); // Prints 1 (true)
printf("%d", isFishTasty);        // Prints 0 (false)
```
```c
other boolean,
printf("%d\n", 10 == 10); // Prints 1 (true), because 10 is equal to 10
printf("%d\n", 10 == 15); // Prints 0 (false), because 10 is not equal to 15
```
```c
bool isGreater = x > y;
printf("%d", isGreater); // Prints 1 (true)
```
```c
bool isHamburgerTasty = true;
bool isPizzaTasty = true;

// Check if both have the same value (both true, or both false)
printf("%d", isHamburgerTasty == isPizzaTasty); //Prints 1
```
  
 13.  Arrays
 14.  Strings
 

