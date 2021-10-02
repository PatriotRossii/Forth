#include "Interpreter.h"

#include <string>
#include <sstream>

void Interpreter::load(std::istream& stream)
{
	this->clear();
	for (std::string line; std::getline(stream, line); ) {
		lines.push_back(line);
	}
}

void Interpreter::clear()
{
	this->lines.clear();
	this->state = {};
}

void Interpreter::run()
{
}
