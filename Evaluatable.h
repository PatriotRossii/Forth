#pragma once

class Interpreter;

class Evaluatable {
public:
	virtual void evaluate(Interpreter& interpreter) = 0;
};