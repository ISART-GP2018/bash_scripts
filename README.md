# bash_scripts
Some useful bash scripts

## tree.sh
Reinterpreter for the unix ls command, using an unicode tree display, and displaying all subfolders and contents.
The script can also support an optional argument. If given a location as first argument, that location will be shown instead.

	$ ~/path-to-script/tree.sh whatever/folder/you/want/to/see/
	or for current folder:
	$ ~/path-to-script/tree.sh
	

## cppclass.sh
Automatically creates pre-formatted .hpp and .cpp file according to class name and namespaces

	$ ./cppclass.sh Day_01::Ex_01::MyClass
	
Results in:
#### include/Day_01/Ex_01/MyClass.hpp

	#ifndef __MYCLASS_HPP_INCLUDED__
	#define __MYCLASS_HPP_INCLUDED__

	namespace Day_01 {
	namespace Ex_01 {


	class MyClass
	{
	public:
		MyClass() = default;
		MyClass(const MyClass&) = default;
		~MyClass() = default;
		auto	operator = (const MyClass&) -> MyClass& = default;
		
	}


	} // namespace Ex_01
	} // namespace Day_01
	
	#endif // __MYCLASS_HPP_INCLUDED__
  
#### src/Day_01/Ex_01/MyClass.cpp
	#include "Day01/Ex_01/MyClass.hpp"
	
	namespace Day_01 {
	namespace Ex_01 {




	} // namespace Ex_01
	} // namespace Day_01
