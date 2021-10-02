#pragma once

#include <istream>

#include <vector>
#include <stack>

#include "Value.h"

class Interpreter
{
	std::vector<std::string> lines;
public:
	std::stack<Value> state;

	void load(std::istream& stream);
	void clear();
	void run();
};

