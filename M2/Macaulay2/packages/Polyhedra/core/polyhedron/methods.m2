-- PURPOSE : Computing the inner normalFan of a polyhedron
--   INPUT : 'P',  a Polyhedron
--  OUTPUT : 'F',  a Fan, the inner normalFan of 'P'
normalFan = method(TypicalValue => Fan)
normalFan Polyhedron := P -> (
   getProperty(P, computedNormalFan)
)      


vertices Polyhedron := P -> (
   getProperty(P, computedVertices)
)


-- PURPOSE : Tests if a Polyhedron is empty
--   INPUT : 'P'  a Polyhedron
--  OUTPUT : 'true' or 'false'
isEmpty = method(TypicalValue => Boolean)
isEmpty Polyhedron := P -> getProperty(P, empty)


-- PURPOSE : Tests if a Polyhedron is compact
--   INPUT : 'P'  a Polyhedron
--  OUTPUT : 'true' or 'false'
isCompact = method(TypicalValue => Boolean)
isCompact Polyhedron := P -> getProperty(P, computedCompact)


-- PURPOSE : Computing the lattice points of a compact Polyhedron 
--   INPUT : 'P',  a Polyhedron
--  OUTPUT : 'L',  a list containing the lattice points of 'P'
latticePoints = method(TypicalValue => List)
latticePoints Polyhedron := P -> (
   getProperty(P, computedLatticePoints)
)



-- PURPOSE: Getting data from the vertex side that determines polyhedron
--          completely, avoid fourierMotzkin. Always pick best possible data.
getSufficientVertexData = method()
getSufficientVertexData Polyhedron := P -> (
   if hasProperties(P, {computedVertices, computedRays, computedLinealityBasis}) then (
      return(vertices P, rays P, linealitySpace P)
   ) else if hasProperties(P, {points, inputRays, inputLinealityGenerators}) then (
      return (
         getProperty(P, points),
         getProperty(P, inputRays),
         getProperty(P, inputLinealityGenerators)
      )
   ) else (
      return(vertices P, rays P, linealitySpace P)
   )
)
