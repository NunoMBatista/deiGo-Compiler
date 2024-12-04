@.fmtstr_true = private unnamed_addr constant [6 x i8] c"true\0A\00"
@.fmtstr_false = private unnamed_addr constant [7 x i8] c"false\0A\00"
@.fmtstr_d = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.fmtstr_g = private unnamed_addr constant [7 x i8] c"%.08F\0A\00"
@.fmtstr_s = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)
declare i32 @atoi(i8*)



define i32 @fint(i32 %n) {
.label0:
  %0 = alloca i32
  store i32 0, i32* %0
  %1 = alloca i32
  store i32 %n, i32* %1
  %2 = load i32, i32* %1
  %3 = sub i32 %2, 1
  store i32 %3, i32* %0
  br label %return
.label1:
  br label %return
return:
  %4 = load i32, i32* %0
  ret i32 %4
}


define i32 @main(i32 %argc, i8** %argv) {
.label0:
  %0 = sub i32 %argc, 1
  %1 = getelementptr inbounds i8*, i8** %argv, i32 1
  %2 = alloca i32
  %3 = alloca i32
  store i32 10, i32* %2
  %4 = load i32, i32* %2
  %5 = add i32 %4, 1
  store i32 %5, i32* %3
  %6 = load i32, i32* %3
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.fmtstr_d, i32 0, i32 0), i32 %6)
%8 = call i32 @fint(i32 1)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.fmtstr_d, i32 0, i32 0), i32 %8)
  br label %return
return:
  ret i32 0
}

