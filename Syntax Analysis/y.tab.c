/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "gocompiler.y"

/*
    Authors:
        Nuno Batista: uc2022216127
        Miguel Castela: uc2022212972
*/
#include "ast.h"
#include <stdlib.h>

int yylex(void);
void yyerror(char*);

struct node *program;


#line 87 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    SEMICOLON = 258,               /* SEMICOLON  */
    COMMA = 259,                   /* COMMA  */
    STAR = 260,                    /* STAR  */
    DIV = 261,                     /* DIV  */
    MINUS = 262,                   /* MINUS  */
    PLUS = 263,                    /* PLUS  */
    EQ = 264,                      /* EQ  */
    GE = 265,                      /* GE  */
    GT = 266,                      /* GT  */
    LBRACE = 267,                  /* LBRACE  */
    LE = 268,                      /* LE  */
    LPAR = 269,                    /* LPAR  */
    LSQ = 270,                     /* LSQ  */
    LT = 271,                      /* LT  */
    MOD = 272,                     /* MOD  */
    NE = 273,                      /* NE  */
    NOT = 274,                     /* NOT  */
    AND = 275,                     /* AND  */
    OR = 276,                      /* OR  */
    PACKAGE = 277,                 /* PACKAGE  */
    ELSE = 278,                    /* ELSE  */
    FOR = 279,                     /* FOR  */
    IF = 280,                      /* IF  */
    VAR = 281,                     /* VAR  */
    INT = 282,                     /* INT  */
    FLOAT32 = 283,                 /* FLOAT32  */
    BOOL = 284,                    /* BOOL  */
    STRING = 285,                  /* STRING  */
    PRINT = 286,                   /* PRINT  */
    PARSEINT = 287,                /* PARSEINT  */
    FUNC = 288,                    /* FUNC  */
    CMDARGS = 289,                 /* CMDARGS  */
    BLANKID = 290,                 /* BLANKID  */
    RBRACE = 291,                  /* RBRACE  */
    RPAR = 292,                    /* RPAR  */
    RETURN = 293,                  /* RETURN  */
    RSQ = 294,                     /* RSQ  */
    ASSIGN = 295,                  /* ASSIGN  */
    STRLIT = 296,                  /* STRLIT  */
    RESERVED = 297,                /* RESERVED  */
    IDENTIFIER = 298,              /* IDENTIFIER  */
    NATURAL = 299,                 /* NATURAL  */
    DECIMAL = 300,                 /* DECIMAL  */
    LOW = 301                      /* LOW  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define SEMICOLON 258
#define COMMA 259
#define STAR 260
#define DIV 261
#define MINUS 262
#define PLUS 263
#define EQ 264
#define GE 265
#define GT 266
#define LBRACE 267
#define LE 268
#define LPAR 269
#define LSQ 270
#define LT 271
#define MOD 272
#define NE 273
#define NOT 274
#define AND 275
#define OR 276
#define PACKAGE 277
#define ELSE 278
#define FOR 279
#define IF 280
#define VAR 281
#define INT 282
#define FLOAT32 283
#define BOOL 284
#define STRING 285
#define PRINT 286
#define PARSEINT 287
#define FUNC 288
#define CMDARGS 289
#define BLANKID 290
#define RBRACE 291
#define RPAR 292
#define RETURN 293
#define RSQ 294
#define ASSIGN 295
#define STRLIT 296
#define RESERVED 297
#define IDENTIFIER 298
#define NATURAL 299
#define DECIMAL 300
#define LOW 301

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "gocompiler.y"

    char *lexeme;
    struct node *node;

#line 237 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_SEMICOLON = 3,                  /* SEMICOLON  */
  YYSYMBOL_COMMA = 4,                      /* COMMA  */
  YYSYMBOL_STAR = 5,                       /* STAR  */
  YYSYMBOL_DIV = 6,                        /* DIV  */
  YYSYMBOL_MINUS = 7,                      /* MINUS  */
  YYSYMBOL_PLUS = 8,                       /* PLUS  */
  YYSYMBOL_EQ = 9,                         /* EQ  */
  YYSYMBOL_GE = 10,                        /* GE  */
  YYSYMBOL_GT = 11,                        /* GT  */
  YYSYMBOL_LBRACE = 12,                    /* LBRACE  */
  YYSYMBOL_LE = 13,                        /* LE  */
  YYSYMBOL_LPAR = 14,                      /* LPAR  */
  YYSYMBOL_LSQ = 15,                       /* LSQ  */
  YYSYMBOL_LT = 16,                        /* LT  */
  YYSYMBOL_MOD = 17,                       /* MOD  */
  YYSYMBOL_NE = 18,                        /* NE  */
  YYSYMBOL_NOT = 19,                       /* NOT  */
  YYSYMBOL_AND = 20,                       /* AND  */
  YYSYMBOL_OR = 21,                        /* OR  */
  YYSYMBOL_PACKAGE = 22,                   /* PACKAGE  */
  YYSYMBOL_ELSE = 23,                      /* ELSE  */
  YYSYMBOL_FOR = 24,                       /* FOR  */
  YYSYMBOL_IF = 25,                        /* IF  */
  YYSYMBOL_VAR = 26,                       /* VAR  */
  YYSYMBOL_INT = 27,                       /* INT  */
  YYSYMBOL_FLOAT32 = 28,                   /* FLOAT32  */
  YYSYMBOL_BOOL = 29,                      /* BOOL  */
  YYSYMBOL_STRING = 30,                    /* STRING  */
  YYSYMBOL_PRINT = 31,                     /* PRINT  */
  YYSYMBOL_PARSEINT = 32,                  /* PARSEINT  */
  YYSYMBOL_FUNC = 33,                      /* FUNC  */
  YYSYMBOL_CMDARGS = 34,                   /* CMDARGS  */
  YYSYMBOL_BLANKID = 35,                   /* BLANKID  */
  YYSYMBOL_RBRACE = 36,                    /* RBRACE  */
  YYSYMBOL_RPAR = 37,                      /* RPAR  */
  YYSYMBOL_RETURN = 38,                    /* RETURN  */
  YYSYMBOL_RSQ = 39,                       /* RSQ  */
  YYSYMBOL_ASSIGN = 40,                    /* ASSIGN  */
  YYSYMBOL_STRLIT = 41,                    /* STRLIT  */
  YYSYMBOL_RESERVED = 42,                  /* RESERVED  */
  YYSYMBOL_IDENTIFIER = 43,                /* IDENTIFIER  */
  YYSYMBOL_NATURAL = 44,                   /* NATURAL  */
  YYSYMBOL_DECIMAL = 45,                   /* DECIMAL  */
  YYSYMBOL_LOW = 46,                       /* LOW  */
  YYSYMBOL_YYACCEPT = 47,                  /* $accept  */
  YYSYMBOL_Program = 48,                   /* Program  */
  YYSYMBOL_Declarations = 49,              /* Declarations  */
  YYSYMBOL_VarDecl = 50,                   /* VarDecl  */
  YYSYMBOL_VarSpec = 51,                   /* VarSpec  */
  YYSYMBOL_Type = 52,                      /* Type  */
  YYSYMBOL_FuncDecl = 53,                  /* FuncDecl  */
  YYSYMBOL_OptFuncParams = 54,             /* OptFuncParams  */
  YYSYMBOL_OptType = 55,                   /* OptType  */
  YYSYMBOL_FuncParams = 56,                /* FuncParams  */
  YYSYMBOL_FuncBody = 57,                  /* FuncBody  */
  YYSYMBOL_VarsAndStatements = 58,         /* VarsAndStatements  */
  YYSYMBOL_Statement = 59,                 /* Statement  */
  YYSYMBOL_StarStatementSc = 60,           /* StarStatementSc  */
  YYSYMBOL_OptElse = 61,                   /* OptElse  */
  YYSYMBOL_OptExpr = 62,                   /* OptExpr  */
  YYSYMBOL_ParseArgs = 63,                 /* ParseArgs  */
  YYSYMBOL_FuncInvocation = 64,            /* FuncInvocation  */
  YYSYMBOL_PosExpr = 65,                   /* PosExpr  */
  YYSYMBOL_Expr = 66                       /* Expr  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   337

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  47
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  20
/* YYNRULES -- Number of rules.  */
#define YYNRULES  70
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  143

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   301


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    62,    62,    69,    74,    86,    97,   103,   111,   124,
     147,   151,   155,   159,   175,   189,   194,   199,   204,   213,
     222,   237,   246,   250,   255,   261,   290,   296,   306,   319,
     327,   332,   336,   340,   347,   352,   355,   361,   366,   371,
     376,   381,   386,   394,   397,   403,   406,   410,   416,   421,
     427,   434,   440,   446,   452,   458,   464,   469,   475,   481,
     487,   493,   500,   505,   510,   515,   519,   523,   527,   531,
     535
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "SEMICOLON", "COMMA",
  "STAR", "DIV", "MINUS", "PLUS", "EQ", "GE", "GT", "LBRACE", "LE", "LPAR",
  "LSQ", "LT", "MOD", "NE", "NOT", "AND", "OR", "PACKAGE", "ELSE", "FOR",
  "IF", "VAR", "INT", "FLOAT32", "BOOL", "STRING", "PRINT", "PARSEINT",
  "FUNC", "CMDARGS", "BLANKID", "RBRACE", "RPAR", "RETURN", "RSQ",
  "ASSIGN", "STRLIT", "RESERVED", "IDENTIFIER", "NATURAL", "DECIMAL",
  "LOW", "$accept", "Program", "Declarations", "VarDecl", "VarSpec",
  "Type", "FuncDecl", "OptFuncParams", "OptType", "FuncParams", "FuncBody",
  "VarsAndStatements", "Statement", "StarStatementSc", "OptElse",
  "OptExpr", "ParseArgs", "FuncInvocation", "PosExpr", "Expr", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-74)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-49)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      -2,   -17,    63,    58,   -74,   -74,    33,   -10,    24,    71,
      78,    29,    28,   -74,    70,   -74,   -74,    82,    29,   -74,
     -74,   -74,   -74,   -74,    44,    52,   -74,   -18,    54,    86,
     -74,   -74,   -18,    50,   -74,    83,   -18,   -74,   -74,   -74,
      91,   -74,   -74,   -74,   161,   161,    87,   -74,   161,     1,
      94,   104,   -74,   -74,    99,   161,   161,    69,   161,    88,
     -74,   -74,    97,   -74,   273,   256,    -6,   -74,    75,    61,
     161,   -74,   -74,   -74,   115,   -74,   -74,    84,   203,   -74,
     -74,   161,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   -74,    89,   221,    80,    96,   103,
     239,   273,   -74,   -74,   -74,   107,   -74,   -74,    23,    23,
     320,    17,    17,    17,    17,   -74,   320,   306,   290,   124,
     -74,   -74,   109,   -74,   -74,   161,   -74,   121,   132,   -74,
     135,   -74,     2,   -74,   116,   139,   127,   -74,   161,   -74,
     176,   119,   -74
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,     5,     2,     0,     0,     0,
       0,     0,     0,     6,     0,     4,     3,     0,     0,    10,
      11,    12,    13,     8,    16,     0,     9,     0,     0,    15,
       7,    19,    18,     0,    17,     0,     0,    25,    14,    20,
       0,    35,    22,    37,    41,     0,     0,    21,    41,     0,
       0,     0,    32,    31,     0,     0,     0,     0,     0,    67,
      65,    66,     0,    68,    40,     0,     0,    30,     0,     0,
       0,    23,    24,    27,     0,    62,    64,     0,     0,    63,
      37,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,     0,     0,     0,     0,     0,
      46,    26,    36,    70,    69,     0,    59,    60,    58,    57,
      53,    56,    52,    55,    51,    61,    54,    50,    49,     0,
      34,    33,     0,    45,    44,    48,    29,    39,     0,    47,
       0,    28,     0,    37,     0,     0,     0,    43,     0,    38,
       0,     0,    42
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -74,   -74,   -74,   117,    53,    46,   -74,   -74,   -74,   -74,
     -74,   -74,   126,   -73,   -74,   111,   -74,   -40,    36,   -39
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     2,     6,     9,    13,    23,    10,    28,    35,    29,
      38,    40,    74,    54,   131,    62,    52,    63,    99,    64
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      53,    55,    56,   134,    11,    68,    65,   105,    57,    19,
      20,    21,    22,    58,    53,    69,    75,    76,    78,    79,
       1,   119,    81,    82,    83,    84,     3,    96,    81,    82,
     100,   101,    18,    12,    90,    95,   135,    59,    60,    61,
      90,    70,   106,   107,   108,   109,   110,   111,   112,   113,
     114,   115,   116,   117,   118,    19,    20,    21,    22,     7,
     136,     5,    98,     4,    17,    53,     8,    14,    55,    56,
      77,    26,    12,    31,    15,    57,    55,    56,    34,    53,
      58,    16,    39,    57,    24,    25,   100,    27,    58,    30,
      33,    32,    41,    36,    42,    37,    53,    71,   -48,   140,
      41,    66,    69,    43,    59,    60,    61,    72,    41,    80,
      97,    43,    59,    60,    61,    44,    45,     7,   102,    43,
     122,   103,    46,    44,    45,    41,   120,    47,    41,    48,
      46,    44,    45,   123,    49,    73,    43,    48,    46,    43,
     124,   128,    49,   126,   130,    48,   132,   133,    44,    45,
      49,    44,    45,   137,   138,    46,   142,    50,    46,    67,
     127,   129,    48,   139,     0,    48,    51,    49,    55,    56,
      49,     0,     0,     0,     0,    57,     0,     0,     0,     0,
      58,    81,    82,    83,    84,    85,    86,    87,     0,    88,
       0,     0,    89,    90,    91,     0,    92,    93,     0,     0,
       0,     0,     0,     0,    59,    60,    61,     0,    81,    82,
      83,    84,    85,    86,    87,   141,    88,     0,     0,    89,
      90,    91,     0,    92,    93,     0,    81,    82,    83,    84,
      85,    86,    87,     0,    88,     0,     0,    89,    90,    91,
     104,    92,    93,   125,    81,    82,    83,    84,    85,    86,
      87,     0,    88,     0,     0,    89,    90,    91,   121,    92,
      93,    81,    82,    83,    84,    85,    86,    87,    94,    88,
       0,     0,    89,    90,    91,     0,    92,    93,    81,    82,
      83,    84,    85,    86,    87,     0,    88,     0,     0,    89,
      90,    91,     0,    92,    93,    81,    82,    83,    84,    85,
      86,    87,     0,    88,     0,     0,    89,    90,    91,     0,
      92,    81,    82,    83,    84,    85,    86,    87,     0,    88,
       0,     0,    89,    90,    91,    81,    82,    83,    84,     0,
      86,    87,     0,    88,     0,     0,    89,    90
};

static const yytype_int16 yycheck[] =
{
      40,     7,     8,     1,    14,     4,    45,    80,    14,    27,
      28,    29,    30,    19,    54,    14,    55,    56,    57,    58,
      22,    94,     5,     6,     7,     8,    43,    66,     5,     6,
      69,    70,     4,    43,    17,    41,    34,    43,    44,    45,
      17,    40,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    27,    28,    29,    30,    26,
     133,     3,     1,     0,    11,   105,    33,    43,     7,     8,
       1,    18,    43,    27,     3,    14,     7,     8,    32,   119,
      19,     3,    36,    14,    14,     3,   125,    43,    19,    37,
       4,    37,     1,    43,     3,    12,   136,     3,    37,   138,
       1,    14,    14,    12,    43,    44,    45,     3,     1,    12,
      35,    12,    43,    44,    45,    24,    25,    26,     3,    12,
      40,    37,    31,    24,    25,     1,    37,    36,     1,    38,
      31,    24,    25,    37,    43,    36,    12,    38,    31,    12,
      37,    32,    43,    36,    23,    38,    14,    12,    24,    25,
      43,    24,    25,    37,    15,    31,    37,    40,    31,    48,
      36,   125,    38,    36,    -1,    38,    40,    43,     7,     8,
      43,    -1,    -1,    -1,    -1,    14,    -1,    -1,    -1,    -1,
      19,     5,     6,     7,     8,     9,    10,    11,    -1,    13,
      -1,    -1,    16,    17,    18,    -1,    20,    21,    -1,    -1,
      -1,    -1,    -1,    -1,    43,    44,    45,    -1,     5,     6,
       7,     8,     9,    10,    11,    39,    13,    -1,    -1,    16,
      17,    18,    -1,    20,    21,    -1,     5,     6,     7,     8,
       9,    10,    11,    -1,    13,    -1,    -1,    16,    17,    18,
      37,    20,    21,     4,     5,     6,     7,     8,     9,    10,
      11,    -1,    13,    -1,    -1,    16,    17,    18,    37,    20,
      21,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      -1,    -1,    16,    17,    18,    -1,    20,    21,     5,     6,
       7,     8,     9,    10,    11,    -1,    13,    -1,    -1,    16,
      17,    18,    -1,    20,    21,     5,     6,     7,     8,     9,
      10,    11,    -1,    13,    -1,    -1,    16,    17,    18,    -1,
      20,     5,     6,     7,     8,     9,    10,    11,    -1,    13,
      -1,    -1,    16,    17,    18,     5,     6,     7,     8,    -1,
      10,    11,    -1,    13,    -1,    -1,    16,    17
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    22,    48,    43,     0,     3,    49,    26,    33,    50,
      53,    14,    43,    51,    43,     3,     3,    51,     4,    27,
      28,    29,    30,    52,    14,     3,    51,    43,    54,    56,
      37,    52,    37,     4,    52,    55,    43,    12,    57,    52,
      58,     1,     3,    12,    24,    25,    31,    36,    38,    43,
      50,    59,    63,    64,    60,     7,     8,    14,    19,    43,
      44,    45,    62,    64,    66,    66,    14,    62,     4,    14,
      40,     3,     3,    36,    59,    66,    66,     1,    66,    66,
      12,     5,     6,     7,     8,     9,    10,    11,    13,    16,
      17,    18,    20,    21,    12,    41,    66,    35,     1,    65,
      66,    66,     3,    37,    37,    60,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    60,
      37,    37,    40,    37,    37,     4,    36,    36,    32,    65,
      23,    61,    14,    12,     1,    34,    60,    37,    15,    36,
      66,    39,    37
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    47,    48,    49,    49,    49,    50,    50,    51,    51,
      52,    52,    52,    52,    53,    54,    54,    55,    55,    56,
      56,    57,    58,    58,    58,    58,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    60,    60,    61,    61,
      62,    62,    63,    63,    64,    64,    65,    65,    65,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     4,     3,     3,     0,     2,     5,     2,     3,
       1,     1,     1,     1,     7,     1,     0,     1,     0,     2,
       4,     3,     2,     3,     3,     0,     3,     3,     6,     5,
       2,     1,     1,     4,     4,     1,     3,     0,     4,     0,
       1,     0,    11,     8,     4,     4,     1,     3,     0,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     2,     2,     2,     1,     1,     1,     1,     3,
       3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: PACKAGE IDENTIFIER SEMICOLON Declarations  */
#line 63 "gocompiler.y"
                        {
                            (yyval.node) = program = new_node(Program, NULL); 
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1415 "y.tab.c"
    break;

  case 3: /* Declarations: Declarations FuncDecl SEMICOLON  */
#line 70 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1424 "y.tab.c"
    break;

  case 4: /* Declarations: Declarations VarDecl SEMICOLON  */
#line 75 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);

                            struct node *var_declarations = new_node(AUX, NULL);
                            add_child((yyval.node), var_declarations);
                            add_child(var_declarations, (yyvsp[-1].node));

                            //add_child($$, $2);
                            
                        }
#line 1439 "y.tab.c"
    break;

  case 5: /* Declarations: %empty  */
#line 86 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1447 "y.tab.c"
    break;

  case 6: /* VarDecl: VAR VarSpec  */
#line 98 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                            //$$ = new_node(AUX, NULL);
                            //add_child($$, $2);
                        }
#line 1457 "y.tab.c"
    break;

  case 7: /* VarDecl: VAR LPAR VarSpec SEMICOLON RPAR  */
#line 104 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            //$$ = new_node(AUX, NULL);
                            //add_child($$, $3);
                        }
#line 1467 "y.tab.c"
    break;

  case 8: /* VarSpec: IDENTIFIER Type  */
#line 112 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);

                            struct node *new_decl = new_node(VarDecl, NULL);
                            add_child(new_decl, (yyvsp[0].node));
                            add_child(new_decl, new_node(Identifier, (yyvsp[-1].lexeme)));
                            add_child((yyval.node), new_decl);

                            //$$ = new_node(VarDecl, NULL);
                            //add_child($$, $2);
                            //add_child($$, new_node(Identifier, $1));
                        }
#line 1484 "y.tab.c"
    break;

  case 9: /* VarSpec: IDENTIFIER COMMA VarSpec  */
#line 125 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                            struct node *new_decl = new_node(VarDecl, NULL);
                            add_child(new_decl, new_node(Identifier, (yyvsp[-2].lexeme)));
                            add_child((yyval.node), new_decl);

                            // Get the type of the last VarDecl
                            struct node *type = (yyvsp[0].node)->children->next->node->children->next->node;
                            struct node *type_copy = new_node(type->category, NULL);
                            add_child(new_decl, type_copy);
                            

                            //$$ = new_node(VarDecl, NULL);
                            //add_child($$, new_node(Identifier, $1));
                            ////add_child($$, type);

                        }
#line 1506 "y.tab.c"
    break;

  case 10: /* Type: INT  */
#line 148 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Int, NULL);
                        }
#line 1514 "y.tab.c"
    break;

  case 11: /* Type: FLOAT32  */
#line 152 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Float32, NULL);    
                        }
#line 1522 "y.tab.c"
    break;

  case 12: /* Type: BOOL  */
#line 156 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Bool, NULL);
                        }
#line 1530 "y.tab.c"
    break;

  case 13: /* Type: STRING  */
#line 160 "gocompiler.y"
                        {
                            (yyval.node) = new_node(String, NULL);
                        }
#line 1538 "y.tab.c"
    break;

  case 14: /* FuncDecl: FUNC IDENTIFIER LPAR OptFuncParams RPAR OptType FuncBody  */
#line 176 "gocompiler.y"
                        {
                            (yyval.node) = new_node(FuncDecl, NULL);
                            
                            struct node *new_func_header = new_node(FuncHeader, NULL);
                            add_child((yyval.node), new_func_header);
                            add_child(new_func_header, new_node(Identifier, (yyvsp[-5].lexeme)));
                            add_child(new_func_header, (yyvsp[-1].node));
                            add_child(new_func_header, (yyvsp[-3].node));

                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1554 "y.tab.c"
    break;

  case 15: /* OptFuncParams: FuncParams  */
#line 190 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1562 "y.tab.c"
    break;

  case 16: /* OptFuncParams: %empty  */
#line 194 "gocompiler.y"
                        {
                            (yyval.node) = new_node(FuncParams, NULL);
                        }
#line 1570 "y.tab.c"
    break;

  case 17: /* OptType: Type  */
#line 200 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1578 "y.tab.c"
    break;

  case 18: /* OptType: %empty  */
#line 204 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1586 "y.tab.c"
    break;

  case 19: /* FuncParams: IDENTIFIER Type  */
#line 214 "gocompiler.y"
                        {
                            (yyval.node) = new_node(FuncParams, NULL);

                            struct node *new_param_decl = new_node(ParamDecl, NULL);
                            add_child((yyval.node), new_param_decl);
                            add_child(new_param_decl, (yyvsp[0].node));
                            add_child(new_param_decl, new_node(Identifier, (yyvsp[-1].lexeme)));
                        }
#line 1599 "y.tab.c"
    break;

  case 20: /* FuncParams: FuncParams COMMA IDENTIFIER Type  */
#line 223 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-3].node);
                            
                            struct node *new_param_decl = new_node(ParamDecl, NULL);
                            add_child((yyval.node), new_param_decl);
                            add_child(new_param_decl, (yyvsp[0].node));  
                            add_child(new_param_decl, new_node(Identifier, (yyvsp[-1].lexeme)));
                        }
#line 1612 "y.tab.c"
    break;

  case 21: /* FuncBody: LBRACE VarsAndStatements RBRACE  */
#line 238 "gocompiler.y"
                        {
                            (yyval.node) = new_node(FuncBody, NULL);
                            //add_child($$, new_node(If, NULL));
                            add_child((yyval.node), (yyvsp[-1].node));
                        
                        }
#line 1623 "y.tab.c"
    break;

  case 22: /* VarsAndStatements: VarsAndStatements SEMICOLON  */
#line 247 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-1].node);
                        }
#line 1631 "y.tab.c"
    break;

  case 23: /* VarsAndStatements: VarsAndStatements VarDecl SEMICOLON  */
#line 251 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1640 "y.tab.c"
    break;

  case 24: /* VarsAndStatements: VarsAndStatements Statement SEMICOLON  */
#line 256 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1649 "y.tab.c"
    break;

  case 25: /* VarsAndStatements: %empty  */
#line 261 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1657 "y.tab.c"
    break;

  case 26: /* Statement: IDENTIFIER ASSIGN Expr  */
#line 291 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Assign, NULL);
                            add_child((yyval.node), new_node(Identifier, (yyvsp[-2].lexeme)));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1667 "y.tab.c"
    break;

  case 27: /* Statement: LBRACE StarStatementSc RBRACE  */
#line 297 "gocompiler.y"
                        {
                            if(block_elements((yyvsp[-1].node)) > 1){
                                (yyval.node) = new_node(Block, NULL);
                                add_child((yyval.node), (yyvsp[-1].node));
                            }
                            else{
                                (yyval.node) = (yyvsp[-1].node);
                            }
                        }
#line 1681 "y.tab.c"
    break;

  case 28: /* Statement: IF Expr LBRACE StarStatementSc RBRACE OptElse  */
#line 307 "gocompiler.y"
                        {
                            (yyval.node) = new_node(If, NULL);
                            struct node* if_block = new_node(Block, NULL);
                            struct node* else_block = new_node(Block, NULL);
                            add_child((yyval.node), (yyvsp[-4].node));

                            add_child((yyval.node), if_block);
                            add_child(if_block, (yyvsp[-2].node));

                            add_child((yyval.node), else_block);
                            add_child(else_block, (yyvsp[0].node));
                        }
#line 1698 "y.tab.c"
    break;

  case 29: /* Statement: FOR OptExpr LBRACE StarStatementSc RBRACE  */
#line 320 "gocompiler.y"
                        {
                            (yyval.node) = new_node(For, NULL);
                            add_child((yyval.node), (yyvsp[-3].node));
                            struct node* for_block = new_node(Block, NULL);
                            add_child((yyval.node), for_block);
                            add_child(for_block, (yyvsp[-1].node));
                        }
#line 1710 "y.tab.c"
    break;

  case 30: /* Statement: RETURN OptExpr  */
#line 328 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Return, NULL);
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1719 "y.tab.c"
    break;

  case 31: /* Statement: FuncInvocation  */
#line 333 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1727 "y.tab.c"
    break;

  case 32: /* Statement: ParseArgs  */
#line 337 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1735 "y.tab.c"
    break;

  case 33: /* Statement: PRINT LPAR Expr RPAR  */
#line 341 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Print, NULL);

                            //add_child($$, new_node(For, NULL));
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1746 "y.tab.c"
    break;

  case 34: /* Statement: PRINT LPAR STRLIT RPAR  */
#line 348 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Print, NULL);
                            add_child((yyval.node), new_node(StrLit, (yyvsp[-1].lexeme)));
                        }
#line 1755 "y.tab.c"
    break;

  case 35: /* Statement: error  */
#line 352 "gocompiler.y"
                                                                                {;}
#line 1761 "y.tab.c"
    break;

  case 36: /* StarStatementSc: StarStatementSc Statement SEMICOLON  */
#line 356 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1770 "y.tab.c"
    break;

  case 37: /* StarStatementSc: %empty  */
#line 361 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1778 "y.tab.c"
    break;

  case 38: /* OptElse: ELSE LBRACE StarStatementSc RBRACE  */
#line 367 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-1].node);
                        }
#line 1786 "y.tab.c"
    break;

  case 39: /* OptElse: %empty  */
#line 371 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1794 "y.tab.c"
    break;

  case 40: /* OptExpr: Expr  */
#line 377 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1802 "y.tab.c"
    break;

  case 41: /* OptExpr: %empty  */
#line 381 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1810 "y.tab.c"
    break;

  case 42: /* ParseArgs: IDENTIFIER COMMA BLANKID ASSIGN PARSEINT LPAR CMDARGS LSQ Expr RSQ RPAR  */
#line 387 "gocompiler.y"
                        {
                            (yyval.node) = new_node(ParseArgs, NULL);
                            add_child((yyval.node), new_node(Identifier, (yyvsp[-10].lexeme)));
                            //add_child($$, new_node(Identifier, $3));
                            //add_child($$, $6);
                            add_child((yyval.node), (yyvsp[-2].node));
                        }
#line 1822 "y.tab.c"
    break;

  case 43: /* ParseArgs: IDENTIFIER COMMA BLANKID ASSIGN PARSEINT LPAR error RPAR  */
#line 394 "gocompiler.y"
                                                                                 {;}
#line 1828 "y.tab.c"
    break;

  case 44: /* FuncInvocation: IDENTIFIER LPAR PosExpr RPAR  */
#line 398 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Call, NULL);
                            add_child((yyval.node), new_node(Identifier, (yyvsp[-3].lexeme)));
                            add_child((yyval.node), (yyvsp[-1].node));
                        }
#line 1838 "y.tab.c"
    break;

  case 45: /* FuncInvocation: IDENTIFIER LPAR error RPAR  */
#line 403 "gocompiler.y"
                                                                                 {;}
#line 1844 "y.tab.c"
    break;

  case 46: /* PosExpr: Expr  */
#line 407 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 1852 "y.tab.c"
    break;

  case 47: /* PosExpr: Expr COMMA PosExpr  */
#line 411 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-2].node);
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1861 "y.tab.c"
    break;

  case 48: /* PosExpr: %empty  */
#line 416 "gocompiler.y"
                        {
                            (yyval.node) = new_node(AUX, NULL);
                        }
#line 1869 "y.tab.c"
    break;

  case 49: /* Expr: Expr OR Expr  */
#line 422 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Or, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1879 "y.tab.c"
    break;

  case 50: /* Expr: Expr AND Expr  */
#line 428 "gocompiler.y"
                        {
                            (yyval.node) = new_node(And, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1889 "y.tab.c"
    break;

  case 51: /* Expr: Expr LT Expr  */
#line 435 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Lt, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1899 "y.tab.c"
    break;

  case 52: /* Expr: Expr GT Expr  */
#line 441 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Gt, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1909 "y.tab.c"
    break;

  case 53: /* Expr: Expr EQ Expr  */
#line 447 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Eq, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1919 "y.tab.c"
    break;

  case 54: /* Expr: Expr NE Expr  */
#line 453 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Ne, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1929 "y.tab.c"
    break;

  case 55: /* Expr: Expr LE Expr  */
#line 459 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Le, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1939 "y.tab.c"
    break;

  case 56: /* Expr: Expr GE Expr  */
#line 465 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Ge, NULL);
                        }
#line 1947 "y.tab.c"
    break;

  case 57: /* Expr: Expr PLUS Expr  */
#line 470 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Add, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1957 "y.tab.c"
    break;

  case 58: /* Expr: Expr MINUS Expr  */
#line 476 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Sub, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1967 "y.tab.c"
    break;

  case 59: /* Expr: Expr STAR Expr  */
#line 482 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Mul, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1977 "y.tab.c"
    break;

  case 60: /* Expr: Expr DIV Expr  */
#line 488 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Div, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1987 "y.tab.c"
    break;

  case 61: /* Expr: Expr MOD Expr  */
#line 494 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Mod, NULL);
                            add_child((yyval.node), (yyvsp[-2].node));
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 1997 "y.tab.c"
    break;

  case 62: /* Expr: MINUS Expr  */
#line 501 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Minus, NULL);
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 2006 "y.tab.c"
    break;

  case 63: /* Expr: NOT Expr  */
#line 506 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Not, NULL);
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 2015 "y.tab.c"
    break;

  case 64: /* Expr: PLUS Expr  */
#line 511 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Plus, NULL);
                            add_child((yyval.node), (yyvsp[0].node));
                        }
#line 2024 "y.tab.c"
    break;

  case 65: /* Expr: NATURAL  */
#line 516 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Natural, (yyvsp[0].lexeme));
                        }
#line 2032 "y.tab.c"
    break;

  case 66: /* Expr: DECIMAL  */
#line 520 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Decimal, (yyvsp[0].lexeme));
                        }
#line 2040 "y.tab.c"
    break;

  case 67: /* Expr: IDENTIFIER  */
#line 524 "gocompiler.y"
                        {
                            (yyval.node) = new_node(Identifier, (yyvsp[0].lexeme));
                        }
#line 2048 "y.tab.c"
    break;

  case 68: /* Expr: FuncInvocation  */
#line 528 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[0].node);
                        }
#line 2056 "y.tab.c"
    break;

  case 69: /* Expr: LPAR Expr RPAR  */
#line 532 "gocompiler.y"
                        {
                            (yyval.node) = (yyvsp[-1].node);
                        }
#line 2064 "y.tab.c"
    break;

  case 70: /* Expr: LPAR error RPAR  */
#line 535 "gocompiler.y"
                                                                                {;}
#line 2070 "y.tab.c"
    break;


#line 2074 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 541 "gocompiler.y"


// all needed functions are collected in the .l and ast.* files
