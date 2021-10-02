#include "Value.h"

#include "Interpreter.h"

void Value::evaluate(Interpreter& interpreter) {
	interpreter.state.push(
		*this
	);
}