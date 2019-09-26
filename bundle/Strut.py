import numpy as np
from numpy import arctan2, cos, sin

class StrutSolver:

    def __init__():
        pass


    def solve(mesh, forces, displacements):
        nodes = mesh.nodes
        elements = mesh.elements
        angles = self._elementAngles(nodes, elements)
        kMatrices = self._KMatrices(angles)
        pass


    def _KMatrices(angles):
        matrices = []

        for angle in angles:
            c = cos(angle)
            s = sin(angle)
            cs = c*s
            c2 = c**2
            s2 = s**2
            matrices.append([
                [ c2,  cs, -c2, -cs],
                [ cs,  s2, -cs, -s2],
                [-c2, -cs,  c2,  cs],
                [-cs, -s2,  cs,  s2]
            ])

        return matrices


    def _elementAngles(nodes, elements):
        angles = []

        for element in elements:
            dx = nodes[element[1]][0] - nodes[element[0]][0]
            dy = nodes[element[1]][1] - nodes[element[0]][1]
            angles.append(arctan2(dy, dx))

        return angles
