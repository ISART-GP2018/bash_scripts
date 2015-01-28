# bash_scripts
Some useful bash scripts

## tree.sh
Reinterpreter for the unix ls command, using an unicode tree display, and displaying all subfolders and contents.
The script can also support an optional argument. If given a location as first argument, that location will be shown instead.

	$ ~/path-to-script/tree.sh whatever/folder/you/want/to/see/
	or for current folder:
	$ ~/path-to-script/tree.sh
	

## cppclass.sh
Automatically creates pre-formatted .h and .cpp file according to class name and namespaces

	$ ./cppclass.sh Day_01::Ex_01::MyClass
	
Results in:
####MyClass.h

	#ifndef __MYCLASS_H_INCLUDED__
	#define __MYCLASS_H_INCLUDED__

	namespace Day_01 {
	namespace Ex_01 {

	class MyClass {

	}


	} // namespace Ex_01
	} // namespace Day_01
	
	#endif // __MYCLASS_H_INCLUDED__
  
#### MyClass.cpp
	#include "MyClass.h"
	
	namespace Day_01 {
	namespace Ex_01 {


	class MyClass {

	}


	} // namespace Ex_01
	} // namespace Day_01
