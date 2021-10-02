#pragma once

#include "Evaluatable.h"

enum class ValueType {
	INTEGER,
};

union ValueRepresentation {
	int integerValue;

	ValueRepresentation(int value) : integerValue(value) { }
};

class Value: Evaluatable
{
	ValueType type;
	ValueRepresentation repr;

	Value(int value): type(ValueType::INTEGER), repr(value) { }

	void evaluate(Interpreter& interpreter) override;
};

