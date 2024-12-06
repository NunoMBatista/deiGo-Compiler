declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08F\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"
@.empty_str = private constant [1 x i8] c"\00"


define i32 @main() {
  %b = alloca i1
  br label %L0cond
L0cond:
  %1 = load i1, i1* %b
  br i1 %1, label %L0body, label %L0end
L0body:
  %2 = load i1, i1* %b
  br i1 %2, label %L1true, label %L1false
L1true:
  br label %L2cond
L2cond:
  %3 = load i1, i1* %b
  br i1 %3, label %L2body, label %L2end
L2body:
  br label %L2cond
L2end:
  br label %L1end
L1false:
  br label %L3cond
L3cond:
  %4 = load i1, i1* %b
  br i1 %4, label %L3body, label %L3end
L3body:
  br label %L3cond
L3end:
  br label %L1end
L1end:
  br label %return
  br label %L0cond
L0end:
return:
  ret i32 0
}

