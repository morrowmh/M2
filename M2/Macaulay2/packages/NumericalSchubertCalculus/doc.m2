doc ///
   Key
      skewSchubertVariety
   Headline
      skew Schubert variety (or Richardson variety) from partitions $l$ and $m$
   Usage
      skewSchubertVariety(kn,l,m)
   Inputs
      kn:Sequence
         two integers denoting the Grassmannian Gr(k,n)
      l:List
      m:List
         partitions of n
   Outputs
      :Matrix
   Description
      Text
         Creates the matrix $E_{l,m}$ that parametrizes the skew Schubert variety $Y_{l,m} = Y_l \cap Y_m$.
      Example
         -- for l = 2,1 and m = 1,1
       	 -- in Gr(3,7)
      	 skewSchubertVariety( (3,7),{2,1},{1,1} )
   SeeAlso
         solveSimpleSchubert
///;

doc ///
   Key
      createRandomFlagsForSimpleSchubert
   Headline
      Create a list of flags with random numbers to solve a simple Schubert problem
   Usage
      createRandomFlagsForSimpleSchubert(kn,l,m)
   Inputs
      kn:Sequence
         two integers denoting the Grassmannian Gr(k,n)
      l:List
      m:List
         partitions of n
   Outputs
      :List
         random fixed flags
   Description
      Text
         Creates a list of d matrices with random numbers, where $d = k*(n-k)-|m|-|l|$.
      Example
         -- for l = 2,1 and m = 1,1
      	 -- in Gr(3,7)
      	 createRandomFlagsForSimpleSchubert((3,7),{2,1,0},{1,1,0})
   SeeAlso
         solveSimpleSchubert
///;

doc ///
   Key
      solveSimpleSchubert
   Headline
      Uses Pieri Homotopy continuation to solve simple Schubert problems
   Usage
      solveSimpleSchubert(kn,l,m,G)
   Inputs
      kn:Sequence
         two integers denoting the Grassmannian Gr(k,n)
      l:List
      m:List
         partitions of n
      G:List
         of fixed Flags G_1,...,G_d
   Outputs
      :List
         solutions of the simple Schubert Problem defined by l and m with respect to the flags G_1,...,G_d
   Description
      Text
         Given partitions $l$ and $m$ in the Grassmannian $Gr(k,n)$, and a set of fixed flags $G_1,...,G_d$, where $d=k*(k-n) - |l| - |m|$. The function solves the system taking the first $d-1$ flags, and replacing the last one for a simpler one $G_m$. Then it uses homotopy continuation to track the solutions of this simpler system to solutions of the original system.         
    	 This function is used to solve Simple Schubert Problems, as described in the paper:          
    	 Leykin and Sottile, "Galois groups of Schubert problems via homotopy continuation", Mathematics of Computation, 78 (2009) 1749--1765.
      Example
         ---- Simple Schubert Problem
       	 k = 3
	 n = 7
       	 l = {2,1,0}
       	 m = {1,1,0}
       	 ----  Generate random flags G----
       	 d = k*(n-k)-sum(l)-sum(m);
       	 G = apply(d, i->matrix apply(n-k,i->apply(n,j->random FFF)));
       	 ---------------------------------
       	 solveSimpleSchubert((k,n),l,m,G)
   SeeAlso
         createRandomFlagsForSimpleSchubert 
         skewSchubertVariety
///;

doc ///
    Key
       trackSimpleSchubert
    Headline
       Uses Homotopy continuation to solve a Schubert problem
    Usage
       trackSimpleSchubert(kn,cond, G, F)
    Inputs
       kn:Sequence
          two integers (k,n) denoting the Grassmannian Gr(k,n)
       cond:Sequence
          of two partitions of n
       G:List
          of starting Flags G_1,..., G_d
       F:List
          of target Flags F_1,...,F_d
    Outputs
       :List
          solutions of the Schubert problem defined by l and m with respect to the flags F_1,...,F_d
    Description
       Text
          Given partitions $l$ and $m$ in the Grassmannian $Gr(k,n)$, and two sets of fixed flags $G_1,...,G_d$, and $F_1,...,F_d$; where $d=k*(k-n) - |l| - |m|$. The function tracks the solutions of the system defined by $G_1,...,G_d$ (if the solutions are not given, it computes them using {\tt solveSimpleSchubert}) to find solutions for the system defined by $F_1,...,F_d$. 
       Example
          ---- Simple Schubert Problem
   	  (k,n) = (3,7)
   	  l = {2,1,0}
   	  m = {1,1,0}
   	  ----  Generate random flags G and F----
   	  d = k*(n-k)-sum(l)-sum(m);
   	  G = apply(d, i->matrix apply(n-k,i->apply(n,j->random FFF)));
   	  F = apply(d, i->matrix apply(n-k,i->apply(n,j->random FFF)));
   	  ---------------------------------
   	  trackSimpleSchubert((k,n),(l,m),G,F)
       Text
          If the solutions of the system defined by $G_1,...,G_d$ are given, they can be given in the function to avoid unnecessary computations
       Example
          ---- Simple Schubert Problem
   	  (k,n) = (3,7)
   	  l = {2,1,0}
   	  m = {1,1,0}
   	  ----  Generate random flags G and F----
   	  d = k*(n-k)-sum(l)-sum(m);
   	  G = apply(d, i->matrix apply(n-k,i->apply(n,j->random FFF)));
   	  F = apply(d, i->matrix apply(n-k,i->apply(n,j->random FFF)));
   	  ---------------------------------
   	  Solns = solveSimpleSchubert((k,n),l,m,G);
          trackSimpleSchubert((k,n),(l,m),G,F, StartSolutions=>Solns)
   SeeAlso
      solveSimpleSchubert
      createRandomFlagsForSimpleSchubert
///;

doc ///
   Key
      findGaloisElement
   Headline
      computes a permutation from a loop of an instance of a simple Schubert problem.
   Usage
      findGaloisElement(pblm, flag, solns)
   Inputs
      pblm:Sequence
         a sequence (l,m,k,n) that contains two partitions l,m and two integers k,n that define the simple Schubert problem l,m in the Grassmannian Gr(k,n)
      flag:List
         a list of numerical matrices that define an instance of the simple Schubert Problem
      solns:List
         solutions of the specific instance
   Outputs
      :List
         a permutation that lie in the Galois group
   Description
      Text
         Given a simple Schubert problem $(l,m)$ in $Gr(k,n)$. Fix a 
	 set of flags $F_1,...,F_d$ and let $S$ be the set of solutions of
	 the intance of the Schubert problem given by the flags $\{F_i\}$.
	 We compute a loop in the problem space based on the solution $S$
	 by deforming one of the flags $F_i$ using Homotopy continuation. 
	 This  generates a loop in the problem space, which corresponds to 
	 a permutation in the Galois group.
      Example
         l={1,1}
	 m={2,1}
	 (k,n) = (3,7)
      Text
	 Generate a random set of flags to compute an instance of the problem	 
      Example
	 G = createRandomFlagsForSimpleSchubert((k,n),l,m)	 
      Text
         Solve the problem
      Example
	 S = solveSimpleSchubert((k,n),l,m,G);
      Text
         This is a problem with 77 solutions
      Example
	 #S
      Text
	 an element of the Galois group is:
      Example
	 findGaloisElement((l,m,k,n), G, S)
   SeeAlso
      isFullSymmetric
      isGaloisFullSymmetric 
      solveSimpleSchubert
      createRandomFlagsForSimpleSchubert
///;

doc ///
   Key
      isFullSymmetric
   Headline
      Check if a list of permutations generate the full symmetric group.
   Usage
      isFullSymmetric(P)
   Inputs
      P:List
         of Lists of permutations
   Outputs
      :Boolean
   Description
      Text
         Takes a list of permutations of {1,...,n} and uses GAP to check if those generate the symmetric group $S_n$.
   Caveat
      It assumes that GAP runs when you type {\tt gap} in a terminal      
///;

doc ///
   Key
      isGaloisFullSymmetric
   Headline
      find Galois elements of a simple Schubert Problem until they generate the full symmetric group
   Usage
      isGaloisFullSymmetric(pblm, flag, solns, mx)
   Inputs
      pblm:Sequence
         a sequence (l,m,k,n) that contains two partitions l,m and two integers k,n that define the simple Schubert problem l,m in the Grassmannian Gr(k,n)
      flag:List
         a list of numerical matrices that define an instance of the simple Schubert Problem
      solns:List
         solutions of the specific instance
      mx:ZZ
         the maximum number of loops you want to run
   Outputs
      :Boolean
			   If the answer is true, it will output the number of loops it needed; if false it will output the permutations it tried
   Description
      Text
         It runs a loop to find elements of the Galois group until it find a generating set or die after {\tt mx} tries.
      Example
         l={1,1}
         m={2,1}
         (k,n) = (3,7)
      Text
         Generate a random set of flags to compute an instance of the problem	 
      Example
         G = createRandomFlagsForSimpleSchubert((k,n),l,m)	 
      Text
         Solve the Schubert problem
      Example
         S = solveSimpleSchubert((k,n),l,m,G);
      Text
         Check if the Galois group is the symmetric group
      Example
         isGaloisFullSymmetric((l,m,k,n), G, S, 5)
      Text 
          one permutation is not enough
      Example
          isGaloisFullSymmetric((l,m,k,n), G, S, 1)
   SeeAlso
      isFullSymmetric
      findGaloisElement
   Caveat
      This assumes that GAP runs when you type in the terminal {\tt gap} and that we already know that the Galois group is the full symmetric group, otherwise it will output {\tt false} after {\tt mx} repetitions.
///;

