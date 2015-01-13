# bash_scripts
Some useful bash scripts

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
