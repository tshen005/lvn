#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include <string>
#include <unordered_map>
#include <map>
#include <algorithm>

using namespace llvm;
using namespace std;

#define DEBUG_TYPE "ValueNumbering"

using namespace llvm;

namespace {
struct ValueNumbering : public FunctionPass {
    
    static char ID;
    ValueNumbering() : FunctionPass(ID) {}


    bool findInMap(map<pair<Value*, int>, int> valueMap, Value * v){
        for(auto it = valueMap.begin(); it != valueMap.end();++ it){
            if(it->first.first == v) return true;
        }
        return false;
    }

    bool runOnFunction(Function &F) override {
        errs() << "ValueNumbering: ";
        errs() << F.getName() << "\n";

        for (auto& basic_block : F){
            map<Value*, int> varToVersion;              // map the variable to its latest version number
            map<pair<Value*, int>, int> valueMap;       // map the variable to version number and value number
            map<int, pair<Value*,int>> valueMap_re;     // map the value number to variable and its version number
            map<string, int> exprMap;
            int counter = 1;

            for (auto& inst : basic_block){
                
                if (inst.isBinaryOp()){
                    //errs() << "Op Code:" << inst.getOpcodeName()<<"\n"; // print opcode name
                    
                    Value* v1 = inst.getOperand(0); // left  oprand
                    Value* v2 = inst.getOperand(1); // right oprand

                    int vn1;   // the VN of left oprand
                    int vn2;   // the VN of right oprand

                    if(!findInMap(valueMap, v1)){   // if not found in hash table
                        valueMap.insert(make_pair(make_pair(v1, 0),counter));
                        valueMap_re[counter] = make_pair(v1, 0);   // assign a new VN to the variable
                        varToVersion[v1] = 0;
                        vn1 = counter;
                        counter ++;
                    }
                    else{                            // if found in hash table
                        vn1 = valueMap.at(make_pair(v1, varToVersion[v1]));
                    }

                    if(!findInMap(valueMap, v2)){
                        valueMap.insert(make_pair(make_pair(v2, 0),counter));
                        valueMap_re[counter] = make_pair(v2, 0);
                        varToVersion[v2] = 0;
                        vn2 = counter;
                        counter ++;
                    }
                    else{
                        vn2 = valueMap.at(make_pair(v2, varToVersion[v2]));
                    }
                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
                
                    string op;
                    if(inst.getOpcode() == Instruction::Add) op = "+";
                    if(inst.getOpcode() == Instruction::Sub) op = "-";
                    if(inst.getOpcode() == Instruction::Mul) op = "*";
                    if(inst.getOpcode() == Instruction::SDiv) op = "/";

                    if(inst.isCommutative()) {
                        if(vn1 > vn2) swap(vn1, vn2);
                    }

                    string expr = to_string(vn1) + op + to_string(vn2);

                    Value* ptr = dyn_cast<Value>(&inst);
                    if(varToVersion.find(ptr) == varToVersion.end()){
                        varToVersion.insert(make_pair(ptr, 0));
                    }

                    if(exprMap.find(expr) == exprMap.end()) {
                        exprMap[expr] = counter;
                        if(!findInMap(valueMap, ptr)){
                            valueMap.insert(make_pair(make_pair(ptr, 0),counter));
                            valueMap_re[counter] = make_pair(ptr, 0);
                        }
                        else{
                            varToVersion[ptr] += 1;
                            valueMap.insert(make_pair(make_pair(ptr, varToVersion[ptr]),counter));
                            valueMap_re[counter] = make_pair(ptr, varToVersion[ptr]);
                        }
                        ++ counter;
                    }
                    else{
                        int tmp_counter = exprMap[expr];

                        errs() << "Redunant Computation: " << *ptr << "\n";
                        if(!findInMap(valueMap, ptr)){
                            valueMap.insert(make_pair(make_pair(ptr, 0),tmp_counter));
                            valueMap_re[tmp_counter] = make_pair(ptr, 0);
                        }
                        else{
                            varToVersion[ptr] += 1;
                            valueMap.insert(make_pair(make_pair(ptr, varToVersion[ptr]),tmp_counter));
                            valueMap_re[tmp_counter] = make_pair(ptr, varToVersion[ptr]);
                        }
                    }
                    
                }
                
            }
            /*for(auto it = valueMap.begin(); it != valueMap.end();++ it){
                errs() << *(it->first.first) << " " << it->second << "\n";
            }*/
        }
        errs() << "\n\n\n";
        return false;
    }
}; // end of struct ValueNumbering
}  // end of anonymous namespace

char ValueNumbering::ID = 0;
static RegisterPass<ValueNumbering> X("ValueNumbering", "ValueNumbering Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);