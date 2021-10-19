#include <memory>

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>

using namespace llvm;

class Forth {
    std::unique_ptr<LLVMContext> context;
    std::unique_ptr<IRBuilder<>> builder;
    std::unique_ptr<Module> module;

    void initialize() {
        context = std::make_unique<LLVMContext>();
        module = std::make_unique<Module>("forth", *context);
        builder = std::make_unique<IRBuilder<>>(*context);
    }

    Forth() {
        initialize();
    }
};
