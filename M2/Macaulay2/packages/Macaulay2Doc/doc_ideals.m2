-- -*- coding: utf-8 -*-
document {
     Key => (symbol _*,Ideal),
     Headline => "get the list of generators of an ideal",
     Usage => "I_*",
     Inputs => {"I"},
     Outputs => {{"the list of generators of ", TT "I"}},
     EXAMPLE lines ///
     R = QQ[a..c]
     I = ideal (a,b,c);
     J = I^2
     J_*     
     ///
     }

document {
     Key => Ideal,
     Headline => "the class of all ideals",
     SeeAlso => "ideals",
     "For basic information about ideals in ", EM "Macaulay2", ", see ",
     TO "ideals", ".",
     PARA{},
     "Common ways to make an ideal:",
     UL {
	  TO "ideal",
	  TO "Saturation :: annihilator",
	  TO "content",
	  TO "fittingIdeal",
	  TO (kernel, RingMap),
	  TO minors,
	  TO pfaffians
  	  },
     "Common ways to get information about an ideal:",
     UL {
	  TO (generators, Ideal),
	  TO (symbol _*,Ideal),
	  TO (isSubset, Ideal, Ideal),
	  TO "MinimalPrimes :: isPrime(Ideal)"
	  },
     "Common operations on ideals:",
     UL {
	  TO (symbol +,Ideal,Ideal),
	  TO (symbol *,Ideal,Ideal),
	  TO (symbol ==,Ideal,Ideal),
	  TO (symbol ==,Ideal,ZZ),
	  TO (symbol ^,Ideal,ZZ),
	  TO (trim, Ideal)
	  },
     "Gröbner bases, normal forms, free resolutions",
     UL {
	  TO gb,
	  TO leadTerm,
	  TO codim,
	  TO dim,
	  TO (symbol%,Matrix,Ideal),
	  TO resolution,
	  TO betti
	  },
     "Numeric information about homogeneous ideals",
     UL {
	  TO degree,
	  TO poincare,
	  TO hilbertFunction,
	  TO hilbertPolynomial,
	  TO hilbertSeries,
	  TO genera,
	  TO euler
	  },
     "Primary decomposition and components of an ideal",
     UL {
	  TO "MinimalPrimes::minimalPrimes",
	  TO "MinimalPrimes::radical",
	  TO "PrimaryDecomposition::associatedPrimes",
	  TO "PrimaryDecomposition::primaryDecomposition",
	  TO "PrimaryDecomposition::topComponents",
	  TO "Saturation :: saturate(Ideal,Ideal)",
	  TO "Saturation :: Ideal : Ideal",
	  TO intersect
	  },
     "Ideals from geometry",
     UL {
	  TO Fano,
	  TO Grassmannian,
	  TO monomialCurveIdeal,
	  TO singularLocus
	  },
     "Common ways to use an ideal:",
     UL {
	  TO (symbol /, Ring, Ideal),
	  },
     PARA{},
     "An ideal ", TT "I", " is an immutable object, so if you want to 
     cache information about it, put it in the hash table ", TT "I.cache", "."
     }
document {
     Key => {(symbol *,Ideal,Ideal),
	  (symbol *,Ideal,MonomialIdeal),
	  (symbol *,MonomialIdeal,Ideal)
	  },
     Headline => "product of ideals",
     Usage => "I * J",
     Inputs => { "I", "J" => {"in the same ring as ", TT "I"},
	  },
     Outputs => {
	  {"the product of the two ideals ", TT "I", " and ", TT "J", ""}
	  },
     EXAMPLE {
	  "R = QQ[t][a..d];",
	  "I = ideal(a,(t+1)*c) * ideal(a^2,b^2)"
	  },
     "The generators produced are not generally minimal.  Use ",
     TO (trim,Ideal), " or ", TO (mingens,Ideal), " to find a smaller
     generating set.",
     SeeAlso => {"ideals"}
     }
document {
     Key => {(symbol +,Ideal,Ideal),
	  (symbol +,Ideal,MonomialIdeal),
	  (symbol +,MonomialIdeal,Ideal)
	  },
     Headline => "sum of ideals",
     Usage => "I + J",
     Inputs => { "I", "J" => {"in the same ring as ", TT "I"}, },
     Outputs => {
	  {"the sum of the two ideals ", TT "I", " and ", TT "J", ""}
	  },
     EXAMPLE {
	  "R = QQ[t][a..d];",
	  "I = ideal(a,(t+1)*c) + ideal(a^2,b^2)"
	  },
     "The generators produced are not generally minimal.  Use ",
     TO (trim,Ideal), " or ", TO (mingens,Ideal), " to find a smaller
     generating set.",
     EXAMPLE {
	  "trim I"
	  },
     SeeAlso => {"ideals"}
     }
document {
     Key => {(symbol ^,Ideal,ZZ),
	  (symbol ^,MonomialIdeal,ZZ)
	  },
     Headline => "power of an ideal",
     Usage => "I^n",
     Inputs => { "I", "n" => {"at least zero"}, },
     Outputs => { {"the ideal ", TT "I^n"} },
     EXAMPLE {
	  "R = QQ[a..d];",
	  "I = ideal(a^2, b^2-c*d);",
	  "I^3"
	  },
     "The generators produced are often not minimal.  Use ",
     TO (trim,Ideal), " or ", TO (mingens,Ideal), " to find a smaller
     generating set.",
     EXAMPLE {
	  "trim I^3"
	  },
     SeeAlso => {"ideals"}
     }
document {
     Key => {(symbol ^,Ideal,Array),
	     (symbol ^,MonomialIdeal,Array)
	  },
     Headline => "bracket power of an ideal",
     Usage => "I^e",
     Inputs => { "I", "e" => {"array of positive integers"}, },
     Outputs => { {"the ideal ", TT "I^e"} },
     "The bracket power of an ideal is defined to be the
     ideal generated by the image of the generators under the ring
     homomorphism given by sending a variable to the corresponding power.
     The array may either be a singleton, as follows:",
     EXAMPLE {
	  "R = QQ[a..d];",
	  "I = ideal(a^2*b, a*b^2,c^3,d^5);",
	  "I^[3]"
	  },
     "One may also give an array that is the same length as the number
     of variables in the ring, as follows:",
     EXAMPLE {
	 "I^[2,3,4,5]"
     },
     "If your ring is a tower, then the bracket power will raise the outermost
     variables to powers.",
     EXAMPLE {
     	 "S = QQ[x,y];",
	 "T = S[z,w];",
	 "I = ideal gens T;",
	 "I^[3]",
	 "I^[2,3]"
     },
     "No check is made to determine whether the function given by exponentiating
     the generators is a ring homomorphism.  Of course, this only is an issue when
     taking bracket powers of ideals in a quotient ring.  One important case where the bracket
     power is useful is when studying Frobenius powers of ideals, which corresponds to the
     image of the ideal under the Frobenius automorphism.",
     EXAMPLE {
        "R = ZZ/5[a..d];",
	"I = minors(2,matrix {{a,b,c},{b,c,d}});",
	"S = R/I;",
    	"J = ideal vars S",
	"J^[5]"
     },
     SeeAlso => {"ideals"}
     }

doc ///
Node
  Key
    monomialCurveIdeal
  Headline
    make the ideal of a monomial curve
  Usage
    I = monomialCurveIdeal(R, a)
  Inputs
    R:PolynomialRing
      over a field
    a:List
      containing integers to be used as exponents in the parametrization of a rational curve
  Outputs
    I:Ideal
      corresponding to the projective curve given parametrically on
      an affine piece by $t \mapsto (t^{a_0}, \dots, t^{a_n})$
  Description
    Text
      The ideal is defined in the polynomial ring $R$, which must have at least $n+1$ variables,
      preferably all of equal degree. The first $n+1$ variables in the ring are used.

      @SUBSECTION "A plane quintic curve of genus 6"@
    Example
      R = ZZ/101[a..f]
      monomialCurveIdeal(R, {3, 5})
    Text
      @SUBSECTION "A genus 2 curve with one singular point"@
    Example
      monomialCurveIdeal(R, {3, 4, 5})
    Text
      @SUBSECTION "A genus 7 curve with two singular points"@
    Example
      monomialCurveIdeal(R, {6, 7, 8, 9, 11})
    Text
      @SUBSECTION "The smooth rational quartic in $\\PP^3$"@
    Example
      monomialCurveIdeal(R, {1, 3, 4})
///
