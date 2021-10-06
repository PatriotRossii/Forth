#include <stack>

#include <llvm/IR/Value.h>
#include <llvm/IR/IRBuilder.h>

// Forth program: 1 2 3 +
// --------------------------
// LLVM IR program:

// %a = i32 0
// %b = add i32 2, 3
// --------------------------


int main() {
	llvm::IRBuilder builder;
	std::stack<llvm::Value*> stack;

	stack.push(
		builder.getInt32(0)
	);
	stack.push(
		builder.CreateAdd(
			builder.getInt32(2),
			builder.getInt32(3)
		)
	);
}