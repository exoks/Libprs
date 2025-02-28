# Libprs: Lib parser #
ParserLib is a tiny parsing library that i have created during my 1337 cursus,
It contains the followinig classes and functions:

### Classes & Structs: ### 
- KeyValueParser: parse files that have the form of key-value
- FSM: detect string's type E [CHAR, INT, OPERATOR, DOUBLE, FLOAT, STRING]
- Date
- Exception: a custom exception class, very helpfull for debuging purposes
- PairParser: parse numbers into pairs

### Functions: ###
- `std::string trim(std::string str)`
- `std::string getNextLine(std::istream & stream)`
- `std::string parse(std::string value, std::string strValue)`
- `int parse(int value, std::string strValue)` 
- `double parse(double value, std::string strValue)`
- `Date parseDate(std::string strDate)`
- `bool isValidDate(Date date)`
- `bool isValidDate(std::string strDate)`
- `Date getCurrentDate(void)`
- `int dateCmp(Date d1, Date d2)`
- `t_ld getTimeReference(void)`
- `t_ld getTimeToReference(t_ld reference)`
---
## Usage ##
- Run The following shell command :
- `make or make all`
