declare i32 @atoi(i8*)
declare i32 @printf(i8*, ...)
@.str_int = private constant [4 x i8] c"%d\0A\00"
@.str_float = private constant [7 x i8] c"%.08f\0A\00"
@.str_true = private constant [6 x i8] c"true\0A\00"
@.str_false = private constant [7 x i8] c"false\0A\00"
@.str_string = private constant [4 x i8] c"%s\0A\00"


@ia = global i32 0
@ib = global i32 0
@ic = global i32 0
@id = global i32 0
@ie = global i32 0
@fa = global double 0.0
@fb = global double 0.0
@fc = global double 0.0
@fd = global double 0.0
@fe = global double 0.0
@ba = global i1 false
@bb = global i1 false
@bc = global i1 false
@bd = global i1 false
@sa = global i8* null
@sb = global i8* null
@sc = global i8* null
define void @_fca() {
  ret void
}

define i32 @_fcb() {
  %fafcb = alloca i32
  %1 = add i32 132, 0
  store i32 %1, i32* %fafcb
  %2 = load i32, i32* %fafcb
  ret i32 %2
  ret i32 0
}

define double @_fcd() {
  %1 = fadd double 1.000000, 0.0
  %2 = fadd double 0.007, 0.0
  %3 = fadd double %1, %2
  ret double %3
  ret double 0.0
}

define i8* @_fce() {
  %strfce = alloca i8*
  %1 = load i8*, i8** %strfce
  ret i8* %1
  ret i8* null
}

define i1 @_fcf() {
  %bafcf = alloca i1
  %1 = load i1, i1* %bafcf
  ret i1 %1
  ret i1 false
}

define i32 @_fcg(i32 %iafcg, double %fafcg) {
  %iafcg.addr = alloca i32
  store i32 %iafcg, i32* %iafcg.addr
  %fafcg.addr = alloca double
  store double %fafcg, double* %fafcg.addr
  %1 = call double @_fcd()
  %2 = load double, double* %fafcg.addr
  %3 = fcmp ogt double %1, %2
  br i1 %3, label %L4true, label %L4false
L4true:
  call void @_fca()
  %4 = load i32, i32* %iafcg.addr
  ret i32 %4
  br label %L4end
L4false:
  br label %L4end
L4end:
  %6 = call i32 @_fcb()
  ret i32 %6
  ret i32 0
}

define double @_fch(i32 %iafch, double %fafch, i8* %safch) {
  %iafch.addr = alloca i32
  store i32 %iafch, i32* %iafch.addr
  %fafch.addr = alloca double
  store double %fafch, double* %fafch.addr
  %safch.addr = alloca i8*
  store i8* %safch, i8** %safch.addr
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  call i32 @_fcg(i32 %1, double %2)
  %4 = load i8*, i8** %safch.addr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %4)
  %6 = load i1, i1* @bb
  br i1 %6, label %L7true, label %L7false
L7true:
  %7 = load i32, i32* @ia
  %8 = load i32, i32* @ib
  %9 = add i32 %7, %8
  store i32 %9, i32* %iafch.addr
  %10 = load double, double* @fa
  store double %10, double* %fafch.addr
  %11 = load double, double* %fafch.addr
  store double %11, double* @fb
  %12 = load i32, i32* %iafch.addr
  store i32 %12, i32* @id
  br label %L7end
L7false:
  br label %L7end
L7end:
  %13 = fadd double 0.01, 0.0
  ret double %13
  ret double 0.0
}

define double @_fci(i32 %iafci, i32 %ibfci, double %fafci, double %fbfci, i8* %safci) {
  %iafci.addr = alloca i32
  store i32 %iafci, i32* %iafci.addr
  %ibfci.addr = alloca i32
  store i32 %ibfci, i32* %ibfci.addr
  %fafci.addr = alloca double
  store double %fafci, double* %fafci.addr
  %fbfci.addr = alloca double
  store double %fbfci, double* %fbfci.addr
  %safci.addr = alloca i8*
  store i8* %safci, i8** %safci.addr
  %1 = call i32 @_fcb()
  %2 = call double @_fcd()
  %3 = call i32 @_fcg(i32 %1, double %2)
  %4 = call double @_fcd()
  %5 = call i8* @_fce()
  call double @_fch(i32 %3, double %4, i8* %5)
  %7 = load i32, i32* %ibfci.addr
  %8 = add i32 12, 0
  %9 = add i32 %7, %8
  %10 = load i32, i32* @ic
  %11 = add i32 %9, %10
  %12 = call i32 @_fcb()
  %13 = add i32 %11, %12
  store i32 %13, i32* %iafci.addr
  %14 = call i1 @_fcf()
  br i1 %14, label %L15true, label %L15false
L15true:
  %15 = load i8*, i8** %safci.addr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %15)
  %17 = load i32, i32* @ia
  %18 = load double, double* @fa
  %19 = load i8*, i8** @sa
  %20 = call double @_fch(i32 %17, double %18, i8* %19)
  ret double %20
  br label %L15end
L15false:
  %22 = load double, double* @fa
  %23 = load double, double* %fbfci.addr
  %24 = fmul double %22, %23
  %25 = call double @_fcd()
  %26 = fadd double %24, %25
  store double %26, double* %fafci.addr
  %27 = call double @_fcd()
  ret double %27
  br label %L15end
L15end:
  ret double 0.0
}

define i32 @_fcj(i32 %iafcj, i32 %ibfcj, double %fafcj, double %fbfcj, i1 %bafcj) {
  %iafcj.addr = alloca i32
  store i32 %iafcj, i32* %iafcj.addr
  %ibfcj.addr = alloca i32
  store i32 %ibfcj, i32* %ibfcj.addr
  %fafcj.addr = alloca double
  store double %fafcj, double* %fafcj.addr
  %fbfcj.addr = alloca double
  store double %fbfcj, double* %fbfcj.addr
  %bafcj.addr = alloca i1
  store i1 %bafcj, i1* %bafcj.addr
  %fcjia = alloca i32
  %fcjib = alloca i32
  %1 = load i32, i32* @ia
  %2 = load i32, i32* @ib
  %3 = add i32 %1, %2
  %4 = load i32, i32* @ic
  %5 = load i32, i32* @id
  %6 = mul i32 %4, %5
  %7 = load i32, i32* @ie
  %8 = srem i32 %6, %7
  %9 = sub i32 %3, %8
  store i32 %9, i32* %fcjia
  %10 = load i32, i32* %fcjia
  %11 = load i32, i32* %fcjia
  %12 = call i32 @_fcb()
  %13 = load i32, i32* %fcjib
  %14 = call i32 @_fcb()
  %15 = load double, double* @fb
  %16 = load i8*, i8** @sa
  %17 = call double @_fch(i32 %14, double %15, i8* %16)
  %18 = load double, double* @fd
  %19 = load i8*, i8** @sb
  %20 = call double @_fci(i32 %12, i32 %13, double %17, double %18, i8* %19)
  %21 = call i32 @_fcg(i32 %11, double %20)
  %22 = icmp sgt i32 %10, %21
  br i1 %22, label %L23true, label %L23false
L23true:
  %23 = load i1, i1* @ba
  br i1 %23, label %L24true, label %L24false
L24true:
  %24 = fadd double 0.01, 0.0
  store double %24, double* @fc
  br label %L24end
L24false:
  %25 = load double, double* @fc
  %26 = load double, double* @fe
  %27 = fadd double %25, %26
  store double %27, double* @fc
  %28 = load i1, i1* %bafcj.addr
  br i1 %28, label %L29true, label %L29false
L29true:
  br label %L29cond
L29cond:
  %29 = call i1 @_fcf()
  br i1 %29, label %L29body, label %L29end
L29body:
  %30 = load i32, i32* %fcjia
  %31 = call i32 @_fcb()
  %32 = add i32 12, 0
  %33 = sdiv i32 %31, %32
  %34 = add i32 %30, %33
  %35 = load i32, i32* @ia
  %36 = load i32, i32* %iafcj.addr
  %37 = add i32 %35, %36
  %38 = load double, double* @fa
  %39 = call i32 @_fcg(i32 %37, double %38)
  %40 = add i32 %34, %39
  %41 = load i32, i32* %ibfcj.addr
  %42 = sub i32 %40, %41
  store i32 %42, i32* %fcjib
  %43 = load double, double* %fafcj.addr
  store double %43, double* %fbfcj.addr
  br label %L29cond
L29end:
  br label %L29end
L29false:
  br label %L29end
L29end:
  br label %L24end
L24end:
  br label %L23end
L23false:
  br label %L23end
L23end:
  br label %L44cond
L44cond:
  %44 = load i1, i1* @bb
  br i1 %44, label %L44body, label %L44end
L44body:
  %45 = load i1, i1* @bc
  br i1 %45, label %L46true, label %L46false
L46true:
  %46 = load i1, i1* @bd
  %47 = load i1, i1* @ba
  %48 = and i1 %46, %47
  store i1 %48, i1* @bd
  %49 = load i1, i1* @ba
  %50 = call i1 @_fcf()
  %51 = and i1 %49, %50
  %52 = load i1, i1* @bd
  %53 = load i1, i1* @bc
  %54 = xor i1 %53, true
  %55 = and i1 %52, %54
  %56 = or i1 %51, %55
  store i1 %56, i1* @bd
  br label %L46end
L46false:
  br label %L46end
L46end:
  br label %L44cond
L44end:
  %57 = add i32 101, 0
  %58 = sub i32 0, %57
  ret i32 %58
  ret i32 0
}

define void @_main() {
  %1 = add i32 1, 0
  store i32 %1, i32* @ia
  %2 = add i32 1, 0
  store i32 %2, i32* @ib
  %3 = add i32 1, 0
  store i32 %3, i32* @ic
  %4 = add i32 1, 0
  store i32 %4, i32* @id
  %5 = add i32 1, 0
  store i32 %5, i32* @ie
  %6 = fadd double 0.1, 0.0
  store double %6, double* @fa
  %7 = fadd double 0.1, 0.0
  store double %7, double* @fb
  %8 = fadd double 0.1, 0.0
  store double %8, double* @fc
  %9 = fadd double 0.1, 0.0
  store double %9, double* @fd
  %10 = fadd double 0.1, 0.0
  store double %10, double* @fe
  %mia = alloca i32
  %mib = alloca i32
  br label %L11cond
L11cond:
  %11 = load i32, i32* @ia
  %12 = load i32, i32* @ib
  %13 = icmp sgt i32 %11, %12
  %14 = call i1 @_fcf()
  %15 = and i1 %13, %14
  br i1 %15, label %L11body, label %L11end
L11body:
  %16 = call i32 @_fcb()
  %17 = call i32 @_fcb()
  %18 = load double, double* @fe
  %19 = call i32 @_fcg(i32 %17, double %18)
  %20 = load i32, i32* %mia
  %21 = call i32 @_fcb()
  %22 = call double @_fcd()
  %23 = call i32 @_fcg(i32 %21, double %22)
  %24 = add i32 123, 0
  %25 = load i32, i32* @ia
  %26 = call double @_fcd()
  %27 = call i8* @_fce()
  %28 = call double @_fch(i32 %25, double %26, i8* %27)
  %29 = call double @_fcd()
  %30 = load i8*, i8** @sc
  %31 = call double @_fci(i32 %23, i32 %24, double %28, double %29, i8* %30)
  %32 = call double @_fcd()
  %33 = call i1 @_fcf()
  %34 = call i32 @_fcj(i32 %19, i32 %20, double %31, double %32, i1 %33)
  %35 = icmp sgt i32 %16, %34
  br i1 %35, label %L36true, label %L36false
L36true:
  %36 = add i32 12, 0
  %37 = load i32, i32* @ia
  %38 = load double, double* @fa
  %39 = fadd double 100000000000.000000, 0.0
  %40 = load i1, i1* @ba
  %41 = call i32 @_fcj(i32 %36, i32 %37, double %38, double %39, i1 %40)
  store i32 %41, i32* %mib
  br label %L36end
L36false:
  %42 = load i32, i32* @ia
  %43 = call i32 @_fcb()
  %44 = add i32 %42, %43
  store i32 %44, i32* %mib
  br label %L36end
L36end:
  br label %L11cond
L11end:
  %45 = load i32, i32* %mib
  %46 = add i32 123, 0
  %47 = add i32 456, 0
  %48 = call i32 @_fcb()
  %49 = add i32 %47, %48
  %50 = call double @_fcd()
  %51 = fadd double 123.321, 0.0
  %52 = fadd double %50, %51
  %53 = call i32 @_fcg(i32 %49, double %52)
  %54 = add i32 %46, %53
  %55 = load i32, i32* @ia
  %56 = load i32, i32* @ib
  %57 = add i32 %55, %56
  %58 = load i32, i32* @ic
  %59 = add i32 12, 0
  %60 = sdiv i32 %58, %59
  %61 = sub i32 %57, %60
  %62 = load i32, i32* @id
  %63 = load i32, i32* @ie
  %64 = mul i32 %62, %63
  %65 = call i32 @_fcb()
  %66 = load double, double* @fa
  %67 = call i32 @_fcg(i32 %65, double %66)
  %68 = srem i32 %64, %67
  %69 = add i32 %61, %68
  %70 = load i32, i32* @ia
  %71 = load i32, i32* @ib
  %72 = add i32 %70, %71
  %73 = add i32 123, 0
  %74 = load double, double* @fa
  %75 = call double @_fcd()
  %76 = fadd double 100000000000.000000, 0.0
  %77 = fdiv double %75, %76
  %78 = fsub double %74, %77
  %79 = call double @_fcd()
  %80 = call i8* @_fce()
  %81 = call double @_fci(i32 %72, i32 %73, double %78, double %79, i8* %80)
  %82 = add i32 312, 0
  %83 = add i32 12, 0
  %84 = add i32 %82, %83
  %85 = call double @_fcd()
  %86 = fadd double 10000000000000000000000.000000, 0.0
  %87 = fadd double %85, %86
  %88 = call i8* @_fce()
  %89 = call double @_fch(i32 %84, double %87, i8* %88)
  %90 = call i1 @_fcf()
  %91 = load i1, i1* @ba
  %92 = and i1 %90, %91
  %93 = load i1, i1* @bb
  %94 = or i1 %92, %93
  %95 = call i32 @_fcj(i32 %54, i32 %69, double %81, double %89, i1 %94)
  %96 = add i32 %45, %95
  store i32 %96, i32* %mia
  ret void
}

define i32 @main() {
  call void @_main()
  ret i32 0
}
