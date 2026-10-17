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
    
    - %f --> float
    - %d --> int
    - %c --> char
    - %s --> string
    - %lf --> double

    -short int small = -100;                     // smaller int             --> %hd
    - unsigned int count = 25;                    // only positive int      --> %ud
    - long int big = 1234567890;                  // larger int             --> %ld
    - long long int veryBig = 9223372036854775807; // very large int        --> %lld
    - unsigned long long int huge = 18446744073709551615U; // very large, positive --> %llu
    - long double precise = 3.141592653589793238L; // extended precision    --> %Lf
     
 8.  Uses of char

    - char a = 67, z = 122;
    printf("%c", a);
    printf("%c", z);
    A = 65
    Z = 90
    0 = 48
    9 = 57
    
    - char myText = 'Hello';
    printf("%c", myText); --> only prints '0'
    so char myText [] = "Hello" ✅
    
    - char m = 'A'; --> single quote for one character
    char m = "Hello" --> double quote for a string
    
 9.  Uses of float
     
    float myFloatNum = 3.5;
    printf("%.2f\n", myFloatNum); // show 2 digits --> 3.50
    
 10.  Uses of sizeof() : space/bytes in memory

    int myInt;
    float myFloat;
    double myDouble;
    char myChar;

    printf("%zu\n", sizeof(myInt)); --> 4 bytes = (32 bits); each byte = 8 bits
    printf("%zu\n", sizeof(myFloat)); --> 4
    printf("%zu\n", sizeof(myDouble)); --> 8
    printf("%zu\n", sizeof(myChar)); --> 1
     
 11.  Type conversion
 

