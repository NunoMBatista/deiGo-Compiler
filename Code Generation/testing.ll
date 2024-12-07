@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08F\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"
@.empty_str = private constant [1 x i8] c"\00"

declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)


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
  %8 = add i32 1000000, 0
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %.label2, label %.label3
.label2:
  %10 = load i32, i32* %i
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %10)
  %12 = load i1, i1* %b2
  %13 = alloca i1
  br i1 %12, label %L4_true, label %L4_false
L4_true:
  %14 = load i1, i1* %b3
  store i1 %14, i1* %13
  br label %L4_end
L4_false:
  store i1 false, i1* %13
  br label %L4_end
L4_end:
  %15 = load i1, i1* %13
  store i1 %15, i1* %b1
  %16 = load i1, i1* %b1
  %17 = load i1, i1* %b1
  %18 = load i1, i1* %b2
  %19 = icmp eq i1 %17, %18
  %20 = alloca i1
  br i1 %19, label %L5_true, label %L5_false
L5_true:
  store i1 true, i1* %20
  br label %L5_end
L5_false:
  %21 = load i1, i1* %b3
  store i1 %21, i1* %20
  br label %L5_end
L5_end:
  %22 = load i1, i1* %20
  br i1 %22, label %.label6, label %.label7
.label6:
  %23 = load i1, i1* %b1
  %24 = load i1, i1* %b2
  %25 = icmp eq i1 %23, %24
  %26 = alloca i1
  br i1 %25, label %L9_true, label %L9_false
L9_true:
  store i1 true, i1* %26
  br label %L9_end
L9_false:
  %27 = load i1, i1* %b3
  store i1 %27, i1* %26
  br label %L9_end
L9_end:
  %28 = load i1, i1* %26
  br i1 %28, label %.label10, label %.label11
.label10:
  br label %.label12
.label11:
  br label %.label12
.label12:
  br label %.label8
.label7:
  br label %.label8
.label8:
  %29 = load i1, i1* %b1
  %30 = load i1, i1* %b2
  %31 = icmp eq i1 %29, %30
  %32 = xor i1 %31, true
  %33 = alloca i1
  br i1 %32, label %L13_true, label %L13_false
L13_true:
  %34 = load i1, i1* %b3
  %35 = xor i1 %34, true
  store i1 %35, i1* %33
  br label %L13_end
L13_false:
  store i1 false, i1* %33
  br label %L13_end
L13_end:
  %36 = load i1, i1* %33
  %37 = alloca i1
  br i1 %36, label %L14_true, label %L14_false
L14_true:
  store i1 true, i1* %37
  br label %L14_end
L14_false:
  %38 = load i32, i32* %i
  %39 = add i32 22, 0
  %40 = icmp sgt i32 %38, %39
  %41 = alloca i1
  br i1 %40, label %L15_true, label %L15_false
L15_true:
  %42 = load i1, i1* %b1
  store i1 %42, i1* %41
  br label %L15_end
L15_false:
  store i1 false, i1* %41
  br label %L15_end
L15_end:
  %43 = load i1, i1* %41
  store i1 %43, i1* %37
  br label %L14_end
L14_end:
  %44 = load i1, i1* %37
  br i1 %44, label %.label16, label %.label17
.label16:
  %45 = load i1, i1* %b2
  br i1 %45, label %L46true, label %L46false
L46true:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_true, i32 0, i32 0))
  br label %L46end
L46false:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_false, i32 0, i32 0))
  br label %L46end
L46end:
  br label %.label18
.label17:
  br label %.label18
.label18:
  %48 = load i32, i32* %i
  %49 = add i32 1, 0
  %50 = add i32 %48, %49
  store i32 %50, i32* %i
  %51 = load i32, i32* %i
  br label %.label1
.label3:
  br label %.label19
.label19:
  br label %return
return:
  ret i32 0
}

