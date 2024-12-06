@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08F\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"
@.empty_str = private constant [1 x i8] c"\00"

declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)


define i32 @main() {
.label0:
  %trueBool = alloca i1
  %0 = load i1, i1* %trueBool
  %1 = xor i1 %0, true
  store i1 %1, i1* %trueBool
  %2 = load i1, i1* %trueBool
  %3 = load i1, i1* %trueBool
  br i1 %3, label %.label1, label %.label2
.label1:
  %4 = alloca [9 x i8]
  store [9 x i8] c"trueBool\00", [9 x i8]* %4
  %ptr5 = getelementptr inbounds [9 x i8], [9 x i8]* %4, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr5)
  %6 = load i1, i1* %trueBool
  %7 = xor i1 %6, true
  br i1 %7, label %.label4, label %.label5
.label4:
  %8 = alloca [16 x i8]
  store [16 x i8] c"Do not pressint\00", [16 x i8]* %8
  %ptr9 = getelementptr inbounds [16 x i8], [16 x i8]* %8, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr9)
  br label %.label6
.label5:
  %10 = alloca [16 x i8]
  store [16 x i8] c"or Not trueBool\00", [16 x i8]* %10
  %ptr11 = getelementptr inbounds [16 x i8], [16 x i8]* %10, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr11)
  %12 = add i32 1, 0
  %13 = add i32 2, 0
  %14 = icmp ne i32 %12, %13
  br i1 %14, label %.label7, label %.label8
.label7:
  %15 = alloca [19 x i8]
  store [19 x i8] c"one not equals two\00", [19 x i8]* %15
  %ptr16 = getelementptr inbounds [19 x i8], [19 x i8]* %15, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr16)
  %17 = fadd double 11.012, 0.0
  %18 = fadd double 2000.000000, 0.0
  %19 = fcmp olt double %17, %18
  br i1 %19, label %.label10, label %.label11
.label10:
  %20 = alloca [19 x i8]
  store [19 x i8] c"and for floats too\00", [19 x i8]* %20
  %ptr21 = getelementptr inbounds [19 x i8], [19 x i8]* %20, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr21)
  br label %.label12
.label11:
  br label %.label12
.label12:
  br label %.label9
.label8:
  br label %.label9
.label9:
  br label %.label6
.label6:
  br label %.label3
.label2:
  %22 = alloca [17 x i8]
  store [17 x i8] c"Can't print this\00", [17 x i8]* %22
  %ptr23 = getelementptr inbounds [17 x i8], [17 x i8]* %22, i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %ptr23)
  br label %.label3
.label3:
  br label %.label13
.label13:
  br label %return
return:
  ret i32 0
}

