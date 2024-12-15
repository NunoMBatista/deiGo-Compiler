@.str_int = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.str_float = private unnamed_addr constant [7 x i8] c"%.08F\0A\00"
@.str_true = private unnamed_addr constant [6 x i8] c"true\0A\00"
@.str_false = private unnamed_addr constant [7 x i8] c"false\0A\00"
@.str_string = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@.empty_str = private unnamed_addr constant [1 x i8] c"\00"

declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@logic_result = global i1 false



define i32 @_factorial(i32 %n, i32 %acc) {
.label0:
  %0 = alloca i32
  %n.addr = alloca i32
  store i32 %n, i32* %n.addr
  %acc.addr = alloca i32
  store i32 %acc, i32* %acc.addr
  %1 = load i32, i32* %n.addr
  %2 = add i32 0, 0
  %3 = icmp eq i32 %1, %2
  br i1 %3, label %.label1, label %.label2
.label1:
  %4 = load i32, i32* %acc.addr
  store i32 %4, i32* %0
  br label %return
.label2:
  %5 = load i32, i32* %n.addr
  %6 = add i32 1, 0
  %7 = sub i32 %5, %6
  %8 = load i32, i32* %n.addr
  %9 = load i32, i32* %acc.addr
  %10 = mul i32 %8, %9
  %11 = tail call i32 @_factorial(i32 %7, i32 %10)
  store i32 %11, i32* %0
  br label %return
.label4:
  br label %return
return:
  %12 = load i32, i32* %0
  ret i32 %12
}

define i32 @main(i32 %argc, i8** %argv) {
.label0:
  %0 = sub i32 %argc, 1
  %argc.addr = alloca i32
  store i32 %argc, i32* %argc.addr
  %i = alloca i32
  %b1 = alloca i1
  %b2 = alloca i1
  %b3 = alloca i1
  %1 = add i32 1, 0
  store i32 %1, i32* %i
  %2 = load i32, i32* %i
  %3 = add i32 1, 0
  %4 = add i32 1, 0
  %5 = icmp eq i32 %3, %4
  store i1 %5, i1* %b3
  %6 = load i1, i1* %b3
  br label %.label1
.label1:
  %7 = load i32, i32* %i
  %8 = add i32 1, 0
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %.label2, label %.label3
.label2:
  %10 = load i32, i32* %i
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %10)
  %12 = load i1, i1* %b2
  store i1 false, i1* @logic_result
  br i1 %12, label %L4_true, label %L4_false
L4_true:
  %13 = load i1, i1* %b3
  store i1 %13, i1* @logic_result
  br label %L4_end
L4_false:
  store i1 false, i1* @logic_result
  br label %L4_end
L4_end:
  %14 = load i1, i1* @logic_result
  store i1 %14, i1* %b1
  %15 = load i1, i1* %b1
  %16 = load i1, i1* %b1
  %17 = load i1, i1* %b2
  %18 = icmp eq i1 %16, %17
  store i1 false, i1* @logic_result
  br i1 %18, label %L5_true, label %L5_false
L5_true:
  store i1 true, i1* @logic_result
  br label %L5_end
L5_false:
  %19 = load i1, i1* %b3
  store i1 %19, i1* @logic_result
  br label %L5_end
L5_end:
  %20 = load i1, i1* @logic_result
  store i1 %20, i1* %b3
  %21 = load i1, i1* %b3
  %22 = load i1, i1* %b1
  %23 = load i1, i1* %b2
  %24 = icmp eq i1 %22, %23
  %25 = xor i1 %24, true
  store i1 false, i1* @logic_result
  br i1 %25, label %L6_true, label %L6_false
L6_true:
  %26 = load i1, i1* %b3
  %27 = xor i1 %26, true
  store i1 %27, i1* @logic_result
  br label %L6_end
L6_false:
  store i1 false, i1* @logic_result
  br label %L6_end
L6_end:
  %28 = load i1, i1* @logic_result
  store i1 false, i1* @logic_result
  br i1 %28, label %L7_true, label %L7_false
L7_true:
  store i1 true, i1* @logic_result
  br label %L7_end
L7_false:
  %29 = load i32, i32* %i
  %30 = add i32 22, 0
  %31 = icmp sgt i32 %29, %30
  store i1 false, i1* @logic_result
  br i1 %31, label %L8_true, label %L8_false
L8_true:
  %32 = load i1, i1* %b1
  store i1 %32, i1* @logic_result
  br label %L8_end
L8_false:
  store i1 false, i1* @logic_result
  br label %L8_end
L8_end:
  %33 = load i1, i1* @logic_result
  store i1 %33, i1* @logic_result
  br label %L7_end
L7_end:
  %34 = load i1, i1* @logic_result
  store i1 %34, i1* %b1
  %35 = load i1, i1* %b1
  %36 = load i32, i32* %i
  %37 = add i32 1, 0
  %38 = add i32 %36, %37
  store i32 %38, i32* %i
  %39 = load i32, i32* %i
  br label %.label1
.label3:
  br label %.label9
.label9:
  br label %return
return:
  ret i32 0
}

