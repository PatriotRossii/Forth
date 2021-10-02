#pragma once

#include <istream>
#include <stack>

#include "Value.h"

class Interpreter
{
	std::stack<Value> state;
public:
	void load(std::istream& stream);
	void clear();
	void run();
};

