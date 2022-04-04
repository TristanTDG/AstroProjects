function body = celestialBody(radius,coords)
[X1 Y1 Z1] = sphere(40);
body = surf(X1*radius-coords(1), Y1*radius-coords(2), Z1*radius-coords(3), 'FaceAlpha', 0.2, 'EdgeColor', 'none');
camproj('perspective');
axis equal
xlabel('x')
ylabel('y')
hold on
end
