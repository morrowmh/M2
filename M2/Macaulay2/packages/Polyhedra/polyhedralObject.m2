-- Defining the new type PolyhedralObject
PolyhedralObject = new Type of PolyhedraHash
globalAssignment PolyhedralObject

-- PURPOSE : Giving the defining affine hyperplanes
--   INPUT : 'P'  a Polyhedron or Cone 
--  OUTPUT : '(N,w)', where M and v are matrices and P={x in HS | Nx=w}, where 
--		 HS is the intersection of the defining affine half-spaces
--     for cones, 'w' is omitted.
hyperplanes = method()
hyperplanes PolyhedralObject := P -> P#"hyperplanes"

-- PURPOSE : Giving a basis of the lineality space
linSpace = method(TypicalValue => Matrix)
linSpace PolyhedralObject := P -> P#"linealitySpace"

-- PURPOSE : Giving the defining affine half-spaces
--   INPUT : 'P'  a Polyhedron or Cone
--  OUTPUT : '(M,v)', where M and v are matrices and P={x in H | Mx<=v}, where 
--		 H is the intersection of the defining affine hyperplanes
--     for cones, 'v' is omitted.
halfspaces = method()
halfspaces PolyhedralObject := P -> P#"halfspaces"

-- PURPOSE : Giving the rays
--   INPUT : 'P'  a Polyhedron or Cone
--  OUTPUT : a Matrix, containing the rays of P as column vectors
rays = method()
rays PolyhedralObject := P -> P#"rays"

