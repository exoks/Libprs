# Libprs - A Lightweight C++ Parsing Library #
**Libprs** is a small parsing library that I created during my 1337 cursus.
It contains the following classes and functions:

## **Available Classes & Structs** ## 
1. `FSM`: Detects a string's type among [`CHAR`, `INT`, `OPERATOR`, `DOUBLE`, `FLOAT`, `STRING`].
  - **Functions :**
    - `static int	getNextState(int prv, char input)`; (Private | Static)

    - `static int	detectType(std::string str)`; (Public | Static) 

---

2. `KeyValueParser`: Parses files with a **key-value** format.
    - **Attributes :**
      - `std::string  fileName`;    (Private) 

      - `std::fstream  fileStream`; (Public)
    - **Functions :**
      - `std::map<p1, p2>  parseFile(void)`;  

      - `std::pair<p1, p2> parseNextLine(void)`;  

      - `std::string       skipLine(void)`;  

      - `bool              eof(void)`;

---

3. `PairParser`: Parses numbers into pairs.
    - **Attributes :**
      - `char	**av`;  (Private)  

      - `int  ac`;    (Private)  
    - **Functions :**  
      - `Container	parseArgs(void)`  

---

- `Exception`: A custom exception class, very useful for debugging.
    - **Attributes :**
      - `std::string	msg`; (Protected)
    - **Functions :**  
      - `virtual const char	*what() const throw()`;  

---

- `Date`: Handles date parsing and manipulation. (Struct)
  - `std::string  trim(std::string str)`;  

  - `Date         parseDate(std::string sDate)`;  

  - `bool         isValidDate(Date date)`;  

  - `bool         isValidDate(std::string sDate)`;  

  - `Date         getCurrentDate(void)`;  

  - `int          dateCmp(Date d1, Date d2)`;  

  - `t_ld         getTimeReference(void)`;  

  - `t_ld         getTimeToReference(t_ld reference)`;  

---

- **Other Functions**  
  - `std::string   parse(std::string value, std::string sValue)`;  

  - `int           parse(int value, std::string sValue)`;  

  - `double        parse(double value, std::string sValue)`;  

  - `std::string   trim(std::string str)`;  

  - `std::string   getNextLine(std::istream & stream)`;  

## **Building the Library** ##
**Libprs** supports both **static** and **shared** library generation through the provided **Makefile**.

### **Generating a Static Library (`libprs.a`)**
To compile the **static** version of the library, run:
```sh
make
``````

Or 

```sh
make static
```
### **Generating a Shared Library (`libprs.so`)**
To compile the **static** version of the library, run:
```sh
make shared 
```
## **Using the Library** ##
To compile your program with `libprs.a`, use one of the following methods:

#### - Direct Linking ####
```bash
c++ -Wall -Wextra -Werror -Iinclude test.cpp libprs.a -o foo 
```
Or

#### - Using the Library Flag ####
```bash
c++ -Wall -Wextra -Werror -Iinclude test.cpp -L. -lprs -o foo
```

> NOTE  
> - Replace `test.cpp` with your actual source file.

## **Cleanup** ##
- To remove Object files, run:
```bash
make clean
```

- To remove `libprs.a`, `libprs.so` and object files, run:
```bash
make fclean
```
---
