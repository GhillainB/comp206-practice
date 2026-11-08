##
### ⚠️‼️⛔️ 
- ### In C, 0 means False/Error (or success for strcmp/main),
- ### and 1 means True/Success.
##
- ### In Bash, 0 means Success (Exit Code 0),
- ### and any non-zero number (1 to 255) means Error.
##

## 
```c
You cannot use the [] array bracket syntax when assigning the result of calloc.
char sort1[]=(char)calloc(strlen(s1)+1,sizeof(s1[0]));🚫

• char sort1[] tells the compiler to allocate fixed stack space right now.
• calloc allocates dynamic heap space and gives you back a memory address.
• To hold a memory address, the variable must be a pointer (char *sort1).

char *sort1 = (char*) calloc(strlen(s1) + 1, sizeof(s1[0])); ✅

```
##

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

     /* The code here is
    commented */
    
## 6. Includes
```c
#include <stdio.h> // I/O input output operations: printf, scanf, fgets
#include <string.h> // strlen, strcpy, strcmp
#include <stdlib.h> // malloc
#include <ctype.h> // isupper, isalnum, tolower
#include <stdbool.h> // bool istrue = true;
```
 
    
 ## 7.  Format specifiers:
```c
    "%.3f"
    %f --> float
    %d --> int
    %c --> char
    %s --> string
    %lf --> double
    %p --> address // printf("%p", &myAge); // Outputs 0x7ffe5367e044
                   // int* ptr = &myAge;
                   // printf("%p\n", ptr); // Outputs 0x7ffe5367e044
                   // pointers store address

    short int small = -100;                     // smaller int             --> %hd
    unsigned int count = 25;                    // only positive int      --> %ud
    long int big = 1234567890;                  // larger int             --> %ld
    long long int veryBig = 9223372036854775807; // very large int        --> %lld
    unsigned long long int huge = 18446744073709551615U; // very large, positive --> %llu
    long double precise = 3.141592653589793238L; // extended precision    --> %Lf
```
 ## 8.  Uses of char

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
 ## 9.  Uses of float
```c 
    float myFloatNum = 3.5;
    printf("%.2f\n", myFloatNum); // show 2 digits --> 3.50
```
    
 ## 10.  Uses of sizeof() : space/bytes in memory
```c
    int myInt;
    float myFloat;
    double myDouble;
    char myChar;

    printf("%zu\n", sizeof(myInt)); --> 4 bytes = (32 bits); each byte = 8 bits
    printf("%zu\n", sizeof(myFloat)); --> 4
    printf("%zu\n", sizeof(myDouble)); --> 8
    printf("%zu\n", sizeof(myChar)); --> 1

int arr[]={10,20,30,40,50}
printf("%zu\n", sizeof(arr)); --> int(4 bytes) x arrindex(5) = 20

```
 ## 11.  Type conversion
```c
 int myInt = 9.99;
 printf("%d", myInt); // 9
```
     
 ## 12.  Conditionals

   ### a) If Else
```c
if (condition1) {
    // Executes if condition1 is true
} else if (condition2) {
    // Executes if condition1 is false and condition2 is true
} else {
    // Executes if all previous conditions are false
}
```
```c
  int x = 20;
  int y = 18;

  bool isGreater = x > y;

  if (isGreater) {
  printf("x is greater than y");
}
```
```c
One-lined if statement

condition ? expression_if_true : expression_if_false;
int max = (a > b) ? a : b;

```
### b) Switch 
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
### c) while 
```c
int i = 0;

while (i < 5) {
  printf("%d\n", i);
  i++;
}
```
### c) while do
```c
int i = 10;

do {
  printf("i is %d\n", i);
  i++;
} while (i < 5);
```
### ⚠️ Be careful
The statement is false but do-while will still run once
--> i is 10

### d) for loop 
a countdown
```c
int i;

for (i = 5; i > 0; i--) {
  printf("%d\n", i);
}
```
### e) nested loop
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
### f) Boolean
```c
#include <stdbool.h>

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
  
 ## 13.  Arrays

### Modification
```c
int myNumbers[] = {25, 50, 75, 100};
myNumbers[0] = 33;

printf("%d", myNumbers[0]);   // Now outputs 33 instead of 25
```

### Length
```c
int myNumbers[] = {10, 25, 50, 75, 100};
int length = sizeof(myNumbers) / sizeof(myNumbers[0]);

printf("%d", length);  // Prints 5
```

### Multidimensional
```c
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };
printf("%d", matrix[0][0]);

2D arrays (like int scores[3][4]) are great for storing things like scores, game boards, or spreadsheets
3D arrays (like int cube[2][3][4]) can represent more complex structures like a set of tables or levels in a game
```
 
 ## 14.  Strings

### Modify
```c
char greetings[] = "Hello World!";
greetings[0] = 'J';
printf("%s", greetings);

// Outputs Jello World! instead of Hello World!
```

### Null Character
```c
char greetings[] = "Hello";
printf("%zu", sizeof(greetings));  // 6 = H-e-l-l-o-\0

--> The Null character (created by C when you use double quotes " " ) helps C know where the string ends
```

### Looping
```c
#include <string.h>

char carName[] = "Volvo";
int length = strlen(carName); // strlen (thanks to string.h) ≠ sizeof counts \0
int i;

for (i = 0; i < length; ++i) {
  printf("%c\n", carName[i]);
}
```

### Few additions
```c
char txt[] = "We are the so-called \"Vikings\" from the north.";  // use one backlash to escape a special character
char txt[] = "It\'s alright.";
```

## String functions

### 1. Concatenate
```c
char str1[20] = "Hello ";
char str2[] = "World!";

// Concatenate str2 to str1 (result is stored in str1)
strcat(str1, str2);

// Print str1
printf("%s", str1);  // Hello World!
```
### 2. String length
```c
char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
printf("%zu\n", strlen(alphabet));   // 26
printf("%zu\n", sizeof(alphabet));   // 27

char alphabet[50] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
printf("%zu\n", strlen(alphabet));   // 26
printf("%zu\n", sizeof(alphabet));   // 50
```
### 3. Copy
```c
char str1[20] = "Hello World!";
char str2[20];

// Copy str1 to str2
strcpy(str2, str1);

printf("%s", str2); // Hello World!
```
### 4. Compare
```c
char str1[] = "Hello";
char str2[] = "Hello";
char str3[] = "Hi";

// Compare str1 and str2, and print the result
printf("%d\n", strcmp(str1, str2));  // Returns 0 (the strings are equal)

// Compare str1 and str3, and print the result
printf("%d\n", strcmp(str1, str3));  // Returns -4 (the strings are not equal) --> the exact number differs with complilers
```

## 15. Character Char functions
```c
#include <ctype.h>
```
### Character functions
```c
Function      Returns True
isalpha()	--> a letter	'a', 'Z'
isdigit()	--> a digit	'0', '7'
isalnum()	--> a letter or a digit	'a', '7'
isupper()	--> an uppercase letter	'A', 'Z'
islower()	--> a lowercase letter	'a', 'z'
isspace()	--> white space, like a space, a tab or a new line	' ', '\n'
```
### Change character
```c
printf("%c\n", toupper('a'));  // A
printf("%c\n", tolower('B'));  // b
printf("%c\n", toupper('7'));  // 7 --> not a letter, remains unchanged
```
### Password case
```c
char password[] = "Secret42";
int hasUpper = 0;
int hasDigit = 0;
int i;

for (i = 0; i < strlen(password); i++) {
  if (isupper(password[i])) {
    hasUpper = 1;
  }
  if (isdigit(password[i])) {
    hasDigit = 1;
  }
}

if (hasUpper && hasDigit) {
  printf("The password is OK\n");
} else {
  printf("The password needs an uppercase letter and a digit\n");
}
```

 ## 16.  String Array
```c
char str[5] = "code";     ---->     {'c', 'o', 'd', 'e', '\0'}; // Becomes a valid string = " " adds the null character
char normal_array[4] = {'c', 'o', 'd', 'e'}; // Just a character array, NOT a safe string = printf wont know where to stop, lacking \0
```
### Looping
```c
char fruits[3][10] = {"Apple", "Banana", "Cherry"};
int count = sizeof(fruits) / sizeof(fruits[0]);   // strlen only helps a single string since it's stopped by null
int i;

printf("Number of strings: %d\n", count);   // Number of strings: 3 --> 30/10

for (i = 0; i < count; i++) {
  printf("%s\n", fruits[i]);
}
//Apple
//Banana
//Cherry
```
### Change a string
```c
char fruits[3][10] = {"Apple", "Banana", "Cherry"};

strcpy(fruits[0], "Mango");       --> fruits[0] = "Mango";  // Error
printf("%s\n", fruits[0]);   // Mango
```
```c
⚠️This doesn't work:
    char message[];
    message[] = "Hello";

Arrays cannot be reassigned by =

    char message[20]; //specify the size
    strcpy(message, "Hello");
```
 
 ## 17.  User input scanf vs fgets
```c
int myNum;
char myChar;

// Ask the user to type a number AND a character
printf("Type a number AND a character and press enter: \n");

// Get and save the number AND character the user types
scanf("%d %c", &myNum, &myChar);

printf("Your number is: %d\n", myNum);
printf("Your character is: %c\n", myChar);
```
```c
⚠️ --> Array name = address
char firstName[30];

// Ask the user to input some text
printf("Enter your first name: \n");

// Get and save the text
scanf("%s", firstName);

printf("Hello %s", firstName);
```
```c
char fullName[30];

printf("Type your full name: \n");
scanf("%s", fullName);
printf("Hello %s", fullName);

// Type your full name: John Doe
// Hello John

💡
printf("Type your full name: \n");
fgets(fullName, sizeof(fullName), stdin);
printf("Hello %s", fullName);

// Type your full name: John Doe
// Hello John Doe
```
### Formula
```c
scanf("format_specifier", &variableName);
fgets(&variableName, sizeof(variableName), stdin); // fgets(&variableName, size, stdin);

/* For primitive variables (int, char, float, double):
Always use & (e.g., &myNum, &myChar) because they don't automatically decay into addresses.

For character arrays / strings (char fullName[30]):
Never use &. The array name is the address! */
```
### ⛔️ fgets reads file through file pointers
### to be continued...
 
 ## 18.  Pointers
```c
int myAge = 43;
int* ptr = &myAge; // "&" To get memory address

printf("%p", &myAge); // Outputs 0x7ffe5367e044
printf("%p\n", ptr);  // Outputs 0x7ffe5367e044
printf("%d\n", *ptr); // Outputs 43     --> "*" Dereference

// pointers store address
```
### Change Value
```c
int myAge = 43;     // Variable declaration
int* ptr = &myAge;  // Pointer declaration

// Change the value of myAge with the pointer
*ptr = 50;

// Output the new value of myAge (50)
printf("%d\n", myAge);
```
```c
int myNumbers[4] = {25, 50, 75, 100};
// Change the value of the first element to 13
*myNumbers = 13;

// Change the value of the second element to 17
*(myNumbers + 1) = 17;
```
### ⚠️
```c
int *a, b;🚫
int *a, *b; ✅
```
### Pointers and Arrays
```c
int myNumbers[4] = {25, 50, 75, 100};

// it's like int *myNumbers = &myNumbers[0]

printf("%p\n", myNumbers);  // Get the memory address of the myNumbers array
printf("%p\n", &myNumbers[0]); // Get the memory address of the first array element

printf("%d", *myNumbers); // Get the value of the first element in myNumbers

Results:
0x7ffe70f9d8f0
0x7ffe70f9d8f0
25

myNumbers[1] 🟰 *(myNumbers + 1)

```
### Looping in array
```c
int myNumbers[4] = {25, 50, 75, 100};
int *ptr = myNumbers;
int i;

for (i = 0; i < 4; i++) {
  printf("%d\n", *(ptr + i));
}
```
### Or
```c
printf("%d\n", *(myNumbers + 1)); // Second element
printf("%d", *(myNumbers + 2)); // Third element in myNumbers
```
### Case study: Distance
```c
int myNumbers[5] = {10, 20, 30, 40, 50};
int *start = &myNumbers[1]; // points to 20
int *end = &myNumbers[4];   // points to 50

int distance = end - start;
printf("%d\n", distance); // 3 elements apart
```
### Pointer to Pointer: Passing pointers to functions / working with complex data structures
```c
int myNum = 10;       // normal variable
int *ptr = &myNum;    // pointer to int
int **pptr = &ptr;    // pointer to pointer

printf("myNum = %d\n", myNum);    // myNum = 10
printf("*ptr = %d\n", *ptr);      // *ptr = 10
printf("**pptr = %d\n", **pptr);  // **pptr = 10

💡
**pptr = 20; // changes myNum
printf("myNum = %d\n", myNum); // prints 20
```

 ## 19. Functions
 ### When returnType is void
```c
void myFunction(char name[], int age) {
  printf("Hello %s. You are %d years old.\n", name, age);
}

int main() {
  myFunction("Liam", 3);
  return 0;
}

// Hello Liam. You are 3 years old.
```
### Other returnTypes
```c
int myFunction(int x) {
  return 5 + x;
}

int main() {
  printf("Result is: %d", myFunction(3));
  return 0;
}

// Outputs 8 (5 + 3)
```
### ⚠️ Why we need pointers 
### Functions receiving arguments as values cannot be used to change values
### They only create copies, the original fails to change
```c
void addTen(int x) {
  x = x + 10;
}

int main() {
  int myNum = 5;
  addTen(myNum);
  printf("%d\n", myNum); // 5
  return 0;
}
```
### Getting the sum requires a return but you cant print myNum and get something else
```c
#include <stdio.h>

int addTen(int x) {
  return x + 10;
}

int main() {
  int myNum = 5;
  myNum = addTen(myNum);
  printf("%d\n", myNum);  // 15
  return 0;
}
```
### Function pass by value vs by reference (argument)
### The First code but allow original value to be changed by function
```c
void addTen(int *x) {
  *x = *x + 10;
}

int main() {
  int myNum = 5;
  addTen(&myNum);
  printf("%d\n", myNum); // 15
  return 0;
}
```
### 💡 This is how scanf("%d%, &myNum) manages to edit value of something by taking memory address

## 20. Math Functions
```c
#include <math.h>

printf("%f", sqrt(16));  // 4.000000

printf("%f\n", ceil(1.4));   // 2.000000
printf("%f\n", floor(1.4));  // 1.000000

printf("%f", pow(4, 3));  // 64.000000 --> x power y in (x,y)
```

## 21. Recursion in C
```c
int sum(int k) {
  if (k > 0) {
    return k + sum(k - 1);
  } else {
    return 0;
  }
}

int main() {
  int result = sum(3);
  printf("%d", result);
  return 0;
}

sum(3) = 3 + sum(2)
sum(2) = 2 + sum(1)
sum(1) = 1 + sum(0)
sum(0) = 0

sum(3) = 3 + sum(2) --> 3 + 3 = 6
sum(2) = 2 + sum(1) --> 2 + 1 = 3
sum(1) = 1 + 0 = 1
sum(0) = 0

```
## 22. Function pointers: Menu, Calculators, Command Lists
### Rules:
```c
returnType (*pointerName)(parameterType1, parameterType2, ...); // declaring a function pointer
int (*ptr)(int, int);   // a pointer to a function that takes two int values and returns an int

ptr = add; // Both Assignment work
ptr = &add;

ptr(5, 3);
(*ptr)(5, 3); // Both Calling work

```
```c
void greet(void (*func)()) {
  func();  }
// function greet takes a pointer function (with no parameter) and calls it, returning void
// Function (void (*func)()) is called a "Callback function" --> called from elsewhere

```
```c
// Calling back something that has parameters

void calculate(void (*callback)(int, int), int x, int y) {
  callback(x, y);
}

int main() {
  calculate(addNumbers, 5, 3);
  return 0;

```
```c
int main() {
  void (*operations[3])() = { add, subtract, multiply };   // Function pointer array --> pointing to several functions
  for (int i = 0; i < 3; i++) {
    operations[i]();
  }
  return 0;
}
```
### A calculator with an array of function pointers
```c
#include <stdio.h>

void add(int a, int b) { printf("Result: %d\n", a + b); }
void subtract(int a, int b) { printf("Result: %d\n", a - b); }
void multiply(int a, int b) { printf("Result: %d\n", a * b); }

int main() {
  int choice, x = 10, y = 5;

  void (*operations[3])(int, int) = { add, subtract, multiply };

  printf("x = %d, y = %d\n\n", x, y);
  printf("Choose an operation:\n");
  printf("0: Add\n1: Subtract\n2: Multiply\n");
  scanf("%d", &choice);

  if (choice >= 0 && choice < 3) {
    operations[choice](x, y);
  } else {
    printf("Invalid choice!\n");
  }

  return 0;
}
```
## 23. Structures struct
```c
// Create a structure called myStructure
struct myStructure {
  int myNum;
  char myLetter;
  char myString[30]; // String
};

int main() {
  // Create a structure variable of myStructure called s1
  struct myStructure s1;

  // Assign values to members of s1
  s1.myNum = 13;
  s1.myLetter = 'B';
  strcpy(s1.myString, "Some text");   // Instead of s1.myString = "Some text"; ⚠️

  // Print values
  printf("My number: %d\n", s1.myNum);
  printf("My letter: %c\n", s1.myLetter);
  printf("My string: %s", s1.myString);

  return 0;
}
```
### Or simply 💡 ✅
```c
int main() {
  // Create a structure variable and assign values to it
  struct myStructure s1 = {13, 'B', "Some text"};

  // Print values
  printf("%d %c %s", s1.myNum, s1.myLetter, s1.myString);

  return 0;
}
```
### A Car Template
```c
struct Car {
  char brand[30];
  char model[30];
  int year;
};

int main() {
  struct Car car1 = {"BMW", "X5", 1999};
  struct Car car2 = {"Ford", "Mustang", 1969};
  struct Car car3 = {"Toyota", "Corolla", 2011};

  printf("%s %s %d\n", car1.brand, car1.model, car1.year);
  printf("%s %s %d\n", car2.brand, car2.model, car2.year);
  printf("%s %s %d\n", car3.brand, car3.model, car3.year);

  return 0;
}
```
### struct can be copied to another member and also modified

### A Struct ends with ";" ⚠️⛔️❗️❗️... unlike a function: End struct with "};"

## 24. Files




